// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffee_escapades/components/mainScreen/cv/generalComponents/contentCard.dart';
import 'package:coffee_escapades/config/constants.dart';
import 'package:flutter/material.dart';

class EducationWidget extends StatelessWidget {
  const EducationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: ContentCard(
          heading: 'Education',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('2017-2022', style: kH5QReg),
              Text('BSc. Engineering in Mechatronics', style: kH2Q),
              Text('University of Cape Town,', style: kH5QReg),
              Text('South Africa', style: kH5QReg),
              SizedBox(height: 8),
              Text('Embedded Systems, Robotics, Analog and Digital Electronics, Signals and Systems, Control Theory, Arduino and Raspberry Pi', style: kH5QReg)
            ],
          )),
    );
  }
}
