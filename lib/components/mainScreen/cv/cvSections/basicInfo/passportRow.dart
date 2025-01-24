// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffee_escapades/components/mainScreen/cv/generalComponents/imageContainer.dart';
import 'package:coffee_escapades/config/constants.dart';
import 'package:flutter/material.dart';

class PassportRow extends StatelessWidget {
  const PassportRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 130,
          child: Text('Passports:', style: kH4QReg),
        ),
        Row(
          children: [
            ImageContainer(imagePath: 'assets/images/flags/german.jpg', width: 16),
            SizedBox(width: kBetweenTextSpace),
            Text('German', style: kH5QReg),
            SizedBox(width: kBetweenTextSpace * 2),
            ImageContainer(imagePath: 'assets/images/flags/sa.jpg', width: 16),
            SizedBox(width: kBetweenTextSpace * 2),
            Text('South African', style: kH5QReg),
          ],
        )
      ],
    );
  }
}
