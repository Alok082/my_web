import 'dart:math';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'apptheme.dart';
import 'entry_out_transition.dart';

const List<Map<String, String>> contactDetails = [
  {
    'text': 'Alok Kumar',
    'url': '',
  },
  {
    'text': 'Email ✉️',
    'url': 'mailto:aloke082@gmail.com',
  },
  {
    'text': 'Linkedin 🔗',
    'url': 'https://www.linkedin.com/in/alok082',
  },
  {
    'text': 'GitHub 🐱‍💻',
    'url': 'https://github.com/Alok082',
  },
  {
    'text': 'Instagram 📸',
    'url': 'https://www.instagram.com/who_shivam_pandey.log/',
  },
];

class ContactScreen extends StatefulWidget {
  const ContactScreen({
    super.key,
    this.enableEntryAnimation = true,
  });
  final bool enableEntryAnimation;

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen>
    with TickerProviderStateMixin {
  late final AnimationController entryAnimationController;
  List<Animation<double>> entryAnimations =
      List.filled(10, const AlwaysStoppedAnimation(1));

  @override
  void initState() {
    entryAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
      value: 0,
    );
    if (widget.enableEntryAnimation) {
      entryAnimations = List.generate(
        10,
        (index) => CurvedAnimation(
          parent: entryAnimationController,
          curve: Interval(0, .2 * (index + 1), curve: Curves.fastOutSlowIn),
        ),
      );
      Future.delayed(
        const Duration(milliseconds: 400),
        () => entryAnimationController.forward(),
      );
    }
    super.initState();
  }

  @override
  void dispose() {
    entryAnimationController.dispose();

    super.dispose();
  }

  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);

    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: EntryOutTransition(
        entryAnimation: entryAnimations[1],
        // outAnimation: outAnimationController,
        entryBeginOffset: const Offset(0, .5),
        outBeginOffset: const Offset(0, .5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              "Contact:",
              style: AppTheme.headline2
                  .copyWith(fontSize: min(size.width * 0.05, 24.0)),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // padding: EdgeInsets.all(8), // Add padding around the image
                  decoration: BoxDecoration(
                    // shape: BoxShape.circle, // Make the container circular
                    borderRadius: const BorderRadius.all(Radius.circular(20)),

                    border: Border.all(
                        color: Colors.white, width: 2), // Add a border
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // Add a shadow
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                    child: Image.asset(
                      "assets/images/profile.jpeg",
                      height: size.height * 0.2,
                      width: size.height * 0.2,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: contactDetails
                      .map(
                        (detail) => InkWell(
                          onTap: () => _launchUrl(detail['url']!),
                          child: Text(
                            detail['text']!,
                            style: AppTheme.bodyText2.copyWith(
                              fontSize: min(size.width * 0.04, 20.0),
                              color: detail['url'] != ''
                                  ? Colors.blue
                                  : Colors.white,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              textAlign: TextAlign.center,
              "Made With Flutter 📱",
              style: AppTheme.headline2
                  .copyWith(fontSize: min(size.width * 0.035, 18.0)),
            ),
          ],
        ),
      ),
    );
  }
}
