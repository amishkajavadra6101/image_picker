import 'dart:isolate';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class IsolatesExample extends StatelessWidget {
  const IsolatesExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("isolate example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            ElevatedButton(
              onPressed: () async {
                double total = await compute(complexComputation, 1000000000);
                Fluttertoast.showToast(
                    msg: "$total",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 3,
                    backgroundColor: Colors.black54,
                    textColor: Colors.white,
                    fontSize: 16.0);
              },
              child: const Text('Compute'),
            ),
            ElevatedButton(
              onPressed: () async {
                final receivePort = ReceivePort();
                await Isolate.spawn(complexTask2, receivePort.sendPort);
                receivePort.listen((total) {
                  Fluttertoast.showToast(
                      msg: "$total",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 3,
                      backgroundColor: Colors.black54,
                      textColor: Colors.white,
                      fontSize: 16.0);
                });
              },
              child: const Text('Spawn'),
            ),
          ],
        ),
      ),
    );
  }
  double complexComputation(int n) {
    var total = 0.0;
    for (var i = 0; i < n; i++) {
      total += i;
    }
    return total;
  }
}

complexTask2(SendPort sendPort) {
  var total = 0.0;
  for (var i = 0; i < 1000000000; i++) {
    total += i;
  }
  sendPort.send(total);
}
