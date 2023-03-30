// ignore_for_file: use_build_context_synchronously

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FilePicker1 extends StatefulWidget {
  const FilePicker1({Key? key}) : super(key: key);

  @override
  State<FilePicker1> createState() => _FilePicker1State();
}

class _FilePicker1State extends State<FilePicker1> {
  FilePickerResult? result;
  String selectedFileName = "";
  // Future<void> pickFile() async {
  //   result = await FilePicker.platform
  //       .pickFiles(type: FileType.image, allowMultiple: true);
  //   if (result != null) {
  //     final file = result!.files.first;
  //     setState(() {
  //       selectedFileName = file.name;
  //     });
  //     debugPrint("======${file.name}");
  //     debugPrint(file.bytes as String?);
  //     debugPrint(file.size as String?);
  //     debugPrint(file.extension);
  //     debugPrint(file.path);
  //   }
  // }
  Future<void> pickFile() async {
    result = await FilePicker.platform
        .pickFiles(type: FileType.image, allowMultiple: true);
    if (result != null) {
      selectedFileName = "";
      for (var file in result!.files) {
        selectedFileName += "${file.name}\n"; // concatenate the file name
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File Picker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ignore: unnecessary_null_comparison
            selectedFileName != null
                ? Text(
                    'Selected file: $selectedFileName',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  )
                : const Text('No file selected.'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: pickFile,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text(
                    "Pick image file",
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
