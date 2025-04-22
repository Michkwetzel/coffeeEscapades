// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffee_escapades/components/buttons/customButton.dart';
import 'package:coffee_escapades/components/mainScreen/cv/cvSections/basicInfo/passportRow.dart';
import 'package:coffee_escapades/components/mainScreen/cv/generalComponents/contentCard.dart';
import 'package:coffee_escapades/components/mainScreen/cv/generalComponents/headingBodyRow.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GeneralInfoWidget extends StatelessWidget {
  const GeneralInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: ContentCard(
        heading: 'General Info:',
        child: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadingBodyRow(heading: 'Email:', body: 'michkwetzel@gmail.com'),
            HeadingBodyRow(heading: 'Phone:', body: '+27 72 435 8225'),
            PassportRow(),
            HeadingBodyRow(heading: 'Language:', body: 'English, Afrikaans'),
            HeadingBodyRow(heading: 'Location:', body: 'Cape Town but keen to move'),
            SizedBox(
              height: 2,
            ),
            Row(
              spacing: 8,
              children: [
                customButton(
                  onPressed: () => launchUrl(Uri.parse("https://drive.google.com/drive/folders/1jDQvBBMNCisvS1ibdmVVcbqWDHGfaNur?usp=sharing")),
                  buttonText: "CV",
                  color: Colors.white,
                ),
                customButton(
                  onPressed: () => launchUrl(Uri.parse("https://drive.google.com/file/d/1zpOFOZgO6iGGD17zbT4SeXYl6KYvzJN3/view?usp=sharing")),
                  buttonText: "Intro Video",
                  color: Colors.white,
                  actionButton: true,
                ),
                customButton(
                  onPressed: () => launchUrl(Uri.parse("https://github.com/Michkwetzel")),
                  buttonText: "Github",
                  color: Colors.white,
                ),
                customButton(
                  onPressed: () => launchUrl(Uri.parse("https://www.linkedin.com/in/michkwetzel/")),
                  buttonText: "Linkedin",
                  color: Colors.white,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
