// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffee_escapades/components/mainScreen/cv/cvSections/basicInfo/generalInfoWidget.dart';
import 'package:coffee_escapades/components/mainScreen/cv/cvSections/builtByMe/buildByMe.dart';
import 'package:coffee_escapades/components/mainScreen/cv/cvSections/education/bootcampWidget.dart';
import 'package:coffee_escapades/components/mainScreen/cv/cvSections/education/educationWidget.dart';
import 'package:coffee_escapades/components/mainScreen/cv/cvSections/hobbies/gobbiesWidget.dart';
import 'package:coffee_escapades/components/mainScreen/cv/cvSections/quickIntro/quickIntroWidget.dart';
import 'package:coffee_escapades/components/mainScreen/cv/cvSections/skills/ToolsWidget.dart';
import 'package:coffee_escapades/components/mainScreen/cv/cvSections/skills/skillsColumnWidget.dart';
import 'package:coffee_escapades/components/mainScreen/cv/cvSections/workHistory/workExperienceLayout.dart';
import 'package:coffee_escapades/components/mainScreen/cv/generalComponents/nameAndProfilePickWIdget.dart';
import 'package:coffee_escapades/components/mainScreen/lightSpeedCoffee/components/topWidget.dart';
import 'package:coffee_escapades/config/constants.dart';
import 'package:flutter/material.dart';

class CVLayout extends StatelessWidget {
  const CVLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TopWidget(),
          NameAndProfilePickWIdget(),
          SizedBox(height: kBetweenMainSections),
          SizedBox(
            width: 1060,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GeneralInfoWidget(),
                    SizedBox(width: 60),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BuiltByMeWidget(),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: kBetweenMainSections),
                QuickIntroWidget(),
                SizedBox(height: kBetweenMainSections),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SkillsColumnWidget(),
                    SizedBox(width: 60),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        EducationWidget(),
                        SizedBox(height: 32),
                        BootcampWidget(),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 32,
                ),
                ToolsWidget(),
                SizedBox(
                  height: kBetweenMainSections,
                ),
                WorkExperienceLayout(),
                HobbiesWidget()
              ],
            ),
          ),
          SizedBox(
            height: kBetweenMainSections,
          )
        ],
      ),
    );
  }
}
