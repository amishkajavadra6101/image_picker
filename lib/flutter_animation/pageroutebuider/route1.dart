import 'package:flutter/material.dart';
import 'package:image_example/widget/custom_app_bar.dart';

class Route1 extends StatelessWidget {
  const Route1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const CustomMyAppBar(title: "pagerote1 example"),
      body: Container(
        color: Colors.red,
      ),
    );
  }
}
