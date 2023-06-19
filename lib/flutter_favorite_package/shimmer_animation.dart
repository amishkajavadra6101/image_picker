import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ShimmerAnimations extends StatelessWidget {
  const ShimmerAnimations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ShimmerAnimations"),
      ),
      body: Shimmer(
        duration: const Duration(seconds: 3),
        interval: const Duration(seconds: 2),
        color: Colors.white,
        colorOpacity: 0.6,
        enabled: true,
        direction: const ShimmerDirection.fromLTRB(),
        child :ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: 3,
          separatorBuilder: (context, index) => const Divider(
            height: 30,
            thickness: 1,
          ),
          itemBuilder: (context, index) {
            return  Container(
              width: 200,
              height: 200,
              color: Colors.black12,
            );
          },
        )
      ),
    );
  }
}
