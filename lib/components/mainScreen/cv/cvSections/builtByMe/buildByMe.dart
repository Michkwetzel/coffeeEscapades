// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffee_escapades/components/buttons/customButton.dart';
import 'package:coffee_escapades/components/mainScreen/cv/generalComponents/contentCard.dart';
import 'package:coffee_escapades/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BuiltByMeWidget extends StatelessWidget {
  const BuiltByMeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: ContentCard(
        heading: 'Built by me:',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  children: [
                    SizedBox(width: 175, child: SelectableText('Efficiency-1st', style: kH4QReg)),
                    SizedBox(width: 175, child: SelectableText('test@gmail.com', style: kH5QReg)),
                    SizedBox(width: 175, child: SelectableText('Password: 123456', style: kH5QReg)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        customButton(onPressed: () => launchUrl(Uri.parse("https://dashboard-fdda8.web.app/")), buttonText: "Dashboard", color: Colors.white),
                        SizedBox(
                          width: 18,
                        ),
                        customButton(onPressed: () => launchUrl(Uri.parse("https://assessment-909ce.web.app/?token2=test&token1=test")), buttonText: "Survey", color: Colors.white),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    customButton(onPressed: () => launchUrl(Uri.parse("https://drive.google.com/drive/folders/1qXbBFx1-CjUmBRxpq1scSCtlQL8mTnvQ?usp=sharing")), buttonText: "File tree", color: Colors.white),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 160, child: SelectableText('TravelBuddy', style: kH4QReg)),
                    SizedBox(width: 175, child: SelectableText('Create an Account', style: kH5QReg)),
                  ],
                ),
                customButton(onPressed: () => launchUrl(Uri.parse("https://travelai-88a07.web.app/")), buttonText: "Home", color: Colors.white),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              spacing: 16,
              children: [
                SizedBox(width: 160, child: SelectableText('This Web App', style: kH4QReg)),
                customButton(onPressed: () => launchUrl(Uri.parse("https://github.com/Michkwetzel/coffeeEscapades")), buttonText: "Github Repo", color: Colors.white),
                customButton(
                    onPressed: () => launchUrl(Uri.parse("https://www.figma.com/design/PJeXa42i9ULRPZxKl07wQq/CoffeeResume?node-id=0-1&t=cqbuK4yo1sSxVaTl-1")),
                    buttonText: "Figma",
                    color: Colors.white)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
