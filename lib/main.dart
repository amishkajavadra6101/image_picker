import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
      builder: EasyLoading.init(),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   final easyLoading = EasyLoading();
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//       builder: EasyLoading.init(),
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   void _showLoading() {
//     EasyLoading.show();
//     // Perform time-consuming task
//     EasyLoading.dismiss();
//   }
//
//   void _showDelayedLoading() {
//     EasyLoading.show(
//       status: 'Loading...',
//       maskType: EasyLoadingMaskType.black,
//     );
//     Future.delayed(Duration(seconds: 3), () {
//       EasyLoading.dismiss();
//     });
//   }
//
//   void _showToast() {
//     EasyLoading.showToast('This is a toast message!',
//         duration: Duration(seconds: 2),
//         // backgroundColor: Colors.grey,
//         // textColor: Colors.white,
//         toastPosition: EasyLoadingToastPosition.bottom);
//   }
//
//   void _showIndicator() {
//     EasyLoading.show(
//       indicator: CircularProgressIndicator(),
//       maskType: EasyLoadingMaskType.black,
//     );
//     // Perform time-consuming task
//     EasyLoading.dismiss();
//   }
//
//   void _showInfo() {
//     EasyLoading.showInfo('This is an info message!');
//   }
//
//   void _showError() {
//     EasyLoading.showError('This is an error message!');
//   }
//
//   void _showSuccess() {
//     EasyLoading.showSuccess('This is a success message!');
//   }
//
//   void _showProgress() {
//     EasyLoading.showProgress(0.3, status: 'Loading...');
//     // Perform time-consuming task
//     EasyLoading.dismiss();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('EasyLoading Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: _showLoading,
//               child: Text('Show Loading'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _showDelayedLoading,
//               child: Text('Show Delayed Loading'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _showToast,
//               child: Text('Show Toast'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _showIndicator,
//               child: Text('Show Indicator'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _showInfo,
//               child: Text('Show Info Message'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _showError,
//               child: Text('Show Error Message'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _showSuccess,
//               child: Text('Show Success Message'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _showProgress,
//               child: Text('Show Progress Indicator'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
