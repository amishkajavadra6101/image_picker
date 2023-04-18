import 'package:flutter/material.dart';

class ObjectKeyExample extends StatefulWidget {
  const ObjectKeyExample({Key? key}) : super(key: key);

  @override
  State<ObjectKeyExample> createState() => _ObjectKeyExampleState();
}

class _ObjectKeyExampleState extends State<ObjectKeyExample> {
  /*object key is use for add,remove and reorder widget in list */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ObjectKey Example'),
      ),
    );
  }
}
