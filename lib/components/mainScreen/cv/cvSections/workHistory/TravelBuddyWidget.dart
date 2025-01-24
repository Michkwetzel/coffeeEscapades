// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffee_escapades/components/mainScreen/cv/generalComponents/bulletPointRow.dart';
import 'package:coffee_escapades/components/mainScreen/cv/generalComponents/contentCard.dart';
import 'package:coffee_escapades/components/mainScreen/cv/generalComponents/job_heading_info_widget.dart';
import 'package:coffee_escapades/config/constants.dart';
import 'package:flutter/material.dart';

class TravelBuddyWidget extends StatelessWidget {
  const TravelBuddyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: ContentCard(
        child: Column(
          spacing: 4,
          children: [
            JobHeadingInfoWidget(
              jobTitle: 'Full Stack Developer',
              dates: 'Jun 2024 - Oct 2024',
              companyName: "TravelBuddy",
              location: "Remote",
              imagePath: 'assets/images/company/travelbuddy.png',
            ),
            SizedBox(height: kGeneralSpace),
            Row(
              children: [
                Expanded(
                  child: Column(
                    spacing: 4,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BulletPointRow(text: 'AI travel agent'),
                      BulletPointRow(text: 'Flutter'),
                      BulletPointRow(text: 'Google Cloud Functions/Run'),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    spacing: 4,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BulletPointRow(text: 'Personal Project'),
                      BulletPointRow(text: 'Responsive Design'),
                      BulletPointRow(text: 'Gemini API'),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
