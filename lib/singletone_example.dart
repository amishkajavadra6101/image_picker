import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class GloableClass {
  static final GloableClass singletone = GloableClass.internal();
  factory GloableClass() {
    return singletone;
  }
  GloableClass.internal();

  String? name;
  Future<void> sendCall(String phonenumber) async {
    final Uri uri = Uri(scheme: "tel", host: phonenumber);
    if (await launchUrl(
      uri,
    )) {
      throw Exception('Could not launch $uri');
    }
  }

  void toastExample(String details) {
    Fluttertoast.showToast(
        msg: details,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
