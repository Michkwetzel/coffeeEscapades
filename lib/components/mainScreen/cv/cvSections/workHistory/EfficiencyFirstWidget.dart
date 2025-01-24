// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffee_escapades/components/mainScreen/cv/generalComponents/bulletPointRow.dart';
import 'package:coffee_escapades/components/mainScreen/cv/generalComponents/contentCard.dart';
import 'package:coffee_escapades/components/mainScreen/cv/generalComponents/job_heading_info_widget.dart';
import 'package:coffee_escapades/config/constants.dart';
import 'package:flutter/material.dart';

class EfficiencyFirstWidget extends StatelessWidget {
  const EfficiencyFirstWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: ContentCard(
        heading: 'Relevant Work Experience',
        child: Column(
          spacing: 6,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            JobHeadingInfoWidget(
              jobTitle: 'Lead Software Developer',
              dates: 'Oct 2024 - Current',
              imagePath: 'assets/images/company/first.png',
              companyName: 'Efficiency-1st',
              location: 'Remote, USA',
            ),
            SizedBox(height: kGeneralSpace),
            BulletPointRow(text: 'Solo development of full-stack MVP'),
            BulletPointRow(text: 'Led end-to-end project planning, system design, and implementation'),
            BulletPointRow(text: 'UX/UI designed on Figma before implementation'),
            BulletPointRow(text: 'Crafted software product from requirements doc and vision discussion'),
            SizedBox(height: kGeneralSpace),
            Row(
              children: [
                Expanded(
                  child: Column(
                    spacing: 4,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Back-end', style: kH4QReg),
                      SizedBox(height: 8),
                      BulletPointRow(text: 'Database: Firestore'),
                      BulletPointRow(text: 'Language: Python'),
                      BulletPointRow(text: 'Hosted on Google Cloud Functions'),
                      BulletPointRow(text: 'Used Local Emulator before deployment'),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    spacing: 4,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Front-end', style: kH4QReg),
                      SizedBox(height: 8),
                      BulletPointRow(text: 'Flutter + Dart'),
                      BulletPointRow(text: 'State Magement: RiverPod'),
                      BulletPointRow(text: 'Google Cloud Hosting'),
                      BulletPointRow(text: 'Google Cloud Auth'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
