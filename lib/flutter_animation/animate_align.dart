import 'package:flutter/material.dart';

class Dialep extends StatefulWidget {
  const Dialep({Key? key}) : super(key: key);

  @override
  _DialepState createState() => _DialepState();
}

class _DialepState extends State<Dialep> {
  bool _isContainerVisible = true;

  void _toggleContainerVisibility() {
    setState(() {
      _isContainerVisible = !_isContainerVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated dial"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: _toggleContainerVisibility,
              child: const Text("down"),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            color: Colors.red,
            height: _isContainerVisible
                ? MediaQuery.of(context).size.height * 0.4
                : 0,
          ),
        ],
      ),
    );
  }
}
