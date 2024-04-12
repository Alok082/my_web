import 'package:flutter/material.dart';
import 'package:my_web/app_bar.dart';

import 'custom_slider.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({
    super.key,
    this.enableEntryAnimation = true,
  });
  final bool enableEntryAnimation;

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage>
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // physics: const BouncingScrollPhysics(
      //     parent: AlwaysScrollableScrollPhysics()),
      // physics: const NeverScrollableScrollPhysics(),
      children: [
        CustomAppBar(
          animationIndex: entryAnimations[1],
        ),
        CustomSlider(
          animationIndex: entryAnimations[2],
        ),
      ],
    );
  }
}
