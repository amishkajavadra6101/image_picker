import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Url1 extends StatefulWidget {
  const Url1({Key? key}) : super(key: key);

  @override
  State<Url1> createState() => _Url1State();
}

class _Url1State extends State<Url1> {
  Future<void> launcherurl(String url) async {
    final Uri uri = Uri(scheme: "https", host: url);
    if (await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $uri');
    }
  }

  Future<void> launcherurlapp(String url) async {
    final Uri uri = Uri(scheme: "https", host: url);
    if (await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  Future<void> sendCall(String phonenumber) async {
    final Uri uri = Uri(scheme: "tel", host: phonenumber);
    if (await launchUrl(
      uri,
    )) {
      throw Exception('Could not launch $uri');
    }
  }

  Future<void> sendSMS(String number) async {
    final mobileNo = number;
    final lastUrl = 'sms:$mobileNo';
    final uri = Uri.parse(lastUrl);
    if (await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  Future<void> sendEmail(String emailAddress) async {
    final email = emailAddress;
    final lastUrl = 'mailto:$email';
    final uri = Uri.parse(lastUrl);
    if (await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }
  // Future<void> sendEmail(
  //     String emailAddress, String subject, String body) async {
  //   final Uri uri = Uri(
  //     scheme: 'mailto',
  //     path: emailAddress,
  //     queryParameters: {
  //       'subject': subject,
  //       'body': body,
  //     },
  //   );
  //   if (await launchUrl(uri)) {
  //     throw Exception('Could not launch $uri');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("URL luncher"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    launcherurl('www.pub.dev');
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text(
                    "Open Url in browser",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    launcherurlapp('www.pub.dev');
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text(
                    "Open Url in App",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    sendCall('5252552');
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text(
                    "Make A call",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    sendSMS("9925320820");
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text(
                    "Send a SMS",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    sendEmail('example@example.com');
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text(
                    "Send a email",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
