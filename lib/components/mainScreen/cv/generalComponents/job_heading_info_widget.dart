// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffee_escapades/config/constants.dart';
import 'package:flutter/material.dart';

class JobHeadingInfoWidget extends StatelessWidget {
  final String jobTitle;
  final String dates;
  final String imagePath;
  final String companyName;
  final String location;

  const JobHeadingInfoWidget({
    required this.jobTitle,
    required this.dates,
    required this.companyName,
    required this.location,
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              jobTitle,
              style: kH5QReg,
            ),
            Text(
              dates,
              style: kH5QReg,
            )
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 8,
              children: [
                CircleAvatar(
                    backgroundImage: AssetImage(
                      imagePath,
                    ),
                    radius: 20),
                Text(companyName, style: kH4QReg),
              ],
            ),
            Text(location, style: kH5QReg),
          ],
        )
      ],
    );
  }
}
