import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class ImagePickerExample extends StatefulWidget {
  const ImagePickerExample({Key? key}) : super(key: key);

  @override
  State<ImagePickerExample> createState() => _ImagePickerExampleState();
}

class _ImagePickerExampleState extends State<ImagePickerExample> {
  File? images;
  File? videoes;
  VideoPlayerController? controller;
  VideoPlayerController? controller2;
  ChewieController? chewieController;

  @override
  void initState() {
    super.initState();
    FirebaseCrashlytics.instance.setCustomKey("useUID", "Amish Kajavadra");
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
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) {
        return;
      }
      // final imagesave = await saveImage(image.path);
      final imagesave = File(image.path);
      setState(() {
        images = imagesave;
      });
      await FirebaseAnalytics.instance.logEvent(
        name: 'image_picked',
        parameters: {'source': source.toString()},
      );
    } catch (e) {
      debugPrint('Error picking image: $e');
    }
  }

  Future<void> getVideo(ImageSource source) async {
    try {
      await FirebaseAnalytics.instance.logEvent(
        name: 'video_picked',
        parameters: {'source': source.toString()},
      );
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
      await FirebaseAnalytics.instance.logEvent(
        name: 'video_picked',
        parameters: {'source': source.toString()},
      );
    } catch (e) {
      debugPrint("$e");
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image and Video Picker Example'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
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
                  child: const Row(
                    children: [
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
                  child: const Row(
                    children: [
                      Icon(Icons.camera),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Pick Image form Camera")
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                    onPressed: () {
                      FirebaseCrashlytics.instance.crash();
                    },
                    child: const Text("Example of firebase_crashlytics")),
              ),
              // SizedBox(
              //   width: 250,
              //   child: ElevatedButton(
              //       onPressed: () {
              //         //   try {
              //         //     final List<int> list = [1, 2, 3];
              //         //     final int item = list[4];
              //         //   } catch (e, stackTrace) {
              //         //     FirebaseCrashlytics.instance.recordError(e, stackTrace);
              //         //   }
              //         try {
              //           // Generate a null pointer exception
              //           String message;
              //           print('${message.length}');
              //         } catch (error, stackTrace) {
              //           // Report the non-fatal error to Firebase Crashlytics
              //           FirebaseCrashlytics.instance.recordError(
              //             error,
              //             stackTrace,
              //             reason: 'A non-fatal error occurred',
              //             fatal: false,
              //           );
              //         }
              //       },
              //       child: const Text("Example of fatal_crash")),
              // ),
              // SizedBox(
              //   width: 250,
              //   child: ElevatedButton(
              //       onPressed: () {
              //         throw Exception('This is a fatal crash!');
              //       },
              //       child: const Text("Example of non fatal_crash")),
              // ),
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
                  child: const Row(
                    children: [
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
                  child: const Row(
                    children: [
                      Icon(Icons.camera),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Pick video form Camera")
                    ],
                  ),
                  onPressed: () {
                    getVideo(ImageSource.camera);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
