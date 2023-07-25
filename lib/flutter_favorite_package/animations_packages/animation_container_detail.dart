import 'package:flutter/material.dart';

class AnimationContainarDetail extends StatelessWidget {
  const AnimationContainarDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo details page'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Title',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Colors.black54,
                    fontSize: 30.0,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Demo details page',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.black54,
                    height: 1.5,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}