import 'package:flutter/material.dart';

class AnimatedPositionedExample extends StatefulWidget {
  const AnimatedPositionedExample({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedPositionedExampleState createState() =>
      _AnimatedPositionedExampleState();
}

class _AnimatedPositionedExampleState extends State<AnimatedPositionedExample> {
  bool _isPositionedLeft = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Positioned"),
      ),
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            top: 100.0,
            left: _isPositionedLeft ? 20.0 : 200.0,
            child: Container(
              width: 100.0,
              height: 100.0,
              color: Colors.blue,
            ),
          ),
          const Positioned(
            top: 200.0,
            left: 100,
            child: Column(
              children: [
                Text(
                  'Animated Positioned',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Welcome!',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isPositionedLeft = !_isPositionedLeft;
          });
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
