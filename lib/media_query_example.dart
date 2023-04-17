import 'package:flutter/material.dart';

class MediaQueryExample extends StatelessWidget {
  const MediaQueryExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('media_query_example'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.6,
                color: Colors.red,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Example of portrait',
                      style: TextStyle(color: Colors.white),
                    ),
                    MediaQuery.of(context).size.shortestSide < 600
                        ? const Text(
                            'This is Mobile',
                            style: TextStyle(color: Colors.white),
                          )
                        : const Text(
                            'This may be table or leptop',
                            style: TextStyle(color: Colors.white),
                          ),
                    Text(
                      'Heidht is $screenHeight',
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Width is $screenWidth',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                )),
              ),
            );
          } else {
            return Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.6,
                color: Colors.yellow,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Example of landscape',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Height is $screenHeight',
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Width is $screenWidth',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                )),
              ),
            );
          }
        },
      ),
      // body: Builder(
      //   builder: (context) {
      //     if (MediaQuery.of(context).orientation == Orientation.portrait) {
      //       return Center(
      //         child: Container(
      //           width: MediaQuery.of(context).size.width * 0.8,
      //           height: MediaQuery.of(context).size.height * 0.6,
      //           color: Colors.red,
      //           child: const Center(
      //               child: Text(
      //             'Example of portrait',
      //             style: TextStyle(color: Colors.white),
      //           )),
      //         ),
      //       );
      //     } else {
      //       return Center(
      //         child: Container(
      //           width: MediaQuery.of(context).size.width * 0.8,
      //           height: MediaQuery.of(context).size.height * 0.6,
      //           color: Colors.yellow,
      //           child: const Center(
      //               child: Text(
      //             'Example of landscape',
      //             style: TextStyle(color: Colors.white),
      //           )),
      //         ),
      //       );
      //     }
      //   },
      // )
    );
  }
}
