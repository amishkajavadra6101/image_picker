import 'package:flutter/material.dart';

class ObjectKeyExample extends StatefulWidget {
  const ObjectKeyExample({Key? key}) : super(key: key);

  @override
  State<ObjectKeyExample> createState() => _ObjectKeyExampleState();
}

class _ObjectKeyExampleState extends State<ObjectKeyExample> {
  /*object key is use for add,remove and reorder widget in list */
  /*ObjectKey is a class in Flutter that is used to provide a unique identifier for a widget.
  It is used when working with lists of widgets, such as in ListView or GridView.
  The ObjectKey is used to identify a widget uniquely in the widget tree, which can help Flutter to determine
  if a widget needs to be rebuilt or not. If the ObjectKey of a widget remains the same across different builds,
  then Flutter will assume that the widget hasn't changed and won't rebuild it.*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ObjectKey Example'),
      ),
    );
  }
}
