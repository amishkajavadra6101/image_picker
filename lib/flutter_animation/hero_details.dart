import 'package:flutter/material.dart';

class HeroDetail extends StatelessWidget {
  const HeroDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hero Detail"),
      ),
      body:  const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Hero(
                tag: "example",
                child: CircleAvatar(
                  radius: 120,
                  backgroundImage: AssetImage(
                    "assets/camera_lense.jpeg",
                  ),
                ),
              ),
              ),
          ),
        ],
      ),
    );
  }
}
