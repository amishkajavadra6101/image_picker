import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class Pinfo extends StatefulWidget {
  const Pinfo({Key? key}) : super(key: key);

  @override
  State<Pinfo> createState() => _PinfoState();
}

class _PinfoState extends State<Pinfo> {
  PackageInfo packageInfo = PackageInfo(
      appName: 'unknown',
      packageName: 'unknown',
      version: 'unknown',
      buildNumber: 'unknown');
  @override
  void initState() {
    super.initState();
    initPackageInfo();
  }

  Future<void> initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      packageInfo = info;
    });
  }

  Widget infoTile(String title, String subtitle) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle.isEmpty ? 'Not set' : subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('package info plus'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          infoTile('App name', packageInfo.appName),
          infoTile('Package name', packageInfo.packageName),
          infoTile('App version', packageInfo.version),
          infoTile('Build number', packageInfo.buildNumber),
          infoTile('Build signature', packageInfo.buildSignature),
        ],
      ),
    );
  }
}
