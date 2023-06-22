import 'package:flutter/material.dart';

import '../widget/custom_app_bar.dart';

class AnimateAlignExample extends StatefulWidget {
  const AnimateAlignExample({Key? key}) : super(key: key);

  @override
  State<AnimateAlignExample> createState() => _AnimateAlignExampleState();
}

class _AnimateAlignExampleState extends State<AnimateAlignExample> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const CustomMyAppBar(
        title: "Animated Align",
      ),
      body:Center(
        child: InkWell(
          onTap: (){
            setState(() {
              isSelected =! isSelected;
            });
          },
          child: Container(
            color: Colors.red,
            width: 250,
            height: 250,
            child: AnimatedAlign(
              alignment: isSelected ? Alignment.topLeft : Alignment.bottomRight,
              duration: const Duration(milliseconds: 500),
              child: const FlutterLogo(
                size: 60,
              ),
            )
          ),
        ),
      ),
    );
  }
}
