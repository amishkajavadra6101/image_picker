import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedNetworkImageExample extends StatefulWidget {
  const CachedNetworkImageExample({Key? key}) : super(key: key);

  @override
  State<CachedNetworkImageExample> createState() =>
      _CachedNetworkImageExampleState();
}

class _CachedNetworkImageExampleState extends State<CachedNetworkImageExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cached_NetworkImage_Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl:
                  'https://images.unsplash.com/photo-1532264523420-881a47db012d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9',
              imageBuilder: (context, imageProvider) {
                return Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                    ),
                  ),
                );
              },
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) =>
                  Image.asset("assets/logo.png"),
            ),
          ],
        ),
      ),
    );
  }
}
