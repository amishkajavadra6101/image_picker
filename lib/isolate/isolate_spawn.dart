import 'dart:isolate';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class IsolatesExample extends StatefulWidget {
  const IsolatesExample({Key? key}) : super(key: key);

  @override
  State<IsolatesExample> createState() => _IsolatesExampleState();
}

class _IsolatesExampleState extends State<IsolatesExample> {
  Isolate? isolate;
  final ReceivePort receivePort = ReceivePort();

  @override
  void dispose() {
    super.dispose();
    isolate?.kill(priority: Isolate.immediate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Isolate spawn Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            ElevatedButton(
              onPressed: () async {
                isolate = await Isolate.spawn(complexTask2, receivePort.sendPort);
                receivePort.listen((total) {
                  Fluttertoast.showToast(
                    msg: "$total",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 3,
                    backgroundColor: Colors.black54,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                });
              },
              child: const Text('Spawn'),
            ),
          ],
        ),
      ),
    );
  }
}

void complexTask2(SendPort sendPort) {
  var total = 0.0;
  for (var i = 0; i < 1000000000; i++) {
    total += i;
  }
  sendPort.send(total);
}
