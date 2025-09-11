// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffee_escapades/components/mainScreen/cv/generalComponents/contentCard.dart';
import 'package:coffee_escapades/components/mainScreen/cv/generalComponents/roundedImage.dart';
import 'package:coffee_escapades/config/constants.dart';
import 'package:flutter/material.dart';

class FullStackDev extends StatelessWidget {
  const FullStackDev({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: ContentCard(
        heading: 'Skills',
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Full Stack Development',
              style: kH2Q,
            ),
            SelectableText(
              'Proficient: Flutter, Dart, Python, Figma',
              style: kH5QReg,
            ),
            SelectableText(
              'Experience: C++, Java, Matlab, Julia, Assembly',
              style: kH5QReg,
            ),
            Row(
              spacing: 16,
              children: [
                RoundedImage(imagePath: 'assets/images/fullstack/flutter.jpg'),
                RoundedImage(imagePath: 'assets/images/fullstack/dart.jpg'),
                RoundedImage(imagePath: 'assets/images/fullstack/figma.jpg'),
                RoundedImage(imagePath: 'assets/images/fullstack/python.jpg'),
                RoundedImage(imagePath: 'assets/images/fullstack/java.jpg'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
