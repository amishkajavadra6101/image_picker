import 'package:flutter/material.dart';
import 'package:image_example/widget/custom_app_bar.dart';

class AnimatedIconExample extends StatefulWidget {
  @override
  State<AnimatedIconExample> createState() => _AnimatedIconExampleState();
}

class _AnimatedIconExampleState extends State<AnimatedIconExample>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  bool isPlay = false;
  @override
  void initState() {
    animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    super.initState();
  }
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomMyAppBar(
        title: 'Animated Icon',
      ),
      body: Center(
        child: IconButton(
          icon: AnimatedIcon(
            size: 40,
            icon: AnimatedIcons.play_pause,
            progress: animationController,
          ),
          onPressed: () {
            if(isPlay == false){
              animationController.forward();
              isPlay = true;
            }else{
              animationController.reverse();
              isPlay = false;
            }
          },
        ),
      ),
    );
  }
}
