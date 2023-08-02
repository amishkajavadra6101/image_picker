import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ComputeIsolateExample extends StatelessWidget {
  const ComputeIsolateExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Compute Isolate Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            ElevatedButton(
              onPressed: () async {
                final result = await compute(complexComputation, 100000);
                Fluttertoast.showToast(
                  msg: "$result",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 3,
                  backgroundColor: Colors.black54,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              },
              child: const Text('compute'),
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
