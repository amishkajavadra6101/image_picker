import 'package:flutter/material.dart';

class ExpendedExample extends StatelessWidget {
  const ExpendedExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expended_Example'),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.red,
            height: 50,
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.yellow,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.green,
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
