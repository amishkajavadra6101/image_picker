import 'package:flutter/material.dart';

class ScrollBarExample extends StatefulWidget {
  const ScrollBarExample({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ScrollBarExampleState createState() => _ScrollBarExampleState();
}

class _ScrollBarExampleState extends State<ScrollBarExample> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('example of scrollbar'),
      ),
      body: RawScrollbar(
        controller: _scrollController,
        thumbColor: Colors.blue,
        radius: const Radius.circular(8),
        thickness: 8,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: 100,
          itemBuilder: (context, index) {
            return ListTile(title: Text('Item $index'));
          },
        ),
      ),
      floatingActionButton: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
              onPressed: () {
                _scrollController.animateTo(
                  0,
                  duration: const Duration(seconds: 2),
                  curve: Curves.easeInOut,
                );
              },
              child: const Icon(Icons.keyboard_arrow_up_sharp)),
          TextButton(
              onPressed: () {
                _scrollController.animateTo(
                  _scrollController.position.maxScrollExtent,
                  duration: const Duration(seconds: 2),
                  curve: Curves.easeInOut,
                );
              },
              child: const Icon(Icons.keyboard_arrow_down_sharp)),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
