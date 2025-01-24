// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffee_escapades/config/constants.dart';
import 'package:flutter/material.dart';

class BulletPointRow extends StatelessWidget {
  final String text;
  const BulletPointRow({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '•',
          style: kH5QReg,
        ),
        SizedBox(width: 8),
        Expanded(child: Text(text, style: kH5QReg))
      ],
    );
  }
}
