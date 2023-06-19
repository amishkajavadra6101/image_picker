import 'package:flutter/material.dart';
import 'package:image_example/flutter_animation/hero_animation.dart';
import 'package:image_example/flutter_animation/tween_animation.dart';

import '../helper/button.dart';
import 'animated_container_example.dart';
import 'animated_opacity.dart';
import 'animated_padding.dart';
import 'animated_positioned.dart';
import 'animated_switcher.dart';

class AnimationHome extends StatelessWidget {
  const AnimationHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HelperButton(
                text: 'Hero Animation',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HeroAnimation()));
                }),
            HelperButton(
                text: 'Tween Animation',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TweenAnimation()));
                }),
            HelperButton(
                text: 'Animated opacity',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const AnimatedOpacityExample()));
                }),
            HelperButton(
                text: 'Animated Padding',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const AnimatedPaddingExample()));
                }),
            HelperButton(
                text: 'animated container',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AnimatedContainerExample()));
                }),
            HelperButton(
                text: 'animated positioned',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  AnimatedPositionedExample()));
                }),
            HelperButton(
                text: 'animated Switcher',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  AnimatedSwitcherExample()));
                }),
          ],
        ),
      ),
    );
  }
}