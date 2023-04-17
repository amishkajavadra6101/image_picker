// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import 'package:agora_uikit/agora_uikit.dart';
// import 'package:flutter/material.dart';
//
// const appId = "e6e86fdf3bf343cfbb9a05ebe259e109";
// const token =
//     "007eJxTYAjoM1Sb8Evq4PHLxqend4klz/4SuSsxrUXq7cu2M5rFnrsUGFLNUi3M0lLSjJPSjE2Mk9OSkiwTDUxTk1KNTC1TDQ0sGXPMUhoCGRkW2vqzMjJAIIjPwlCSWlzCwAAAoGEgCg==";
// const channel = "test";
//
// class VideoCall extends StatefulWidget {
//   const VideoCall({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<VideoCall> createState() => _VideoCallState();
// }
//
// class _VideoCallState extends State<VideoCall> {
//   int? _remoteUid;
//   bool _localUserJoined = false;
//   bool _isMicMuted = false;
//   bool _isCamOff = false;
//   late RtcEngine engine;
//
//   @override
//   void initState() {
//     super.initState();
//     initAgora();
//   }
//
//   Future<void> initAgora() async {
//     await [Permission.microphone, Permission.camera].request();
//     engine = createAgoraRtcEngine();
//     await engine.initialize(const RtcEngineContext(
//       appId: appId,
//       channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
//     ));
//
//     engine.registerEventHandler(
//       RtcEngineEventHandler(
//         onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
//           debugPrint("local user ${connection.localUid} joined");
//           setState(() {
//             _localUserJoined = true;
//           });
//         },
//         onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
//           debugPrint("remote user $remoteUid joined");
//           setState(() {
//             // _localUserJoined = true;
//             _remoteUid = remoteUid;
//           });
//         },
//         onUserOffline: (RtcConnection connection, int remoteUid,
//             UserOfflineReasonType reason) {
//           debugPrint("remote user $remoteUid left channel");
//           debugPrint("user left that channel because of $reason");
//           setState(() {
//             _remoteUid = null;
//           });
//         },
//         onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
//           debugPrint(
//               '[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
//         },
//       ),
//     );
//
//     await engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
//     await engine.enableVideo();
//     await engine.startPreview();
//     await engine.joinChannel(
//       token: token,
//       channelId: channel,
//       uid: _remoteUid ?? 0,
//       options: const ChannelMediaOptions(),
//     );
//   }
//
//   void switchCamera() async {
//     await engine.switchCamera();
//   }
//
//   void muteMic() async {
//     await engine.muteLocalAudioStream(!_isMicMuted);
//     setState(() {
//       _isMicMuted = !_isMicMuted;
//     });
//   }
//
//   void offVideo() async {
//     setState(() {
//       _isCamOff = !_isCamOff;
//     });
//     engine.enableLocalVideo(!_isCamOff);
//   }
//
//   void callEnd() async {
//     setState(() {
//       _remoteUid = null;
//       _localUserJoined = false;
//     });
//     await engine.leaveChannel();
//     Navigator.of(context).pop();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Agora Video Call'),
//       ),
//       body: Stack(
//         children: [
//           // Remote video
//           Center(
//             child: _remoteUid != null
//                 ? AgoraVideoView(
//                     controller: VideoViewController.remote(
//                       rtcEngine: engine,
//                       canvas: VideoCanvas(uid: _remoteUid),
//                       connection: const RtcConnection(channelId: channel),
//                     ),
//                   )
//                 : const Text(
//                     'Please wait for remote user to join',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//           ),
//
//           // Local video
//           Align(
//             alignment: Alignment.topLeft,
//             child: SizedBox(
//               width: 100,
//               height: 150,
//               child: Center(
//                 child: _localUserJoined
//                     ? AgoraVideoView(
//                         controller: VideoViewController(
//                           rtcEngine: engine,
//                           canvas: VideoCanvas(uid: _remoteUid ?? 0),
//                         ),
//                       )
//                     : const CircularProgressIndicator(),
//               ),
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           FloatingActionButton(
//             onPressed: switchCamera,
//             heroTag: 'switchCamera',
//             child: const Icon(Icons.switch_camera),
//           ),
//           FloatingActionButton(
//             onPressed: muteMic,
//             heroTag: 'muteMic',
//             backgroundColor: _isMicMuted ? Colors.grey : null,
//             child:
//                 _isMicMuted ? const Icon(Icons.mic_off) : const Icon(Icons.mic),
//           ),
//           FloatingActionButton(
//             onPressed: offVideo,
//             heroTag: 'offCam',
//             backgroundColor: _isCamOff ? Colors.grey : null,
//             child: _isCamOff
//                 ? const Icon(Icons.videocam_off)
//                 : const Icon(Icons.videocam),
//           ),
//           FloatingActionButton(
//             onPressed: callEnd,
//             heroTag: 'endCall',
//             backgroundColor: Colors.red,
//             child: const Icon(Icons.call_end),
//           ),
//         ],
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//     );
//   }
// }
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';

const appId = "4f3c22f3a2c440bf9d79d7834a6994e2";
// const token =
//     "007eJxTYKhZ/uNhc6F6rXZFYoT9zMutLX8VZ7LK/d6+1CW38fufIncFBpM042QjozTjRKNkExODpDTLFHMgsjA2STSztDRJNWI8aJ7SEMjIcODWDQZGKATx2RiSi1ITS1IZGADn0iGD";
// const channel = "create";

class VideoCall extends StatefulWidget {
  String channel;
  String token;
  VideoCall({
    Key? key,
    required this.channel,
    required this.token,
  }) : super(key: key);

  @override
  State<VideoCall> createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  int? _remoteUid;
  bool _localUserJoined = false;
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

  Future<void> initAgora() async {
    // retrieve permissions
    await [Permission.microphone, Permission.camera].request();

    /* it creates an instance of the Agora RTC engine, which is responsible for handling all the real-time communication operations.*/
    engine = createAgoraRtcEngine();

    /*initializes the engine with a configuration object that includes the app ID and channel profile.
     The app ID is a unique identifier that identifies your application in the Agora system,
     and the channel profile specifies the type of channel that will be used for the communication.*/
    await engine.initialize(const RtcEngineContext(
      appId: appId,
      /*channelProfile is a property that specifies the type of channel to be used for communication.
       It defines the overall behavior of the channel, including the number of users that can join, the audio and video quality
       and the type of communication allowed.
        There are two types of channel profiles in Agora:
        1 = ChannelProfileType.channelProfileCommunication: This profile is suitable for one-to-one or small group communication,
        where the number of users is limited to 17.
        2 = ChannelProfileType.channelProfileLiveBroadcasting: This profile is designed for large audience, such as in live events,
        online classes, or webinars.This profile supports up to 100,000 users in a single channel.*/
      channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
    ));

    engine.registerEventHandler(
      RtcEngineEventHandler(
        // it is called when the local user successfully joins a channel
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          //elapsed could be used to measure the time it takes to join the channel.
          /* RtcConnection object that represents the connection to the Agora server.
          It contains information about the connection, such as the local user ID, connection state, and network quality.*/
          debugPrint("local user ${connection.localUid} joined");
          setState(() {
            _localUserJoined = true;
          });
        },

        //it is called when a remote user joins the channel.
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          //remoteUid represents the user ID of the remote user who joined the channel.
          debugPrint("remote user $remoteUid joined");
          setState(() {
            _remoteUid = remoteUid;
          });
        },

        //This handler is called when a remote user leaves the channel
        onUserOffline: (RtcConnection connection, int remoteUid,
            UserOfflineReasonType reason) {
          debugPrint("remote user $remoteUid left channel");
          debugPrint("user left that channel because of $reason");
          setState(() {
            _remoteUid = null;
          });
        },

        /* it is called when the token used to join the channel is about to expire.
        This handler can be used to generate a new token and rejoin the channel without interruption.*/
        onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
          //the token is a security measure that ensures only authorized users can join a channel.

          debugPrint(
              '[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
        },
      ),
    );

    /*By setting the client's role as a broadcaster, the client is able to start broadcasting their video and audio streams to the channel,
     which can then be viewed by the audience who have joined the channel.
     Rtc provide two client role
     1 = ClientRoleType.clientRoleBroadcaster
     2 = ClientRoleType.clientRoleAudience
     */
    await engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);

    /*it is used to enable video functionality in the Agora engine. By calling this method, the local user's video is enabled,
     which means that the camera starts capturing the video and the video stream is sent to the Agora server.
     This is necessary when the local user wants to share their video with other users in the channel.
     Without calling enableVideo(),the local user's video will not be visible to other users in the channel, even if they join the channel successfully.*/
    await engine.enableVideo();

    /*it means the user will be able to see a preview of their own video stream before joining the channel.*/
    await engine.startPreview();

    //The joinChannel method is used to join a specific channel in the Agora Video SDK.
    await engine.joinChannel(
      token: widget.token,
      channelId: widget.channel,
      uid: 0,
      options: const ChannelMediaOptions(),
    );
  }

  //it is use for switch the camera
  void switchCamera() async {
    await engine.switchCamera();
  }

  //it is use for mute and unmute mic
  void muteMic() async {
    await engine.muteLocalAudioStream(!_isMicMuted);
    setState(() {
      _isMicMuted = !_isMicMuted;
    });
  }

  //it is use for turn off the camera
  void offVideo() async {
    setState(() {
      _isCamOff = !_isCamOff;
    });
    engine.enableLocalVideo(!_isCamOff);
  }

  //it is use for end call
  void callEnd() async {
    await engine.leaveChannel();
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agora Video Call'),
      ),
      body: Stack(
        children: [
          // Remote video
          Center(
            child: _remoteUid != null
                ? AgoraVideoView(
                    controller: VideoViewController.remote(
                      rtcEngine: engine,
                      canvas: VideoCanvas(uid: _remoteUid),
                      connection: RtcConnection(channelId: widget.channel),
                    ),
                  )
                : const Text(
                    'Please wait for remote user to join',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
          ),

          // Local video
          Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: 100,
              height: 150,
              child: Center(
                child: _localUserJoined
                    ? AgoraVideoView(
                        controller: VideoViewController(
                          rtcEngine: engine,
                          canvas: const VideoCanvas(uid: 0),
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
