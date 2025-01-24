// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffee_escapades/components/mainScreen/cv/cvSections/workHistory/EfficiencyFirstWidget.dart';
import 'package:coffee_escapades/components/mainScreen/cv/cvSections/workHistory/INKSolutionsWidget.dart';
import 'package:coffee_escapades/components/mainScreen/cv/cvSections/workHistory/TravelBuddyWidget.dart';
import 'package:coffee_escapades/config/constants.dart';
import 'package:flutter/material.dart';

class WorkExperienceLayout extends StatelessWidget {
  const WorkExperienceLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EfficiencyFirstWidget(),
        SizedBox(width: 60),
        Column(
          children: [
            SizedBox(
              height: 63,
            ),
            TravelBuddyWidget(),
            SizedBox(
              height: kBetweenSubSections,
            ),
            INKSolutionsWidget()
          ],
        )
      ],
    );
  }
}
