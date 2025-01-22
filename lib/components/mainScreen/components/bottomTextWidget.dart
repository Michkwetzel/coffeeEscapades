// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:coffee_escapades/config/constants.dart';
import 'package:flutter/material.dart';

class BottomTextWidget extends StatelessWidget {
  const BottomTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Text(
            "Welcome to the quickest brew in the galaxy",
            style: kBottomWidgetTextStyle,
          ),
        ),
      ],
    );
  }
}
