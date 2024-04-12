import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:my_web/apptheme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'custom_project_model.dart';
import 'entry_out_transition.dart';
import 'my_hero.dart';

class CustomProjectDetail extends StatefulWidget {
  const CustomProjectDetail({
    super.key,
    required this.project,
    this.enableEntryAnimation = true,
  });
  final bool enableEntryAnimation;

  final CustomProject project;

  @override
  State<CustomProjectDetail> createState() => _CustomProjectDetailState();
}

class _CustomProjectDetailState extends State<CustomProjectDetail>
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
    const space10 = SizedBox(
      height: 10,
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: EntryOutTransition(
          entryAnimation: entryAnimations[0],
          // outAnimation: outAnimationController,
          entryBeginOffset: const Offset(0, .5),
          outBeginOffset: const Offset(0, .5),
          child: MyHero(
            tag: widget.project.name,
            child: Text(
              widget.project.name,
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: MyHero(
              tag: widget.project.imageUrl,
              child: Container(
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
                // child: Image.network(
                //   project.imageUrl,
                //   fit: BoxFit.cover,
                // ),
                child: Image.asset(
                  widget.project.imageUrl,

                  fit: BoxFit.cover, // Adjust the fit property as needed
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
                // child: Image.network(
                //   project.imageUrl,
                //   fit: BoxFit.cover,
                // ),
                // child: CachedNetworkImage(
                //   imageUrl: project.imageUrl,

                //   fit: BoxFit.cover, // Adjust the fit property as needed
                // ),
              ),
            ),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
          Positioned.fill(
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    EntryOutTransition(
                      entryAnimation: entryAnimations[1],
                      // outAnimation: outAnimationController,
                      entryBeginOffset: const Offset(0, .5),
                      outBeginOffset: const Offset(0, .5),
                      child: Text(
                        widget.project.content,
                        style: AppTheme.headline4,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(height: 8),
                    EntryOutTransition(
                      entryAnimation: entryAnimations[2],
                      // outAnimation: outAnimationController,
                      entryBeginOffset: const Offset(0, .5),
                      outBeginOffset: const Offset(0, .5),
                      child: Wrap(
                        spacing: 5,
                        children: widget.project.tech
                            .map(
                              (e) => Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 3,
                                  vertical: 2,
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Text(
                                  e,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    EntryOutTransition(
                      entryAnimation: entryAnimations[3],
                      // outAnimation: outAnimationController,
                      entryBeginOffset: const Offset(0, .5),
                      outBeginOffset: const Offset(0, .5),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Row(
                          children: [
                            Text(
                              "Show Case Video: ",
                              style: AppTheme.headline3.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                final Uri _url =
                                    Uri.parse(widget.project.showcaseVideo);

                                if (!await launchUrl(_url)) {
                                  throw Exception('Could not launch $_url');
                                }
                              },
                              child: Text(
                                "click here",
                                style: AppTheme.headline4
                                    .copyWith(color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    widget.project.projectUrl != ""
                        ? EntryOutTransition(
                            entryAnimation: entryAnimations[4],
                            // outAnimation: outAnimationController,
                            entryBeginOffset: const Offset(0, .5),
                            outBeginOffset: const Offset(0, .5),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Project URL: ",
                                    style: AppTheme.headline3.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      final Uri _url =
                                          Uri.parse(widget.project.projectUrl);

                                      if (!await launchUrl(_url)) {
                                        throw Exception(
                                            'Could not launch $_url');
                                      }
                                    },
                                    child: Text(
                                      "click here",
                                      style: AppTheme.headline4
                                          .copyWith(color: Colors.blue),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ],
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
