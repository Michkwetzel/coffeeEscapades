// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffee_escapades/components/mainScreen/cv/generalComponents/hyperLinkWidget.dart';
import 'package:coffee_escapades/config/constants.dart';
import 'package:flutter/material.dart';

class HeadingBodyRow extends StatelessWidget {
  final String heading;
  final String body;
  final bool hyperLink;
  const HeadingBodyRow({required this.heading, required this.body, this.hyperLink = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 130,
          child: Text(heading, style: kH4QReg),
        ),
        hyperLink
            ? HyperLinkWidget(body: body)
            : SelectableText(
                body,
                style: kH5QReg,
              )
      ],
    );
  }
}
