import 'package:flutter/material.dart';

class ValueNotfierExample extends StatefulWidget {
  const ValueNotfierExample({Key? key}) : super(key: key);

  @override
  State<ValueNotfierExample> createState() => _ValueNotfierExampleState();
}

class _ValueNotfierExampleState extends State<ValueNotfierExample> {
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);

  void _incrementCounter() {
    _counter.value++;
  }

  @override
  void dispose() {
    _counter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('example of vauenotifier'),
      ),
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: _counter,
          builder: (BuildContext context, int value, Widget? child) {
            return Text(
              'Counter: $value',
              style: const TextStyle(fontSize: 24.0),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
