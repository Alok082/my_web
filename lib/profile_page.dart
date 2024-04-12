import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_web/skills.dart';

import 'apptheme.dart';
import 'entry_out_transition.dart';

const desc =
    "Welcome to my corner of the internet! I am Alok Kumar, a passionate 22-year-old developer from india.";

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
    this.enableEntryAnimation = true,
  });
  final bool enableEntryAnimation;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EntryOutTransition(
                  entryAnimation: entryAnimations[0],
                  // outAnimation: outAnimationController,
                  entryBeginOffset: const Offset(0, .5),
                  outBeginOffset: const Offset(0, .5),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Alok ",
                            style: AppTheme.appNameTitle.copyWith(
                              fontSize: size.width * 0.07,
                            ),
                          ),
                          Text(
                            "Kumar",
                            style: AppTheme.appNameTitle.copyWith(
                              fontSize: size.width * 0.07,
                              color: Colors.purple,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        desc,
                        style: AppTheme.bodyText1
                            .copyWith(fontSize: min(size.width * 0.05, 18.0)),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
                EntryOutTransition(
                  entryAnimation: entryAnimations[1],
                  // outAnimation: outAnimationController,
                  entryBeginOffset: const Offset(0, .5),
                  outBeginOffset: const Offset(0, .5),
                  child: Column(
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        "Skills Showcase:",
                        style: AppTheme.headline2
                            .copyWith(fontSize: min(size.width * 0.05, 24.0)),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 5,
                        children: skills
                            .map(
                              (e) => Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 3,
                                  vertical: 5,
                                ),
                                constraints:
                                    const BoxConstraints(maxWidth: 500),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.white, width: 0.05),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize
                                      .min, // Ensure items don't stretch horizontally

                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ConstrainedBox(
                                      constraints: BoxConstraints(
                                          maxWidth: size.width * 0.8),
                                      child: Text(
                                        overflow: TextOverflow.ellipsis,
                                        e.name,
                                        style: AppTheme.bodyText2.copyWith(
                                            fontSize:
                                                min(size.width * 0.06, 14.0)),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      overflow: TextOverflow.ellipsis,
                                      e.emoji,
                                      style: AppTheme.bodyText2.copyWith(
                                          fontSize:
                                              min(size.width * 0.07, 18.0)),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
