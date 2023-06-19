import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimatedTextExample1 extends StatefulWidget {
  const AnimatedTextExample1({Key? key}) : super(key: key);

  @override
  State<AnimatedTextExample1> createState() => _AnimatedTextExample1State();
}

class _AnimatedTextExample1State extends State<AnimatedTextExample1> {
  // Colorize Text Style
  final _colorizeTextStyle = const TextStyle(
    fontSize: 50.0,
    fontFamily: 'Horizon',
  );

// Colorize Colors
  final _colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'example of animated text',
          style: TextStyle( fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
            AnimatedTextKit(
              animatedTexts: [
                FadeAnimatedText('do IT!'),
                FadeAnimatedText('do it RIGHT!!'),
                FadeAnimatedText('do it RIGHT NOW!!!'),
              ],
            ),
            const Divider(
              height: 40,
              thickness: 2,
              color: Colors.black12,
            ),
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText('It is not enough to do your best,'),
                TyperAnimatedText('you must know what to do,'),
                TyperAnimatedText('and then do your best'),
                TyperAnimatedText('- W.Edwards Deming'),
              ],
            ),
            const Divider(
              height: 40,
              thickness: 2,
              color: Colors.black12,
            ),
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText('Discipline is the best tool'),
                TypewriterAnimatedText('Design first, then code', cursor: '|'),
                TypewriterAnimatedText('Do not patch bugs out, rewrite them',
                    cursor: '<|>'),
                TypewriterAnimatedText('Do not test bugs out, design them out',
                    cursor: '💡'),
              ],
            ),
            const Divider(
              height: 40,
              thickness: 2,
              color: Colors.black12,
            ),
            AnimatedTextKit(
              animatedTexts: [
                ScaleAnimatedText('Think'),
                ScaleAnimatedText('Build'),
                ScaleAnimatedText('Ship'),
              ],
            ),
            const Divider(
              height: 40,
              thickness: 2,
              color: Colors.black12,
            ),
            AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                  'Larry Page',
                  textStyle: _colorizeTextStyle,
                  colors: _colorizeColors,
                ),
                ColorizeAnimatedText(
                  'Bill Gates',
                  textStyle: _colorizeTextStyle,
                  colors: _colorizeColors,
                ),
                ColorizeAnimatedText(
                  'Steve Jobs',
                  textStyle: _colorizeTextStyle,
                  colors: _colorizeColors,
                ),
              ],
            ),
            const Divider(
              height: 40,
              thickness: 2,
              color: Colors.black12,
            ),
            TextLiquidFill(
              text: 'LIQUIDY',
              waveColor: Colors.blueAccent,
              boxBackgroundColor: Colors.redAccent,
              textStyle: const TextStyle(
                fontSize: 70,
                fontWeight: FontWeight.bold,
              ),
              boxHeight: 300,
            ),
            const Divider(
              height: 40,
              thickness: 2,
              color: Colors.black12,
            ),
            AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText(
                  'Hello World',
                  textStyle: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                WavyAnimatedText('Look at the waves'),
                WavyAnimatedText('They look so Amazing'),
              ],
            ),
            const Divider(
              height: 40,
              thickness: 2,
              color: Colors.black12,
            ),
            AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                FlickerAnimatedText('Flicker Frenzy'),
                FlickerAnimatedText('Night Vibes On'),
                FlickerAnimatedText("C'est La Vie !"),
              ],
            ),
            const Divider(
              height: 40,
              thickness: 2,
              color: Colors.black12,
            ),
            AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText(
                  'On Your Marks',
                  textStyle: const TextStyle(
                    fontSize: 24.0,
                  ),
                ),
                FadeAnimatedText(
                  'Get Set',
                  textStyle: const TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ScaleAnimatedText(
                  'Ready',
                  textStyle: const TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                RotateAnimatedText(
                  'Go!',
                  textStyle: const TextStyle(
                    fontSize: 64.0,
                  ),
                  rotateOut: false,
                  duration: const Duration(milliseconds: 400),
                )
              ],
            ),
            const Divider(
              height: 40,
              thickness: 2,
              color: Colors.black12,
            ),
            AnimatedTextKit(
              animatedTexts: [
                RotateAnimatedText('AWESOME'),
                RotateAnimatedText('OPTIMISTIC'),
                RotateAnimatedText(
                    'DIFFERENT',
                    textStyle: const TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                    duration: Duration(seconds: 5)
                ),
              ],
              isRepeatingAnimation: true,
              totalRepeatCount: 10,
            ),

          ],
        ),
      ),
    );
  }
}
