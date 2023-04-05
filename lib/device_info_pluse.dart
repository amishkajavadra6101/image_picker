import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Dinfo extends StatelessWidget {
  Dinfo({Key? key}) : super(key: key);

  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  Future<AndroidDeviceInfo> getAndoridInfo() async {
    return await deviceInfoPlugin.androidInfo;
  }
  // Future<IosDeviceInfo> getIosInof() async {
  //   return await deviceInfoPlugin.iosInfo;
  // }
  // Future<MacOsDeviceInfo> getMacOsInfo() async {
  //   return await deviceInfoPlugin.macOsInfo;
  // }

  Widget showCard(String name, String value) {
    return Card(
      child: ListTile(
        title: Text(
          "$name : $value",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("device info package"),
        ),
        body: FutureBuilder<AndroidDeviceInfo>(
          future: getAndoridInfo(),
          builder: (context, snapshot) {
            final data = snapshot.data;
            return SingleChildScrollView(
              child: Column(
                children: [
                  if (data != null) showCard('brand', data.brand),
                  if (data != null) showCard('device', data.device),
                  if (data != null) showCard('model', data.model),
                  if (data != null) showCard('manufacturer', data.manufacturer),
                  if (data != null) showCard('product', data.product),
                  if (data != null) showCard('hardware', data.hardware),
                  if (data != null)
                    showCard(
                        'isPhysicalDevice', data.isPhysicalDevice.toString()),
                  if (data != null)
                    showCard('version', data.version.release.toString()),
                ],
              ),
            );
          },
        ));
  }
}
