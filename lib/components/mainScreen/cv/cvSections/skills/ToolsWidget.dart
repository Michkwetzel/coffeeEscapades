// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffee_escapades/components/mainScreen/cv/generalComponents/contentCard.dart';
import 'package:coffee_escapades/components/mainScreen/cv/generalComponents/roundedImage.dart';
import 'package:coffee_escapades/config/constants.dart';
import 'package:flutter/material.dart';

class ToolsWidget extends StatelessWidget {
  const ToolsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final size = MediaQuery.of(context).size;
      double screenWidth = size.width;

      return screenWidth < 1060 ? _SingleColomnLayout() : _returnNormalLayout();
    });
  }

  Widget _SingleColomnLayout() {
    return SizedBox(
      width: 400,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ContentCard(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Tools', style: kH2Q),
                Text(
                  'Riverpod, Provider, GoRouter, Flask, RESTful API, HTTP, AWS SES, Docker, MongoDB, Jupyter, LLM API, AI Agents, Matlab, JSON',
                  style: kH5QReg,
                ),
              ],
            ),
            Column(
              spacing: 16,
              children: [
                Row(
                  spacing: 16,
                  children: [
                    RoundedImage(imagePath: 'assets/images/tools/http.jpg'),
                    RoundedImage(imagePath: 'assets/images/tools/docker.jpg'),
                    RoundedImage(imagePath: 'assets/images/tools/flask.jpg'),
                  ],
                ),
                Row(
                  children: [
                    RoundedImage(imagePath: 'assets/images/tools/aws.jpg'),
                    RoundedImage(imagePath: 'assets/images/tools/jupyter.jpg'),
                    RoundedImage(imagePath: 'assets/images/tools/chatgpt.jpg'),
                  ],
                ),
                Row(
                  spacing: 16,
                  children: [
                    RoundedImage(imagePath: 'assets/images/tools/gemini.jpg'),
                    RoundedImage(imagePath: 'assets/images/tools/mongo.jpg'),
                  ],
                ),
              ],
            )
          ],
        )),
      ),
    );
  }

  SizedBox _returnNormalLayout() {
    return SizedBox(
      width: 1060,
      child: ContentCard(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Tools', style: kH2Q),
                Text(
                  'Riverpod, Provider, GoRouter, Flask, RESTful API, HTTP, AWS SES, Docker, MongoDB, Jupyter, LLM API, AI Agents, Matlab, JSON',
                  style: kH5QReg,
                ),
              ],
            ),
          ),
          Column(
            spacing: 16,
            children: [
              Row(
                spacing: 16,
                children: [
                  RoundedImage(imagePath: 'assets/images/tools/http.jpg'),
                  RoundedImage(imagePath: 'assets/images/tools/docker.jpg'),
                  RoundedImage(imagePath: 'assets/images/tools/aws.jpg'),
                  RoundedImage(imagePath: 'assets/images/tools/jupyter.jpg'),
                  RoundedImage(imagePath: 'assets/images/tools/chatgpt.jpg'),
                ],
              ),
              Row(
                spacing: 16,
                children: [
                  RoundedImage(imagePath: 'assets/images/tools/gemini.jpg'),
                  RoundedImage(imagePath: 'assets/images/tools/mongo.jpg'),
                  RoundedImage(imagePath: 'assets/images/tools/flask.jpg'),
                ],
              )
            ],
          )
        ],
      )),
    );
  }
}
