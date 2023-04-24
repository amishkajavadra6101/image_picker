import 'package:flutter/material.dart';
import 'package:image_example/flutter_favorite_package/animated_text.dart';
import 'package:image_example/flutter_favorite_package/flutter_animation.dart';

import '../../helper/button.dart';

class PackageHome extends StatelessWidget {
  const PackageHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Favorite Packages'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HelperButton(
                text: 'Flutter_animation',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FlutterAnimateExample()));
                }),
            HelperButton(
                text: 'animated text',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AnimatedTextExample1()));
                }),
          ],
        ),
      ),
    );
  }
}
