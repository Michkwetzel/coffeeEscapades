// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffee_escapades/components/mainScreen/cv/generalComponents/contentCard.dart';
import 'package:coffee_escapades/components/mainScreen/cv/generalComponents/roundedImage.dart';
import 'package:coffee_escapades/config/constants.dart';
import 'package:flutter/material.dart';

class GCP extends StatelessWidget {
  const GCP({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: ContentCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            Text("Google Cloud Architecture", style: kH2Q),
            Row(
              children: [
                RoundedImage(imagePath: 'assets/images/fullstack/cloud.jpg'),
                SizedBox(
                  width: kGeneralSpace,
                ),
                Flexible(
                  child: Text('Firestore, Authentication, Firebase Hosting, Google Run, Cloud Functions, Local Emulators', style: kH5QReg),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
