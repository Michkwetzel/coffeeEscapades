// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffee_escapades/config/constants.dart';
import 'package:flutter/material.dart';

class ContentCard extends StatelessWidget {
  final String? heading;
  final Widget child;
  const ContentCard({this.heading, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return heading != null
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(heading!, style: kH2Q),
              SizedBox(height: kBetweenHeadingSubSection),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 44, vertical: 32),
                decoration: kContentCards,
                child: child,
              ),
            ],
          )
        : Container(
            padding: EdgeInsets.symmetric(horizontal: 44, vertical: 32),
            decoration: kContentCards,
            child: child,
          );
  }
}
