// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffee_escapades/config/constants.dart';
import 'package:flutter/material.dart';

class BootcampWidget extends StatelessWidget {
  const BootcampWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 450,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bootcamps',
            style: kH2Q,
          ),
          SizedBox(
            height: 32,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Flutter Bootcamp', style: kH4QReg),
                  SizedBox(height: 4),
                  Text('London App Brewery', style: kH5QReg),
                  SizedBox(height: 20),
                  Text('Intro to Pandas', style: kH4QReg),
                  SizedBox(height: 4),
                  Text('Kaggle', style: kH5QReg),
                ],
              ),
              SizedBox(
                width: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Deeplearning', style: kH4QReg),
                  SizedBox(height: 4),
                  Text('Coursera', style: kH5QReg),
                  SizedBox(height: 20),
                  Text('Machine learning', style: kH4QReg),
                  SizedBox(height: 4),
                  Text('Kaggle', style: kH5QReg),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
