// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  final String imagePath;
  const RoundedImage({
    required this.imagePath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Image.asset(imagePath, scale: 0.7),
    );
  }
}
