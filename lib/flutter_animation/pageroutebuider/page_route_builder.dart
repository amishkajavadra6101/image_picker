import 'package:flutter/material.dart';
import 'package:image_example/flutter_animation/pageroutebuider/route1.dart';
import 'package:image_example/widget/custom_app_bar.dart';

import '../../helper/button.dart';

class PageRouteBuilderExample extends StatefulWidget {
  const PageRouteBuilderExample({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PageRouteBuilderExampleState createState() =>
      _PageRouteBuilderExampleState();
}

class _PageRouteBuilderExampleState extends State<PageRouteBuilderExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomMyAppBar(
        title: "PageRouteBuilder",
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HelperButton(
                text: 'Slide Transition',
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const Route1(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return SlideTransition(
                          position: Tween(
                                  begin: const Offset(1.0, 0.0),
                                  end: Offset.zero)
                              .animate(animation),
                          child: child,
                        );
                      },
                    ),
                  );
                }),
            HelperButton(
                text: 'left Transition',
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const Route1(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return SlideTransition(
                          position: Tween(
                                  begin: const Offset(-1.0, 0.0),
                                  end: Offset.zero)
                              .animate(animation),
                          child: child,
                        );
                      },
                    ),
                  );
                }),
            HelperButton(
                text: 'bottom Transition',
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const Route1(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return SlideTransition(
                          position: Tween(
                                  begin: const Offset(0.0, 1.0),
                                  end: Offset.zero)
                              .animate(animation),
                          child: child,
                        );
                      },
                    ),
                  );
                }),
            HelperButton(
                text: 'Fade Transition',
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const Route1(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                    ),
                  );
                }),
            HelperButton(
                text: 'SizeTransition',
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const Route1(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return SizeTransition(
                          sizeFactor: animation,
                          child: child,
                        );
                      },
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
