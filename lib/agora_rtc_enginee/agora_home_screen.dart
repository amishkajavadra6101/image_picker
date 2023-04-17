import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_example/agora_rtc_enginee/video_call.dart';

const appId = "e6e86fdf3bf343cfbb9a05ebe259e109";
const token =
    "007eJxTYAjoM1Sb8Evq4PHLxqend4klz/4SuSsxrUXq7cu2M5rFnrsUGFLNUi3M0lLSjJPSjE2Mk9OSkiwTDUxTk1KNTC1TDQ0sGXPMUhoCGRkW2vqzMjJAIIjPwlCSWlzCwAAAoGEgCg==";

class AgoraHome extends StatefulWidget {
  const AgoraHome({Key? key}) : super(key: key);

  @override
  State<AgoraHome> createState() => _AgoraHomeState();
}

class _AgoraHomeState extends State<AgoraHome> {
  final TextEditingController _channelController = TextEditingController();

  Future<void> _joinChannel() async {
    final String channelName = _channelController.text.trim();
    if (channelName == 'test') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => VideoCall(
            channel: channelName,
            token: token,
          ),
        ),
      );
    } else {
      Fluttertoast.showToast(
          msg: "please enter correct channel name",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.black54,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Join a Channel"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Enter a channel name',
                    labelText: 'channel name',
                    icon: Icon(Icons.edit)),
                controller: _channelController,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: _joinChannel,
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: const Text(
                      "Join Channel",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
