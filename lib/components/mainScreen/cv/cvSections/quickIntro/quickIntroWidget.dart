// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffee_escapades/config/constants.dart';
import 'package:flutter/material.dart';

class QuickIntroWidget extends StatelessWidget {
  const QuickIntroWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1060,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Quick Intro',
            style: kH2Q,
          ),
          SizedBox(
            height: kBetweenHeadingSubSection,
          ),
          Text(
              'Hi Nunc! I\'m Mike and I\'m a budding Flutter developer. I love good design and clean modular code. My main tech strengths are - knowing how to find out what I don\'t know - and - Project planning/vision -. I am also a very social individual and can connect easily with others. I try and do things that scare me often and love a challenge. Your website and product are pretty awesome. It\'s sleek, it\'s sexy and of course, it\'s coffee.',
              style: kH4QReg)
        ],
      ),
    );
  }
}
