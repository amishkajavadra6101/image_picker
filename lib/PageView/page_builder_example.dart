import 'package:flutter/material.dart';

class MyPageView extends StatefulWidget {
  const MyPageView({super.key});

  @override
  _MyPageViewState createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  final PageController _controller = PageController(initialPage: 0);
  final List<String> _pageTitles = [
    'Page 1',
    'Page 2',
    'Page 3',
    'Page 4',
    'Page 5'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: SafeArea(
          child: PageView.builder(
            controller: _controller,
            itemCount: _pageTitles.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: Colors.purple,
                child: Center(
                  child: Text(
                    _pageTitles[index],
                    style: const TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
