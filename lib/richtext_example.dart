import 'package:flutter/material.dart';

class RichTextExample extends StatelessWidget {
  const RichTextExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('example of rich text'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                text: 'Hello ',
                style: DefaultTextStyle.of(context).style,
                children: const <TextSpan>[
                  TextSpan(
                      text: 'bold',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: ' world!'),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 16.0, color: Colors.black),
                children: [
                  const TextSpan(text: 'Lorem ipsum dolor sit amet, '),
                  const TextSpan(
                    text: 'consectetur adipiscing elit',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.blue,
                    ),
                  ),
                  const TextSpan(
                      text:
                          ', sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '),
                  const TextSpan(
                    text: 'Ut enim ad minim veniam',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  TextSpan(
                    text:
                        ', quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
