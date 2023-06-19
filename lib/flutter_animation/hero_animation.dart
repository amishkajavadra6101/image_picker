import 'package:flutter/material.dart';
import 'package:image_example/flutter_animation/hero_details.dart';

class HeroAnimation extends StatelessWidget {
  const HeroAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hero animation"),
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HeroDetail()));
          },
          child: const Padding(
            padding: EdgeInsets.all(20),
              child: Hero(
                tag: "example",
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(
                      "assets/camera_lense.jpeg",
                    ),
                  ),
              ),
            ),
          ),
        ),
    );
  }
}
