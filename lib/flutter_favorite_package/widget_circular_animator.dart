import 'package:flutter/material.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';

class CircularAnimator extends StatefulWidget {
  const CircularAnimator({Key? key}) : super(key: key);

  @override
  State<CircularAnimator> createState() => _CircularAnimatorState();
}

class _CircularAnimatorState extends State<CircularAnimator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("CircularAnimator"),
        ),
        body: const Center(
          child: WidgetCircularAnimator(
            size: 250,
            innerIconsSize: 3,
            outerIconsSize: 3,
            innerAnimation: Curves.easeInOutBack,
            outerAnimation: Curves.easeInOutBack,
            innerColor: Colors.deepPurple,
            outerColor: Colors.orangeAccent,
            innerAnimationSeconds: 10,
            outerAnimationSeconds: 10,
            child: Icon(
              Icons.person,size: 170,
            ),
          ),
        ));
  }
}
