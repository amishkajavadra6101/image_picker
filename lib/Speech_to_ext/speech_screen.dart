import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:image_example/widget/custom_app_bar.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechScreen extends StatefulWidget {
  const SpeechScreen({Key? key}) : super(key: key);

  @override
  State<SpeechScreen> createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {
  final ValueNotifier<bool> isListen = ValueNotifier<bool>(false);
  SpeechToText speechToText = SpeechToText();
  String dialogText = "";
  String text = "";
  @override
  void dispose() {
    speechToText.stop();
    super.dispose();
  }

  void onStartPressed() {
    isListen.value = true;
    toggleListening();
  }

  void onStopPressed() {
    setState(() {
      text += dialogText;
      dialogText = "";
    });
    speechToText.stop();
    Navigator.pop(context);
  }

  Future<void> toggleListening() async {
    bool available = await speechToText.initialize();
    if (available) {
      isListen.value = true;
      speechToText.listen(
        onResult: (result) {
          setState(() {
            dialogText = result.recognizedWords;
          });
        },
      );
    }
  }

  void showModal() {
    showModalBottomSheet(
      isDismissible: false,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
            ),
            ValueListenableBuilder<bool>(
              valueListenable: isListen,
              builder: (context, value, child) {
                return Text(
                  value ? "Listening..." : "Speak...",
                  style: const TextStyle(
                      fontSize: 20,
                      color: Color(0XFFDFDFDF),
                      fontWeight: FontWeight.bold),
                );
              },
            ),
            ValueListenableBuilder(
              valueListenable: isListen,
              builder: (context, value, child) {
                return AvatarGlow(
                  animate: value,
                  endRadius: 80.0,
                  glowColor: Colors.red,
                  child: const CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 35,
                    child: Icon(
                      Icons.mic,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                );
              },
            ),

            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: ElevatedButton(
                      onPressed: onStartPressed,
                      child: const Text('Start'),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: ElevatedButton(
                      onPressed: onStopPressed,
                      child: const Text('Stop'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(
        color: Colors.black,
        width: 1,
      ),
    );
    return Scaffold(
      appBar: const CustomMyAppBar(title: "Speech to Text"),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            autocorrect: false,
            decoration: InputDecoration(
                isDense: true,
                border: outlineInputBorder,
                enabledBorder: outlineInputBorder,
                focusedBorder: outlineInputBorder,
                suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.mic,
                      color: Colors.black,
                      size: 25,
                    ),
                    onPressed: () {
                      showModal();
                      isListen.value = false;
                    })),
            controller: TextEditingController(text: text),
            maxLines: null,
          ),
        ),
      ),
    );
  }
}
