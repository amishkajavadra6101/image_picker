import 'package:flutter/material.dart';

class TweenAnimation extends StatefulWidget {
  const TweenAnimation({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TweenAnimationState createState() => _TweenAnimationState();
}

class _TweenAnimationState extends State<TweenAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animationContainer1;
  late Animation animationContainer2;
  late Animation colorAnimationContainer1;
  late Animation colorAnimationContainer2;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Tween animation from 0.0 to 1.0
    animationContainer1 = Tween(
      begin: 50.0,
      end: 100.0,
    ).animate(controller);

    colorAnimationContainer1 = ColorTween(
      begin: Colors.red,
      end: Colors.grey,
    ).animate(controller);

    animationContainer1.addListener(() {
      setState(() {});
    });

    animationContainer2 = Tween(
      begin: 100.0,
      end: 50.0,
    ).animate(controller);

    colorAnimationContainer2 = ColorTween(
      begin: Colors.blue,
      end: Colors.green,
    ).animate(controller);

    animationContainer2.addListener(() {
      setState(() {});
    });
    // Start the animation
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tween Animation Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 5,
              ),
              Container(
                width: animationContainer1.value,
                height: animationContainer1.value,
                color: colorAnimationContainer1.value,
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: animationContainer2.value,
                height: animationContainer2.value,
                color: colorAnimationContainer2.value,
              ),
              const SizedBox(height: 5),
              TweenAnimationBuilder(
                duration: const Duration(seconds: 2),
                curve: Curves.easeInOut,
                tween: Tween(begin: 100.0, end: 50.0),
                builder: (context, value, child) {
                  return Container(
                    width: value,
                    height: value,
                    color: Colors.red,
                  );
                },
              ),
              const SizedBox(height: 5),
              TweenAnimationBuilder(
                duration: const Duration(seconds: 2),
                curve: Curves.easeInOut,
                tween: Tween(begin: 50.0, end: 100.0),
                builder: (context, value, child) {
                  return Container(
                    width: value,
                    height: value,
                    color: Colors.yellow,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
