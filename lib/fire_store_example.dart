import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_example/firebase_image_picker.dart';

class FireStoreExample extends StatefulWidget {
  const FireStoreExample({Key? key}) : super(key: key);

  @override
  State<FireStoreExample> createState() => _FireStoreExampleState();
}

class _FireStoreExampleState extends State<FireStoreExample> {
  TextEditingController pname = TextEditingController();
  TextEditingController pprice = TextEditingController();
  TextEditingController pquntity = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Example of firestore'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Write Data to FireStore',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const Cform(),
              const Text(
                'Read a data from FireStore',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Expanded(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('products')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
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
                                                  'Upadate and delete a \n data from firestore',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                TextFormField(
                                                  decoration:
                                                      const InputDecoration(
                                                    hintText:
                                                        'enter your product name',
                                                    labelText: 'name',
                                                  ),
                                                  controller: pname,
                                                ),
                                                TextFormField(
                                                  decoration:
                                                      const InputDecoration(
                                                    hintText:
                                                        'enter your product price',
                                                    labelText: 'price',
                                                  ),
                                                  controller: pprice,
                                                ),
                                                TextFormField(
                                                  decoration:
                                                      const InputDecoration(
                                                    hintText:
                                                        'enter your Quntity',
                                                    labelText: 'quntity',
                                                  ),
                                                  controller: pquntity,
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
                                                              'products')
                                                          .doc(snapshot.data
                                                              ?.docs[index].id)
                                                          .update({
                                                        'pname': pname.text,
                                                        "pprice": pprice.text,
                                                        "pquntity":
                                                            pquntity.text,
                                                      }).whenComplete(() =>
                                                              Navigator.of(
                                                                      context)
                                                                  .pop());
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            backgroundColor:
                                                                Colors.red),
                                                    child: const Text(
                                                      "Updata",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 20),
                                                    ),
                                                  ),
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
                                                              'products')
                                                          .doc(snapshot.data
                                                              ?.docs[index].id)
                                                          .delete()
                                                          .whenComplete(() =>
                                                              Navigator.of(
                                                                      context)
                                                                  .pop());
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            backgroundColor:
                                                                Colors.red),
                                                    child: const Text(
                                                      "Delete",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 20),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            },
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                        'Product name : ${snapshot.data?.docs[index]['pname']}'),
                                    Text(
                                        'Product Price : ${snapshot.data?.docs[index]['pprice']}'),
                                    Text(
                                        'Product Quntity : ${snapshot.data?.docs[index]['pquntity']}'),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  },
                ),
              ),
            ],
          ),
        ));
  }
}

class Cform extends StatefulWidget {
  const Cform({Key? key}) : super(key: key);

  @override
  State<Cform> createState() => _CformState();
}

class _CformState extends State<Cform> {
  TextEditingController pname = TextEditingController();
  TextEditingController pprice = TextEditingController();
  TextEditingController pquntity = TextEditingController();
  CollectionReference products =
      FirebaseFirestore.instance.collection('products');
  //CollectionReference is used to represent a collection of documents within a Firestore database
  void dataAdd() async {
    await products.add({
      "pname": pname.text.trim(),
      "pprice": pprice.text.trim(),
      "pquntity": pquntity.text.trim(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(
              hintText: 'enter your product name',
              labelText: 'name',
              icon: Icon(Icons.date_range)),
          controller: pname,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter Some Text';
            }
            return null;
          },
        ),
        TextFormField(
          decoration: const InputDecoration(
              hintText: 'enter your product price',
              labelText: 'price',
              icon: Icon(Icons.date_range)),
          controller: pprice,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter Some Text';
            }
            return null;
          },
        ),
        TextFormField(
          decoration: const InputDecoration(
              hintText: 'enter your Quntity',
              labelText: 'quntity',
              icon: Icon(Icons.date_range)),
          controller: pquntity,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter Some Text';
            }
            return null;
          },
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: () {
                dataAdd();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text(
                "Submit",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FirebaseImagePicker()),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text(
                "Firebase_images_Storage",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
