import 'package:flutter/material.dart';

class AnimatedOpacityExample extends StatefulWidget {
  const AnimatedOpacityExample({Key? key}) : super(key: key);

  @override
  State<AnimatedOpacityExample> createState() => _AnimatedOpacityExampleState();
}

class _AnimatedOpacityExampleState extends State<AnimatedOpacityExample> {
   double myOpacity = 1.0;
   bool isVisiable = true;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Animated Opacity"),
      ),
      //opacity value is between 0 ,1 means fully visiable and 0 means unvisiable
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedOpacity(
              duration: const Duration(seconds: 2),
              opacity: myOpacity,
              // curve: Curves.elasticIn,
              child: Container(
                width: 200,
                height: 200,
                color: Colors.red,
              ),
            ),
            ElevatedButton(onPressed: (){
              setState(() {
                if(isVisiable){
                  myOpacity = 0.0;
                  isVisiable = false;
                }else{
                  myOpacity = 1.0;
                  isVisiable = true;
                }
              });
            }, child: const Text("Animated Opacity"))
          ],
        ),
      ),
    );
  }
}
