// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffee_escapades/components/buttons/buttonsRow.dart';
import 'package:coffee_escapades/components/buttons/customButton.dart';
import 'package:coffee_escapades/components/mainScreen/components/bottomTextWidget.dart';
import 'package:coffee_escapades/components/mainScreen/components/coffeeMugWidget.dart';
import 'package:coffee_escapades/components/mainScreen/components/topWidget.dart';
import 'package:coffee_escapades/config/constants.dart';
import 'package:coffee_escapades/config/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class MainLayout extends ConsumerStatefulWidget {
  MainLayout({super.key});

  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends ConsumerState<MainLayout> {
  // Hi and welcome to my Code
  // Honestly. THe pdf display widget i just asked Claude.
  // I tried with the pdf packages but it just wouldnt load my pdf and at 5pm I just wanted to send it to you guys
  // Anyways: This is my main layout. Enjoy!
  final Color cupColor = Color(0xFF336334);
  final double cupSideWidth = 4;
  final int handleSideWidth = 10;

  @override
  Widget build(BuildContext context) {
    final isBrewingFinished = ref.watch(brewingStateProvider).finished;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 40),
        TopWidget(),
        Expanded(
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 800),
            transitionBuilder: (Widget child, Animation<double> animation) {
              // Slide and fade animation
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1.0, 0.0), // Slide from right
                  end: Offset.zero,
                ).animate(CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeInOutCubic,
                )),
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              );
            },
            child: isBrewingFinished ? cvLayout() : LightSpeedCoffeeLayout(cupColor: cupColor, cupSideWidth: cupSideWidth),
          ),
        ),
      ],
    );
  }
}

class LightSpeedCoffeeLayout extends StatelessWidget {
  const LightSpeedCoffeeLayout({
    super.key,
    required this.cupColor,
    required this.cupSideWidth,
  });

  final Color cupColor;
  final double cupSideWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey('coffee'),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          CoffeeMugWidget(cupColor: cupColor, cupSideWidth: cupSideWidth),
          const SizedBox(height: 20),
          const ButtonsRow(),
          const BottomTextWidget(),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}

class cvLayout extends StatelessWidget {
  const cvLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SelectableText('Michael Wetzel', style: kH1Q),
                  SelectableText('Flutter Developer', style: kH2Q),
                ],
              ),
              SizedBox(
                width: 40,
              ),
              CircleAvatar(
                radius: 90,
                backgroundImage: AssetImage('assets/images/profilePick.jpg'),
              )
            ],
          ),
          SizedBox(
            height: kBetweenMainSections,
          ),
          SizedBox(
            width: 1300,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 500,
                          child: ContentCard(
                            heading: 'General Info:',
                            child: Column(
                              spacing: 6,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HeadingBodyRow(heading: 'Email:', body: 'michkwetzel@gmail.com', hyperLink: true),
                                HeadingBodyRow(heading: 'Phone:', body: '+27 72 435 8225'),
                                PassportRow(),
                                HeadingBodyRow(heading: 'Language:', body: 'English, Afrikaans'),
                                HeadingBodyRow(heading: 'Location:', body: 'Cape Town but willing to move'),
                                Row(
                                  spacing: 32,
                                  children: [
                                    customButton(onPressed: () => launchUrl(Uri.parse("https://assessment-909ce.web.app/?token2=test&token1=test")), buttonText: "Github", color: Colors.white),
                                    customButton(onPressed: () => launchUrl(Uri.parse("https://assessment-909ce.web.app/?token2=test&token1=test")), buttonText: "Linkedin", color: Colors.white),
                                    customButton(onPressed: () => launchUrl(Uri.parse("https://assessment-909ce.web.app/?token2=test&token1=test")), buttonText: "Download CV", color: Colors.white)
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                    SizedBox(width: 60),
                    SizedBox(
                      width: 500,
                      child: ContentCard(
                          heading: 'Built by me:',
                          child: Column(
                            spacing: 16,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                spacing: 16,
                                children: [
                                  SizedBox(width: 160, child: SelectableText('TravelBuddy', style: kH4QReg)),
                                  customButton(onPressed: () => launchUrl(Uri.parse("https://travelai-88a07.web.app/")), buttonText: "Home", color: Colors.white)
                                ],
                              ),
                              Row(
                                spacing: 16,
                                children: [
                                  SizedBox(width: 160, child: SelectableText('Efficiency-1st', style: kH4QReg)),
                                  customButton(onPressed: () => launchUrl(Uri.parse("https://dashboard-fdda8.web.app/")), buttonText: "Dashboard", color: Colors.white),
                                  customButton(onPressed: () => launchUrl(Uri.parse("https://assessment-909ce.web.app/?token2=test&token1=test")), buttonText: "Survey", color: Colors.white)
                                ],
                              ),
                              Row(
                                spacing: 16,
                                children: [
                                  SizedBox(width: 160, child: SelectableText('This Web App', style: kH4QReg)),
                                  customButton(onPressed: () => launchUrl(Uri.parse("https://assessment-909ce.web.app/?token2=test&token1=test")), buttonText: "Github Repo", color: Colors.white),
                                  customButton(onPressed: () => launchUrl(Uri.parse("https://assessment-909ce.web.app/?token2=test&token1=test")), buttonText: "Figma", color: Colors.white)
                                ],
                              ),
                            ],
                          )),
                    )
                  ],
                ),
                SizedBox(
                  height: kBetweenMainSections,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 500,
                          child: ContentCard(
                            heading: 'Skills',
                            child: Column(
                              spacing: 16,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Full Stack Development',
                                  style: kH2Q,
                                ),
                                SelectableText(
                                  'Flutter, Dart, Python, Java, Figma',
                                  style: kH5QReg,
                                ),
                                Row(
                                  spacing: 16,
                                  children: [
                                    Image.asset('assets/images/fullstack/flutter.jpg', scale: 0.7),
                                    Image.asset('assets/images/fullstack/dart.jpg', scale: 0.7),
                                    Image.asset('assets/images/fullstack/figma.jpg', scale: 0.7),
                                    Image.asset('assets/images/fullstack/python.jpg', scale: 0.7),
                                    Image.asset('assets/images/fullstack/java.jpg', scale: 0.7),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        SizedBox(
                          width: 500,
                          child: ContentCard(
                              child: Column(
                            spacing: 16,
                            children: [
                              Text("Google Cloud Architecture", style: kH2Q),
                              Row(children: [
                                Image.asset('assets/images/cloud.jpg'),
                                SizedBox(
                                  width: kGeneralSpace,
                                ),
                                Flexible(
                                  child: Text('Firestore, Authentication, Firebase Hosting, Google Run, Cloud Functions, Local Emulators', style: kH5QReg),
                                )
                              ])
                            ],
                          )),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        SizedBox(
                          width: 500,
                          child: ContentCard(
                              child: Column(
                            spacing: 16,
                            children: [
                              Text("End-to-End Product Development", style: kH2Q),
                              Row(children: [
                                Flexible(
                                  child: Text('Product design, UX Design, Product lifecycle', style: kH5QReg),
                                ),
                                SizedBox(
                                  width: kGeneralSpace,
                                ),
                                Image.asset('assets/images/cloud.jpg'),
                              ])
                            ],
                          )),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
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
                                ],
                              )),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        SizedBox(
                          width: 500,
                          height: 450,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Bootcamps', style: kH2Q,),
                              SizedBox(height: 32,),
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
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(width: 1000, child: ContentCard(child: Row()),)
              ],
            ),
          )
        ],
      ),
    );
  }
}

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

class PassportRow extends StatelessWidget {
  const PassportRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 130,
          child: Text('Passports:', style: kH4QReg),
        ),
        Row(
          children: [
            ImageContainer(imagePath: 'assets/images/flags/german.jpg', width: 16),
            SizedBox(width: kBetweenTextSpace),
            Text('German', style: kH5QReg),
            SizedBox(width: kBetweenTextSpace * 2),
            ImageContainer(imagePath: 'assets/images/flags/sa.jpg', width: 16),
            SizedBox(width: kBetweenTextSpace * 2),
            Text('South African', style: kH5QReg),
          ],
        )
      ],
    );
  }
}

class ImageContainer extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;

  const ImageContainer({
    required this.imagePath,
    super.key,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Image.asset(
        imagePath,
        width: width,
        height: height,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}

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
