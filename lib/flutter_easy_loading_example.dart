import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class FlutterEasyLoadingExample extends StatefulWidget {
  const FlutterEasyLoadingExample({Key? key}) : super(key: key);

  @override
  State<FlutterEasyLoadingExample> createState() =>
      _FlutterEasyLoadingExampleState();
}

class _FlutterEasyLoadingExampleState extends State<FlutterEasyLoadingExample> {
  void progress() {
    EasyLoading.showProgress(0.8, status: 'download');
  }

  void showSuccessMessage() {
    EasyLoading.showSuccess('Success!');
  }

  void showDelayedLoading() {
    EasyLoading.show(
      status: 'Loading...',
      maskType: EasyLoadingMaskType.black,
    );
    Future.delayed(const Duration(seconds: 3), () {
      EasyLoading.dismiss();
    });
  }

  void showToast() {
    EasyLoading.showToast('This is a toast message!',
        duration: const Duration(seconds: 2),
        // backgroundColor: Colors.grey,
        // textColor: Colors.white,
        toastPosition: EasyLoadingToastPosition.bottom);
  }

  void showInfo() {
    EasyLoading.showInfo('This is an info message!');
  }

  void showError() {
    EasyLoading.showError('This is an error message!');
  }

  void showSuccess() {
    EasyLoading.showSuccess('This is a success message!');
  }

  void configLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.doubleBounce
      ..maskType = EasyLoadingMaskType.custom
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 100
      ..radius = 10.0
      ..progressColor = Colors.white
      ..backgroundColor = const Color(0xff65499C)
      ..indicatorColor = Colors.white
      ..textColor = Colors.white
      ..maskColor = Colors.transparent
      ..userInteractions = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EasyLoading Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: configLoading,
              child: const Text('Show config Loading'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: progress,
              child: const Text('Show progress Loading'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: showSuccessMessage,
              child: const Text('Show Success Message'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: showDelayedLoading,
              child: const Text('Show Delayed Loading'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: showToast,
              child: const Text('Show Toast'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: showInfo,
              child: const Text('Show Info Message'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: showError,
              child: const Text('Show Error Message'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: showSuccess,
              child: const Text('Show Success Message'),
            )
          ],
        ),
      ),
    );
  }
}

//import 'package:flutter/material.dart';
// import 'package:fluttereasyloading/fluttereasyloading.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       builder: EasyLoading.init(),
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {

//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('EasyLoading Example'),
//       ),
//     );
//   }
// }
