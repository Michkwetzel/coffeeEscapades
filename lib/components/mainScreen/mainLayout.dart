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
            child: !isBrewingFinished ? cvLayout() : LightSpeedCoffeeLayout(cupColor: cupColor, cupSideWidth: cupSideWidth),
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
          NameAndProfilePickWIdget(),
          SizedBox(height: kBetweenMainSections),
          SizedBox(
            width: 1060,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GeneralInfoWidget(),
                    SizedBox(width: 60),
                    BuiltByMeWidget(),
                  ],
                ),
                SizedBox(height: kBetweenMainSections),
                Column(
                  children: [
                    Text(
                      'Quick Intro',
                      style: kH2Q,
                    ),
                    SizedBox(
                      height: kBetweenHeadingSubSection,
                    ),
                    Text(
                        'Hi Nunc! I\'m Mike and I\'m a budding Flutter developer. I love good design and clean modular code. My main tech strengths are - knowing how to find out what I don\'t know - and - Project planning/vision -. I am also a very social individual and can connect easily with others. I try and do things that scare me often and love a challenge. Your website and product are pretty awesome. It\'s sleek, it\'s sexy and of course, it\'s coffee.',
                        style: kH4QReg)
                  ],
                ),
                SizedBox(height: kBetweenMainSections),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SkillsColumnWidget(),
                    SizedBox(width: 60),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [EducationWidget(), SizedBox(height: 32), BootcampWidget()],
                    )
                  ],
                ),
                SizedBox(
                  height: 32,
                ),
                ToolsWidget(),
                SizedBox(
                  height: kBetweenMainSections,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EfficiencyFirstWidget(),
                    SizedBox(width: 60),
                    Column(
                      children: [
                        SizedBox(
                          height: 63,
                        ),
                        TravelBuddyWidget(),
                        SizedBox(
                          height: kBetweenSubSections,
                        ),
                        INKSolutionsWidget()
                      ],
                    )
                  ],
                ),
                ContentCard(
                  heading: "Hobbies",
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Boxing', style: kH4QReg),
                          Text('Guitar/Piano', style: kH4QReg),
                          Text('Running', style: kH4QReg),
                          Text('Chess', style: kH4QReg),
                        ],
                      ),
                      SizedBox(
                        width: kGeneralSpace,
                      ),
                      Row(
                        spacing: 4,
                        children: [
                          ClipRRect(borderRadius: BorderRadius.circular(8), child: Image.asset('assets/images/hobbies/chess.jpg', scale: 1.6)),
                          ClipRRect(borderRadius: BorderRadius.circular(8), child: Image.asset('assets/images/hobbies/tft.jpg', scale: 1.6)),
                          ClipRRect(borderRadius: BorderRadius.circular(8), child: Image.asset('assets/images/hobbies/boxing.jpg', scale: 1.6)),
                        ],
                      ),
                      SizedBox(
                        width: kGeneralSpace,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Horrible Jokes', style: kH4QReg),
                          Text('Snowboarding', style: kH4QReg),
                          Text('Reading', style: kH4QReg),
                          Text('Gamer at Heart', style: kH4QReg),
                        ],
                      ),
                      SizedBox(
                        width: kGeneralSpace,
                      ),
                      Row(
                        spacing: 4,
                        children: [
                          ClipRRect(borderRadius: BorderRadius.circular(8), child: Image.asset('assets/images/hobbies/guitar.jpg', scale: 1.6)),
                          ClipRRect(borderRadius: BorderRadius.circular(8), child: Image.asset('assets/images/hobbies/snowboard.jpg', scale: 1.6)),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: kBetweenMainSections,
          )
        ],
      ),
    );
  }
}

class INKSolutionsWidget extends StatelessWidget {
  const INKSolutionsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: ContentCard(
          child: Column(
        spacing: 4,
        children: [
          JobHeadingInfoWidget(
            jobTitle: 'Junior AI Engineer',
            dates: 'Jan 2024 - Jun 2024',
            companyName: "INK Solutions",
            location: 'Remote, Poland',
            imagePath: 'assets/images/company/ink.png',
          ),
          SizedBox(height: kGeneralSpace),
          BulletPointRow(text: 'Project: AI RAG Agent'),
          BulletPointRow(text: 'Led end-to-end migration of platform logging infrastructure from MongoDB to DataDog'),
          BulletPointRow(text: 'Redesigned AI agent system prompts to successfully reduced error rates in step-by-step instruction following'),
          BulletPointRow(text: 'Front-end:  Slack, Back-end: Python'),
        ],
      )),
    );
  }
}

class TravelBuddyWidget extends StatelessWidget {
  const TravelBuddyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: ContentCard(
        child: Column(
          spacing: 4,
          children: [
            JobHeadingInfoWidget(
              jobTitle: 'Full Stack Developer',
              dates: 'Jun 2024 - Oct 2024',
              companyName: "TravelBuddy",
              location: "Remote",
              imagePath: 'assets/images/company/travelbuddy.png',
            ),
            SizedBox(height: kGeneralSpace),
            Row(
              children: [
                Expanded(
                  child: Column(
                    spacing: 4,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BulletPointRow(text: 'AI travel agent'),
                      BulletPointRow(text: 'Flutter'),
                      BulletPointRow(text: 'Google Cloud Functions/Run'),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    spacing: 4,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BulletPointRow(text: 'Personal Project'),
                      BulletPointRow(text: 'Responsive Design'),
                      BulletPointRow(text: 'Gemini API'),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class EfficiencyFirstWidget extends StatelessWidget {
  const EfficiencyFirstWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: ContentCard(
        heading: 'Relevant Work Experience',
        child: Column(
          spacing: 6,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            JobHeadingInfoWidget(
              jobTitle: 'Lead Software Developer',
              dates: 'Oct 2024 - Current',
              imagePath: 'assets/images/company/first.png',
              companyName: 'Efficiency-1st',
              location: 'Remote, USA',
            ),
            SizedBox(height: kGeneralSpace),
            BulletPointRow(text: 'Solo development of full-stack MVP'),
            BulletPointRow(text: 'Led end-to-end project planning, system design, and implementation'),
            BulletPointRow(text: 'UX/UI designed on Figma before implementation'),
            BulletPointRow(text: 'Crafted software product from requirements doc and vision discussion'),
            SizedBox(height: kGeneralSpace),
            Row(
              children: [
                Expanded(
                  child: Column(
                    spacing: 4,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Back-end', style: kH4QReg),
                      SizedBox(height: 8),
                      BulletPointRow(text: 'Database: Firestore'),
                      BulletPointRow(text: 'Language: Python'),
                      BulletPointRow(text: 'Hosted on Google Cloud Functions'),
                      BulletPointRow(text: 'Used Local Emulator before deployment'),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    spacing: 4,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Front-end', style: kH4QReg),
                      SizedBox(height: 8),
                      BulletPointRow(text: 'Flutter + Dart'),
                      BulletPointRow(text: 'State Magement: RiverPod'),
                      BulletPointRow(text: 'Google Cloud Hosting'),
                      BulletPointRow(text: 'Google Cloud Auth'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

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

class JobHeadingInfoWidget extends StatelessWidget {
  final String jobTitle;
  final String dates;
  final String imagePath;
  final String companyName;
  final String location;

  const JobHeadingInfoWidget({
    required this.jobTitle,
    required this.dates,
    required this.companyName,
    required this.location,
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              jobTitle,
              style: kH5QReg,
            ),
            Text(
              dates,
              style: kH5QReg,
            )
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 8,
              children: [
                CircleAvatar(
                    backgroundImage: AssetImage(
                      imagePath,
                    ),
                    radius: 20),
                Text(companyName, style: kH4QReg),
              ],
            ),
            Text(location, style: kH5QReg),
          ],
        )
      ],
    );
  }
}

class ToolsWidget extends StatelessWidget {
  const ToolsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ContentCard(
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
    ));
  }
}

class RoundedImage extends StatelessWidget {
  final String imagePath;
  const RoundedImage({
    required this.imagePath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Image.asset(imagePath, scale: 0.7),
    );
  }
}

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
          radius: 90,
          backgroundImage: AssetImage('assets/images/profilePick.jpg'),
        )
      ],
    );
  }
}

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
            ],
          )),
    );
  }
}

class SkillsColumnWidget extends StatelessWidget {
  const SkillsColumnWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    RoundedImage(imagePath: 'assets/images/fullstack/flutter.jpg'),
                    RoundedImage(imagePath: 'assets/images/fullstack/dart.jpg'),
                    RoundedImage(imagePath: 'assets/images/fullstack/figma.jpg'),
                    RoundedImage(imagePath: 'assets/images/fullstack/python.jpg'),
                    RoundedImage(imagePath: 'assets/images/fullstack/java.jpg'),
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
                RoundedImage(imagePath: 'assets/images/fullstack/cloud.jpg'),
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
                  width: 16,
                ),
                RoundedImage(imagePath: 'assets/images/fullstack/endToEnd.jpg')
              ])
            ],
          )),
        )
      ],
    );
  }
}

class BuiltByMeWidget extends StatelessWidget {
  const BuiltByMeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  customButton(onPressed: () => launchUrl(Uri.parse("https://github.com/Michkwetzel/coffeeEscapades")), buttonText: "Github Repo", color: Colors.white),
                  customButton(onPressed: () => launchUrl(Uri.parse("https://www.figma.com/design/PJeXa42i9ULRPZxKl07wQq/CoffeeResume?node-id=0-1&t=cqbuK4yo1sSxVaTl-1")), buttonText: "Figma", color: Colors.white)
                ],
              ),
            ],
          )),
    );
  }
}

class GeneralInfoWidget extends StatelessWidget {
  const GeneralInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                customButton(onPressed: () => launchUrl(Uri.parse("https://github.com/Michkwetzel")), buttonText: "Github", color: Colors.white),
                customButton(onPressed: () => launchUrl(Uri.parse("https://www.linkedin.com/in/michkwetzel/")), buttonText: "Linkedin", color: Colors.white),
                customButton(onPressed: () => launchUrl(Uri.parse("https://drive.google.com/file/d/1cgpQTjcjAayiTv777dVzwhd1CwoN6c6i/view?usp=sharing")), buttonText: "Download CV", color: Colors.white)
              ],
            )
          ],
        ),
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
