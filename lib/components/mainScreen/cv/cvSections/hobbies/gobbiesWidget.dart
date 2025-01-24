// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffee_escapades/components/mainScreen/cv/generalComponents/contentCard.dart';
import 'package:coffee_escapades/config/constants.dart';
import 'package:flutter/material.dart';

class HobbiesWidget extends StatelessWidget {
  const HobbiesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1060,
      child: ContentCard(
        heading: "Hobbies",
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Boxing', style: kH4QReg),
                Text('Guitar/Piano', style: kH4QReg),
                Text('Running', style: kH4QReg),
                Text('Chess', style: kH4QReg),
              ],
            ),
            SizedBox(
              width: kGeneralSpace,
            ),
            Row(
              spacing: 4,
              children: [
                ClipRRect(borderRadius: BorderRadius.circular(8), child: Image.asset('assets/images/hobbies/chess.jpg', scale: 1.6)),
                ClipRRect(borderRadius: BorderRadius.circular(8), child: Image.asset('assets/images/hobbies/tft.jpg', scale: 1.6)),
                ClipRRect(borderRadius: BorderRadius.circular(8), child: Image.asset('assets/images/hobbies/boxing.jpg', scale: 1.6)),
              ],
            ),
            SizedBox(
              width: kGeneralSpace,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Horrible Jokes', style: kH4QReg),
                Text('Snowboarding', style: kH4QReg),
                Text('Reading', style: kH4QReg),
                Text('Gamer at Heart', style: kH4QReg),
              ],
            ),
            SizedBox(
              width: kGeneralSpace,
            ),
            Row(
              spacing: 4,
              children: [
                ClipRRect(borderRadius: BorderRadius.circular(8), child: Image.asset('assets/images/hobbies/guitar.jpg', scale: 1.6)),
                ClipRRect(borderRadius: BorderRadius.circular(8), child: Image.asset('assets/images/hobbies/snowboard.jpg', scale: 1.6)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
