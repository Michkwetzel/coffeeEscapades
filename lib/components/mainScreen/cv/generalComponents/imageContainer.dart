// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;

  const ImageContainer({
    required this.imagePath,
    super.key,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Image.asset(
        imagePath,
        width: width,
        height: height,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
