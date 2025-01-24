// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffee_escapades/components/mainScreen/cv/cvSections/skills/endToEnd.dart';
import 'package:coffee_escapades/components/mainScreen/cv/cvSections/skills/fullstackDev.dart';
import 'package:coffee_escapades/components/mainScreen/cv/cvSections/skills/gCP.dart';
import 'package:flutter/material.dart';

class SkillsColumnWidget extends StatelessWidget {
  const SkillsColumnWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FullStackDev(),
        SizedBox(
          height: 32,
        ),
        GCP(),
        SizedBox(
          height: 32,
        ),
        EndtoEnd()
      ],
    );
  }
}
