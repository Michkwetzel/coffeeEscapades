// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffee_escapades/components/mainScreen/cv/generalComponents/contentCard.dart';
import 'package:coffee_escapades/components/mainScreen/cv/generalComponents/roundedImage.dart';
import 'package:coffee_escapades/config/constants.dart';
import 'package:flutter/material.dart';

class EndtoEnd extends StatelessWidget {
  const EndtoEnd({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: ContentCard(
          child: Column(
        spacing: 16,
        children: [
          Text("End-to-End Product Development", style: kH2Q),
          Row(children: [
            Flexible(
              child: Text('Product design, UX Design, Product lifecycle', style: kH5QReg),
            ),
            SizedBox(
              width: 16,
            ),
            RoundedImage(imagePath: 'assets/images/fullstack/endToEnd.jpg')
          ])
        ],
      )),
    );
  }
}
