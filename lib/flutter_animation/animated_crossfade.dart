import 'package:flutter/material.dart';
import 'package:image_example/widget/custom_app_bar.dart';

class AnimatedCrossExample extends StatefulWidget {
  const AnimatedCrossExample({Key? key}) : super(key: key);

  @override
  State<AnimatedCrossExample> createState() => _AnimatedCrossExampleState();
}

class _AnimatedCrossExampleState extends State<AnimatedCrossExample> {
  bool isAnimated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomMyAppBar(
        title: "Animate cross fade",
      ),
      body: Center(
        child: Column(
          mainAxisAlignment : MainAxisAlignment.center,
          children: [
            AnimatedCrossFade(
                firstChild: Container(
                  width: 200,
                  height: 200,
                  color: Colors.red,
                ),
                secondChild: SizedBox(
                    width: 200,
                    height: 200,
                    child: Image.asset(
                      "assets/camera_lense.jpeg",
                    )),
                crossFadeState: isAnimated
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(seconds: 2)),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (isAnimated) {
                      isAnimated = false;
                    } else {
                      isAnimated = true;
                    }
                  });
                },
                child: const Text("Animated Cross fade"))
          ],
        ),
      ),
    );
  }
}
