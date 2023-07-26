import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({Key? key}) : super(key: key);

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  TextEditingController email = TextEditingController();
  TextEditingController otp = TextEditingController();
  EmailOTP myAuth = EmailOTP();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Email Verification",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        controller: email,
                        decoration:
                            const InputDecoration(hintText: "User Email")),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        myAuth.setConfig(
                            appEmail: "amishcodetrade@gmail.com",
                            appName: "Email Verification",
                            userEmail: email.text,
                            otpLength: 4,
                            otpType: OTPType.mixed);
                        if (await myAuth.sendOTP() == true) {
                          Fluttertoast.showToast(
                              msg: "OTP has been sent",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 3,
                              backgroundColor: Colors.black54,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else {
                          Fluttertoast.showToast(
                              msg: "Oops, OTP send failed",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 3,
                              backgroundColor: Colors.black54,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                      },
                      child: const Text("Send OTP")),
                ],
              ),
            ),
            Card(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        controller: otp,
                        decoration:
                            const InputDecoration(hintText: "Enter OTP")),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        if (await myAuth.verifyOTP(otp: otp.text) == true) {
                          Fluttertoast.showToast(
                              msg: "OTP is verified",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 3,
                              backgroundColor: Colors.black54,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else {
                          Fluttertoast.showToast(
                              msg: "Invalid OTP",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 3,
                              backgroundColor: Colors.black54,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                      },
                      child: const Text("Verify")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
