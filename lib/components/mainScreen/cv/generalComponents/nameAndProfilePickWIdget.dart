// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffee_escapades/config/constants.dart';
import 'package:flutter/material.dart';

class NameAndProfilePickWIdget extends StatelessWidget {
  const NameAndProfilePickWIdget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            SelectableText('Michael Wetzel', style: kH1Q),
            SelectableText('Flutter Developer', style: kH2Q),
          ],
        ),
        SizedBox(width: 40),
        CircleAvatar(
          radius: 100,
          backgroundImage: AssetImage('assets/images/profilePick.jpg'),
        )
      ],
    );
  }
}
