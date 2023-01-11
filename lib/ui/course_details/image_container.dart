import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final Color placeHolder;
  final String url;

  const ImageContainer(
      {super.key,
      this.width,
      this.height,
      this.placeHolder = const Color(0xFFEEEEEE),
      required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: placeHolder,
        image: url.contains('https')
            ? DecorationImage(image: NetworkImage(url))
            : null,
      ),
    );
  }
}
