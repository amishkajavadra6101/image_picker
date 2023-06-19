import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class FlutterAnimateExample extends StatelessWidget {
  const FlutterAnimateExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Animate')
            .animate()
            .slideX()
            .then()
            .shake(duration: 2000.ms),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'hello bhailog',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ).animate().fade(delay: 500.ms, duration: 2000.ms).slideY(),
            const Text(
              'hello bhailog1',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ).animate().tint(color: Colors.amber).then().shake(),
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.network("https://picsum.photos/250?image=9"),
                SizedBox(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Icon(Icons.image_outlined),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Pick Image form Gallery")
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Icon(Icons.camera),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Pick Image form Camera")
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 250,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Example of firebase_crashlytics")),
                ),
              ].animate(interval: .250.seconds).slideX(),
            )
          ],
        ),
      ),
    );
  }
}
