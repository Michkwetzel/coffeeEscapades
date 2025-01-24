// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HyperLinkWidget extends StatelessWidget {
  final String body;
  const HyperLinkWidget({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      body,
      onTap: () => launchUrl(Uri.parse(body)),
    );
  }
}
