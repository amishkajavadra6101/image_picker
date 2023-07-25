import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';


class QrGeneratore extends StatefulWidget {
  const QrGeneratore({Key? key}) : super(key: key);

  @override
  State<QrGeneratore> createState() => _QrGeneratoreState();
}

class _QrGeneratoreState extends State<QrGeneratore> {
  String qrText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Generator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (text) {
                setState(() {
                  qrText = text;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Enter text',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (qrText.isNotEmpty) {
                  FocusScope.of(context).unfocus();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.20,
                          height: MediaQuery.of(context).size.height * 0.20,
                          child: Center(
                            child: QrImageView(
                              data: qrText,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
              child: const Text('Generate QR Code'),
            ),
          ],
        ),
      ),
    );
  }
}
