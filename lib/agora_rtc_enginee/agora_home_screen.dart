import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_example/agora_rtc_enginee/video_call.dart';

const appId = "e6e86fdf3bf343cfbb9a05ebe259e109";
const token =
    "007eJxTYFA6E9MebnldhPP54V+Bz7iKJuqofk0vbdjJvfHDjStB54wUGEzSjJONjNKME42STUwMktIsU8yByMLYJNHM0tIk1ej4aZuUhkBGhjwfJ0ZGBggE8dkYkotSE0tSGRgArdEgcg==";
const channel = "create";

class AgoraHome extends StatefulWidget {
  const AgoraHome({Key? key}) : super(key: key);

  @override
  State<AgoraHome> createState() => _AgoraHomeState();
}

class _AgoraHomeState extends State<AgoraHome> {
  final TextEditingController _channelController = TextEditingController();
  final TextEditingController _createchannelController =
      TextEditingController();

  Future<void> _joinChannel() async {
    final String channelName = _channelController.text.trim();
    if (channelName == channel) {
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
                    hintText: 'channel name',
                    labelText: 'Create channel',
                    icon: Icon(Icons.text_fields_outlined)),
                controller: _createchannelController,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {},
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: const Text(
                      "create Channel",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: 'channel name',
                    labelText: 'Enter channel name',
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
