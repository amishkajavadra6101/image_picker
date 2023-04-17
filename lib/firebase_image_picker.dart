import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_example/singletone_example.dart';
import 'package:image_picker/image_picker.dart';

class FirebaseImagePicker extends StatefulWidget {
  const FirebaseImagePicker({Key? key}) : super(key: key);

  @override
  State<FirebaseImagePicker> createState() => _FirebaseImagePickerState();
}

class _FirebaseImagePickerState extends State<FirebaseImagePicker> {
  File? images;
  bool isUploading = true;
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
    } catch (e) {
      debugPrint('Error picking image: $e');
    }
  }

  Future<void> upLoadImage() async {
    final storageReference = FirebaseStorage.instance
        .ref() //it  allows us to interact with the Firebase Cloud Storage service.
        .child('test_image_folder') // create folder for store image
        .child(
            '/${DateTime.now().millisecondsSinceEpoch}.jpg'); // image inside the folder
    setState(() {
      isUploading = false;
    });
    try {
      final uploadTask = storageReference.putFile(
          images!); //This line uploads the 'images' file to the storage reference

      await uploadTask.whenComplete(() async {
        //it whill perform after the uploadTask
        final url = await storageReference
            .getDownloadURL(); // it get dwonload url for uploaded image
        FirebaseFirestore.instance.collection('images').add({
          'imageUrl':
              url //create a 'images' collection and store url into 'imageUrl'
        }); // This line adds the download URL to the 'images' collection in Firestore.
        setState(() {
          isUploading = true;
        });
        Fluttertoast.showToast(
            msg: "Image Uploaded...",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            fontSize: 16.0);
        debugPrint('Image uploaded');
      });
    } catch (e) {
      setState(() {
        isUploading = false;
      });
      Fluttertoast.showToast(
          msg: "There is an error while uploading image on firestorage $e",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black54,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  void showProgressDialog() async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            children: const [
              CircularProgressIndicator(),
              SizedBox(width: 20),
              Text("Loading..."),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('firebase_image_storage'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              InkWell(
                  onTap: () {
                    GloableClass().toastExample(
                        'example of Singleton Class ${GloableClass().name}');
                  },
                  child: Text('${GloableClass().name}')),
              ElevatedButton(
                  onPressed: () {
                    GloableClass().sendCall('9925320820');
                  },
                  child: const Text('help')),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Upload a Image on FireStore',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              images == null
                  ? Image.network(
                      "https://firebase.google.com/static/images/brand-guidelines/logo-built_white.png",
                      height: 150,
                      width: 250,
                    )
                  : Image.file(
                      images!,
                      width: 250,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: isUploading == false
                      ? null
                      : () {
                          getImage(ImageSource.gallery);
                        },
                  //     () {
                  //   getImage(ImageSource.gallery);
                  // },
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
                  onPressed: isUploading == false
                      ? null
                      : () {
                          getImage(ImageSource.camera);
                        },
                  //     () {
                  //   getImage(ImageSource.camera);
                  // },
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
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: isUploading == false ? null : upLoadImage,
                  child: Row(
                    children: const [
                      Icon(Icons.camera),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Upload Image")
                    ],
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Read a Image from FireStore',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              Expanded(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('images')
                      .snapshots(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                          child: Text(
                        'no data exists',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ));
                    }
                    return ListView.builder(
                        itemCount: snapshot.data?.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (_) {
                                    return Dialog(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                const Text(
                                                  'Are You Want to Delete ?',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  child: ElevatedButton(
                                                      onPressed: () async {
                                                        await FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                'images')
                                                            .doc(snapshot
                                                                .data
                                                                ?.docs[index]
                                                                .id)
                                                            .delete()
                                                            .whenComplete(() {
                                                          Navigator.of(context)
                                                              .pop();
                                                          Fluttertoast.showToast(
                                                              msg:
                                                                  "Image Deleted....",
                                                              toastLength: Toast
                                                                  .LENGTH_LONG,
                                                              gravity:
                                                                  ToastGravity
                                                                      .BOTTOM,
                                                              timeInSecForIosWeb:
                                                                  3,
                                                              backgroundColor:
                                                                  Colors
                                                                      .black54,
                                                              textColor:
                                                                  Colors.white,
                                                              fontSize: 16.0);
                                                        });
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              backgroundColor:
                                                                  Colors.red),
                                                      child:
                                                          const Text('Delete')),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  CachedNetworkImage(
                                    maxHeightDiskCache: 1080,
                                    imageUrl:
                                        "${snapshot.data?.docs[index]['imageUrl']}",
                                    imageBuilder: (context, imageProvider) {
                                      //By using the imageBuilder property, we can apply transformations, add filters, or wrap the image in other widgets
                                      //before displaying it. For example, we can resize the image, add a border, or apply a blur effect.
                                      return Container(
                                        width: 250,
                                        height: 250,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover),
                                        ),
                                      );
                                    },
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        Image.asset("assets/logo.png"),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
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
