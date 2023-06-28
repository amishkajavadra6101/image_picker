import 'package:flutter/material.dart';

final globalBucket = PageStorageBucket();

class PageStorageExample extends StatefulWidget {
  const PageStorageExample({Key? key}) : super(key: key);

  @override
  State<PageStorageExample> createState() => _PageStorageExampleState();
}

class _PageStorageExampleState extends State<PageStorageExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scrollable Page'),
      ),
      /*it is used to store the state of the widget, and ensure that it is preserved when navigating back and forth between screens*/
      body: PageStorage(
        /*it holds the state information for the current page. When a new page is navigated to, the state information for the current page
        is stored in the bucket, and when the user returns to the previous page, the state is retrieved from the bucket and restored.*/
        bucket: PageStorageBucket(),
        child: ListView.builder(
          key: const PageStorageKey<String>("listViewKey"),
          itemCount: 100,
          itemBuilder: (context, index) => ListTile(
            title: Text(
              'List item ${index + 1}',
              style: const TextStyle(fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}
