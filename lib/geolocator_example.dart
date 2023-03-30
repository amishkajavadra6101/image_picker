import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';

class GeolocatorExample extends StatefulWidget {
  const GeolocatorExample({Key? key}) : super(key: key);

  @override
  State<GeolocatorExample> createState() => _GeolocatorExampleState();
}

class _GeolocatorExampleState extends State<GeolocatorExample> {
  String latitude = "";
  String longitude = "";
  String address = "";
  void getCurruntPosition() async {
    bool serviceEnabled;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Fluttertoast.showToast(msg: 'please keep your location on');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      await Geolocator.requestPermission();
    } else if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(msg: 'location permission denied forever');
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    latitude = "";
    longitude = "";
    latitude = position.latitude.toString();
    longitude = position.longitude.toString();
    setState(() {});
    // Geolocator.distanceBetween(startLatitude, startLongitude, endLatitude, endLongitude)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Geolocator Example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ignore: unnecessary_null_comparison
          longitude != null
              ? Text(
                  'your longitude is : $longitude',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                )
              : const Text('please select your location'),
          // ignore: unnecessary_null_comparison
          latitude != null
              ? Text(
                  'your latitude is : $latitude',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                )
              : const Text('please select your location'),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: getCurruntPosition,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text(
                    "Get Currunt location",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
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
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [

//           ],
//         ),
//       ),
//     );
//   }
// }
