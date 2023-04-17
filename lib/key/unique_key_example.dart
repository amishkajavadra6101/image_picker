import 'package:flutter/material.dart';

class UniqueKeyExample extends StatefulWidget {
  const UniqueKeyExample({Key? key}) : super(key: key);

  @override
  State<UniqueKeyExample> createState() => _UniqueKeyExampleState();
}

class _UniqueKeyExampleState extends State<UniqueKeyExample> {
  /* using unique keys, we can ensure that each form field is uniquely identified in the widget tree hierarchy.This helps to avoid
  any errors that might occur due to duplicate keys and ensures that the form behaves as expected when the userinteracts with it*/

  List<Widget> emojis = [
    Text(
      "😎",
      /*If two widgets have the same Key, Flutter will not be able to differentiate between them and
       may reuse the state of one widget for the other, resulting in unexpected behavior.
       Therefore, it's recommended to use Keys that are unique for each widget instance*/
      key: UniqueKey(),
      style: const TextStyle(
        fontSize: 100,
      ),
    ),
    Text(
      "🤠",
      key: UniqueKey(),
      style: const TextStyle(
        fontSize: 100,
      ),
    ),
  ];

  swapEmoji() {
    setState(() {
      emojis.insert(1, emojis.removeAt(0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('example of Unique key'),
        ),
        body: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: emojis,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: swapEmoji,
                child: const Text("Swap"),
              )
            ],
          ),
        ));
  }
}
