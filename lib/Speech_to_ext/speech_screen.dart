import 'package:flutter/material.dart';
import 'package:image_example/widget/custom_app_bar.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechScreen extends StatefulWidget {
  const SpeechScreen({Key? key}) : super(key: key);

  @override
  State<SpeechScreen> createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {
  bool isListen = false;
  SpeechToText speechToText = SpeechToText();
  String text = "Speech to text";

  @override
  void dispose() {
    speechToText.stop();
    super.dispose();
  }

  Future<void> toggleListening() async {
    bool available = await speechToText.initialize();
    if (available) {
      setState(() {
        isListen = !isListen;
        if (isListen) {
          speechToText.listen(
            onResult: (result) {
              setState(() {
                text = result.recognizedWords;
              });
            },
          );
        } else {
          speechToText.stop();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomMyAppBar(title: "Speech to Text"),
      body: Container(
        alignment: Alignment.center,
        child: Text(text),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: toggleListening,
        child: Icon(isListen ? Icons.stop : Icons.mic),
      ),
    );
  }
}
