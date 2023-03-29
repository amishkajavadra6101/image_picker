import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class PathExample extends StatefulWidget {
  @override
  _PathExampleState createState() => _PathExampleState();
}

class _PathExampleState extends State<PathExample> {
  Future<File> getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/my_file.txt');
    return file;
  }

  Future<void> writeToFile() async {
    final file = await getFile();
    await file.writeAsString('Hello, bhailog!');
    setState(() {});
  }

  Future<String> readFromFile() async {
    final file = await getFile();
    return file.readAsString();
  }

  File? images;
  Future<void> getImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    final directory = await getApplicationDocumentsDirectory();
    final imagepath =
        File('${directory.path}/${DateTime.now().millisecondsSinceEpoch}.jpg');
    final imagesave = await imagepath.writeAsBytes(await image.readAsBytes());
    // for temporary
    // final imagesave = File(image.path);
    setState(() {
      images = imagesave;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Path Provider Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            images == null
                ? Image.network("https://picsum.photos/250?image=9")
                : Image.file(
                    images!,
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
            SizedBox(
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  getImage(ImageSource.gallery);
                },
                child: Row(
                  children: const [
                    Icon(Icons.image_outlined),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Pick Image form Gallery")
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: writeToFile,
              child: const Text('Write to File'),
            ),
            const SizedBox(height: 20),
            FutureBuilder<String>(
              future: readFromFile(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text('File contents: ${snapshot.data}');
                } else {
                  return const Text('No data');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
