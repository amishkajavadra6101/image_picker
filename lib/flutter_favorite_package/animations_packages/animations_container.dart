import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import 'animation_container_detail.dart';


class AnimationsContainerDemo extends StatefulWidget {
  AnimationsContainerDemo({
    Key? key
  }): super(key: key);

  @override
  State<AnimationsContainerDemo> createState() => _AnimationsContainerDemoState();
}

class _AnimationsContainerDemoState extends State<AnimationsContainerDemo> {
  ContainerTransitionType _transitionType = ContainerTransitionType.fade;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container transform demo'),
      ),
      body: Column(
        children:
        List.generate(10, (int index) {
          return OpenContainer<bool>(
            transitionType: _transitionType,
            openBuilder: (BuildContext _, VoidCallback openContainer) {
              return AnimationContainarDetail();
            },
            closedShape: const RoundedRectangleBorder(),
            closedElevation: 0.0,
            transitionDuration: const Duration(seconds: 1),
            closedBuilder: (BuildContext _, VoidCallback openContainer) {
              return ListTile(
                onTap: openContainer,
                title: const Text('Title item {index + 1}'),
              );
            },
          );
        }),
      ),
    );
  }
}


