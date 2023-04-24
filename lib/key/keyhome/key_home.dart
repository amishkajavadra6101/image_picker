import 'package:flutter/material.dart';
import 'package:image_example/key/gloable_key.dart';
import 'package:image_example/key/object_key_example.dart';
import 'package:image_example/key/page_storage_key.dart';
import 'package:image_example/key/unique_key_example.dart';
import 'package:image_example/key/value_key.dart';
import 'package:image_example/key/vluenotifier.dart';

import '../../helper/button.dart';

class KeyHome extends StatelessWidget {
  const KeyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('example of all keys'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HelperButton(
                text: 'Value key example',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ValueKeyExample()));
                }),
            HelperButton(
                text: 'Global key example',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GlobalKeyExample()));
                }),
            HelperButton(
                text: 'Object key example',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ObjectKeyExample()));
                }),
            HelperButton(
                text: 'Unique key example',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UniqueKeyExample()));
                }),
            HelperButton(
                text: 'Pagestorage example',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PageStorageExample()));
                }),
            HelperButton(
                text: 'ValueNotifier example',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ValueNotfierExample()));
                }),
          ],
        ),
      ),
    );
  }
}
