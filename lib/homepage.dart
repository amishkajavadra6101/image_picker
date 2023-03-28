import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:image_example/file_picker.dart';
import 'package:image_example/url.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? images;
  File? videoes;
  VideoPlayerController? controller;
  VideoPlayerController? controller2;
  ChewieController? chewieController;
  bool isCameraPermissionGranted = false;
  bool isStoragePermissionGranted = false;

  @override
  void initState() {
    super.initState();
    requestPermissions();
    netWorkVideo();
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
    controller2?.dispose();
    chewieController?.dispose();
  }

  Future<void> getImage(ImageSource source) async {
    if (isCameraPermissionGranted && source == ImageSource.camera) {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      // final imagesave = await saveImage(image.path);
      final imagesave = File(image.path);
      setState(() {
        images = imagesave;
      });
    }
    if (isStoragePermissionGranted && source == ImageSource.gallery) {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      // final imagesave = await saveImage(image.path);
      final imagesave = File(image.path);
      setState(() {
        images = imagesave;
      });
    }
  }

  Future<void> getVideo(ImageSource source) async {
    if (isCameraPermissionGranted && source == ImageSource.camera) {
      final video = await ImagePicker().pickVideo(source: source);
      videoes = File(video!.path);
      controller = VideoPlayerController.file(videoes!)
        ..initialize().then((_) {
          setState(() {});
          controller!.setLooping(true);
          controller!.play();
          chewieController = ChewieController(
            videoPlayerController: controller!,
            autoPlay: true,
            looping: true,
            additionalOptions: (context) {
              return <OptionItem>[
                OptionItem(
                  onTap: () => debugPrint('My option works!'),
                  iconData: Icons.chat,
                  title: 'My localized title',
                ),
                OptionItem(
                  onTap: () => debugPrint('Another option working!'),
                  iconData: Icons.chat,
                  title: 'Another localized title',
                ),
              ];
            },
            subtitle: Subtitles([
              Subtitle(
                index: 0,
                start: Duration.zero,
                end: const Duration(seconds: 10),
                text: 'Hello from subtitles',
              ),
              Subtitle(
                index: 1,
                start: const Duration(seconds: 10),
                end: const Duration(seconds: 20),
                text: 'Whats up? :)',
              ),
            ]),
            subtitleBuilder: (context, subtitle) => Container(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                subtitle,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        });
    }
    if (isStoragePermissionGranted && source == ImageSource.gallery) {
      final video = await ImagePicker().pickVideo(source: source);
      videoes = File(video!.path);
      controller = VideoPlayerController.file(videoes!)
        ..initialize().then((_) {
          setState(() {});
          controller!.setLooping(true);
          controller!.play();
          chewieController = ChewieController(
            videoPlayerController: controller!,
            autoPlay: true,
            looping: true,
            additionalOptions: (context) {
              return <OptionItem>[
                OptionItem(
                  onTap: () => debugPrint('My option works!'),
                  iconData: Icons.chat,
                  title: 'My localized title',
                ),
                OptionItem(
                  onTap: () => debugPrint('Another option working!'),
                  iconData: Icons.chat,
                  title: 'Another localized title',
                ),
              ];
            },
            subtitle: Subtitles([
              Subtitle(
                index: 0,
                start: Duration.zero,
                end: const Duration(seconds: 10),
                text: 'Hello from subtitles',
              ),
              Subtitle(
                index: 1,
                start: const Duration(seconds: 10),
                end: const Duration(seconds: 20),
                text: 'Whats up? :)',
              ),
            ]),
            subtitleBuilder: (context, subtitle) => Container(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                subtitle,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        });
    }
  }

  void netWorkVideo() {
    controller2 = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        setState(() {});
        controller2!.setLooping(true);
        controller2!.play();
      });
  }

  Future<void> requestPermissions() async {
    Map<Permission, PermissionStatus> permissionStatuses = await [
      Permission.camera,
      Permission.storage,
    ].request();

    permissionStatuses.forEach((permission, status) {
      if (permission == Permission.camera &&
          status == PermissionStatus.granted) {
        setState(() {
          isCameraPermissionGranted = true;
        });
      }
      if (permission == Permission.storage &&
          status == PermissionStatus.granted) {
        setState(() {
          isStoragePermissionGranted = true;
        });
      }
      if (permission == Permission.camera &&
          status == PermissionStatus.denied) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.blue,
          content: Text('This permission is recommended for using camera'),
        ));
      }
      if (permission == Permission.storage &&
          status == PermissionStatus.denied) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.blue,
          content: Text('This permission is recommended for using camera'),
        ));
      }
      if (permission == Permission.camera &&
          status == PermissionStatus.permanentlyDenied) {
        openAppSettings();
      }
      if (permission == Permission.storage &&
          status == PermissionStatus.permanentlyDenied) {
        openAppSettings();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('image picker'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FilePicker1()),
                      );
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: const Text(
                      "go to file picker",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Url1()),
                      );
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: const Text(
                      "go to Url Launcher",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
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
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    getImage(ImageSource.camera);
                  },
                  child: Row(
                    children: const [
                      Icon(Icons.camera),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Pick Image form Camera")
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              videoes != null
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AspectRatio(
                          aspectRatio: controller!.value.aspectRatio,
                          child: Chewie(
                            controller: chewieController!,
                          )),
                      // child: VideoPlayer(
                      //   controller!
                      // ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Chewie(
                            controller: ChewieController(
                              videoPlayerController: controller2!,
                              autoPlay: true,
                              looping: true,
                            ),
                          )
                          // child: VideoPlayer(
                          //   controller2!
                          // ),
                          ),
                    ),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    getVideo(ImageSource.gallery);
                  },
                  child: Row(
                    children: const [
                      Icon(Icons.image_outlined),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Pick video form Gallery")
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    getVideo(ImageSource.camera);
                  },
                  child: Row(
                    children: const [
                      Icon(Icons.camera),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Pick video form Camera")
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ));
  }
}
