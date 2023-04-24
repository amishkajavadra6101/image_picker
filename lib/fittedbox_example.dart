import 'package:flutter/material.dart';

class FittedBoxExample extends StatelessWidget {
  const FittedBoxExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('example of FittedBox'),
      ),
      body: Container(
        height: 400,
        width: 300,
        color: Colors.red,
        child: FittedBox(
          fit: BoxFit.fill,
          child: Image.network(
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
        ),
      ),
    );
  }
}
