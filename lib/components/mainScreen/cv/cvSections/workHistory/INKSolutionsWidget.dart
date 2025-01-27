// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffee_escapades/components/mainScreen/cv/generalComponents/bulletPointRow.dart';
import 'package:coffee_escapades/components/mainScreen/cv/generalComponents/contentCard.dart';
import 'package:coffee_escapades/components/mainScreen/cv/generalComponents/job_heading_info_widget.dart';
import 'package:coffee_escapades/config/constants.dart';
import 'package:flutter/material.dart';

class INKSolutionsWidget extends StatelessWidget {
  const INKSolutionsWidget({
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
            jobTitle: 'Junior AI Engineer',
            dates: 'Jan 2024 - Jun 2024',
            companyName: "INK Solutions",
            location: 'Remote, Poland',
            imagePath: 'assets/images/company/ink.png',
          ),
          SizedBox(height: kGeneralSpace),
          BulletPointRow(text: 'Project: AI RAG Agent called Alpha'),
          BulletPointRow(text: 'Led end-to-end migration of platform logging from MongoDB to DataDog'),
          BulletPointRow(text: 'Redesigned AI agent system prompts and successfully reduced error rates in step-by-step instruction following'),
          BulletPointRow(text: 'Front-end: Slack, Back-end: Python'),
        ],
      )),
    );
  }
}
