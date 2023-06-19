import 'package:flutter/material.dart';

class AnimatedSwitcherExample extends StatefulWidget {
  const AnimatedSwitcherExample({Key? key}) : super(key: key);

  @override
  State<AnimatedSwitcherExample> createState() => _AnimatedSwitcherExampleState();
}

class _AnimatedSwitcherExampleState extends State<AnimatedSwitcherExample> {
  bool showFirstContainer = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Animated Switcher"),
        ),
        body: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 1000),
            child: showFirstContainer
                ? Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      color: Colors.blue,
                    ),
                    key: UniqueKey(),
                    height: 150,
                    width: 150,
                  )
                : Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      color: Colors.red,
                    ),
                    key: UniqueKey(),
                    height: 100,
                    width: 100,
                  ),
            transitionBuilder: (widget, animation) => ScaleTransition(
              scale: animation,
              child: widget,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              setState(() {
                showFirstContainer = !showFirstContainer;
              });
            },
            label: const Text('Animate')));
  }
}
