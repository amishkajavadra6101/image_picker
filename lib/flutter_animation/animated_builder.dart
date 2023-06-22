import 'package:flutter/material.dart';
import 'package:image_example/widget/custom_app_bar.dart';
import 'dart:math' as math;
class AnimatedBuilderExample extends StatefulWidget {
  const AnimatedBuilderExample({Key? key}) : super(key: key);

  @override
  State<AnimatedBuilderExample> createState() => _AnimatedBuilderExampleState();
}

class _AnimatedBuilderExampleState extends State<AnimatedBuilderExample>
    with TickerProviderStateMixin {
  late final AnimationController animationController =
      AnimationController(duration: const Duration(seconds: 10), vsync: this)
        ..repeat();

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const CustomMyAppBar(
        title: "Animated Builder",
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(animation: animationController, builder: (context, child) {
                return Transform.rotate(angle: animationController.value * 2.0 * math.pi,
                  child: const FlutterLogo(
                    size: 100,
                  ),
                );
              },)
            ],
          )),
    );
  }
}
