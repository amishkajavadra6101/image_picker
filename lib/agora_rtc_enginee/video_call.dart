import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

const appId = "4f3c22f3a2c440bf9d79d7834a6994e2";
const token =
    "007eJxTYBDlnLBVZV5+/RrVc7xfVq3pOf+zz4ifu5pBo+7Ag4cv5O4oMJikGScbGaUZJxolm5gYJKVZppgDkYWxSaKZpaVJqtHHRLuUhkBGhtOrT7AwMkAgiM/GkFyUmliSysAAAJWZIPI=";
const channel = "create";

// ignore: must_be_immutable
class VideoCall extends StatefulWidget {
  const VideoCall({
    Key? key,
  }) : super(key: key);

  @override
  State<VideoCall> createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  // int? _localUid;
  // int? _remoteUid;
  final List<int> _remoteUsers = [];
  bool _localUserJoined = false;
  int? localUid;
  bool _isMicMuted = false;
  bool _isCamOff = false;
  late RtcEngine engine;

  @override
  void initState() {
    super.initState();
    initAgora();
  }

  @override
  void dispose() {
    engine.leaveChannel();
    super.dispose();
  }

  final _colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  Future<void> initAgora() async {
    await [Permission.microphone, Permission.camera].request();
    engine = createAgoraRtcEngine();
    await engine.initialize(const RtcEngineContext(
      appId: appId,
      channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
    ));

    engine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapse) {
          debugPrint("local user ${connection.localUid} joined");
          setState(() {
            _localUserJoined = true;
            // _localUid = connection.localUid;
          });
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          debugPrint("remote user $remoteUid joined");
          setState(() {
            _remoteUsers.add(remoteUid);
          });
        },
        onUserOffline: (RtcConnection connection, int remoteUid,
            UserOfflineReasonType reason) {
          debugPrint("remote user $remoteUid left channel");
          debugPrint("user left that channel because of $reason");
          setState(() {
            _remoteUsers.remove(remoteUid);
          });
        },
        onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
          debugPrint(
              '[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
        },
      ),
    );
    await engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
    await engine.enableVideo();
    await engine.startPreview();
    await engine.joinChannel(
      token: token,
      channelId: channel,
      uid: 0,
      options: const ChannelMediaOptions(),
    );
  }

  void switchCamera() async {
    await engine.switchCamera();
  }

  void muteMic() async {
    await engine.muteLocalAudioStream(!_isMicMuted);
    setState(() {
      _isMicMuted = !_isMicMuted;
    });
  }

  void offVideo() async {
    setState(() {
      _isCamOff = !_isCamOff;
    });
    engine.enableLocalVideo(!_isCamOff);
  }

  void callEnd() async {
    await engine.leaveChannel();
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedTextKit(
          animatedTexts: [
            WavyAnimatedText(
              'Agora rtc engine Video Call',
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          _remoteUsers.isEmpty
              ? Center(
                  child: AnimatedTextKit(animatedTexts: [
                    TyperAnimatedText(
                      'Please wait for remote user to join',
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    ColorizeAnimatedText(
                      'Please wait for remote user to join',
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      colors: _colorizeColors,
                    ),
                  ]),
                )
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: _remoteUsers.length > 1 ? 2 : 1,
                      childAspectRatio: _remoteUsers.length == 1
                          ? MediaQuery.of(context).size.width /
                              MediaQuery.of(context).size.height
                          : 9 / 16
                      // childAspectRatio: _remoteUsers.length > 1 ? 9 / 16 : 1,
                      ),
                  itemCount: _remoteUsers.length,
                  itemBuilder: (context, index) {
                    int uid = _remoteUsers[index];
                    return SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: AgoraVideoView(
                        controller: VideoViewController.remote(
                          rtcEngine: engine,
                          canvas: VideoCanvas(uid: uid),
                          connection: const RtcConnection(channelId: channel),
                        ),
                      ),
                    );
                  },
                ),
          Positioned(
            right: 16,
            bottom: 16,
            child: SizedBox(
              width: 120,
              height: 160,
              child: Center(
                child: _localUserJoined
                    ? AgoraVideoView(
                        controller: VideoViewController(
                          rtcEngine: engine,
                          canvas: const VideoCanvas(uid: 0), //_localUid),
                        ),
                      )
                    : const CircularProgressIndicator(),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: switchCamera,
            heroTag: 'switchCamera',
            child: const Icon(Icons.switch_camera),
          ),
          FloatingActionButton(
            onPressed: muteMic,
            heroTag: 'muteMic',
            backgroundColor: _isMicMuted ? Colors.grey : null,
            child:
                _isMicMuted ? const Icon(Icons.mic_off) : const Icon(Icons.mic),
          ),
          FloatingActionButton(
            onPressed: offVideo,
            heroTag: 'offCam',
            backgroundColor: _isCamOff ? Colors.grey : null,
            child: _isCamOff
                ? const Icon(Icons.videocam_off)
                : const Icon(Icons.videocam),
          ),
          FloatingActionButton(
            onPressed: callEnd,
            heroTag: 'endCall',
            backgroundColor: Colors.red,
            child: const Icon(Icons.call_end),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
