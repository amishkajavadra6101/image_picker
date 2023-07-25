import 'package:flutter/material.dart';
import 'package:image_example/silvers/silver_appbar.dart';
import 'package:image_example/silvers/sliver_list.dart';

import '../helper/button.dart';

class FlutterSilver extends StatelessWidget {
  const FlutterSilver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Silvers'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HelperButton(
                text: 'Silver Appbar',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SilverAppBar()));
                }),
            HelperButton(
                text: 'Silver Listview',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SliverListExample()));
                }),
          ],
        ),
      ),
    );
  }
}
