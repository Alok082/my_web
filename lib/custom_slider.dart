import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_web/entry_out_transition.dart';
import 'dart:math' as math;
import 'apptheme.dart';
import 'my_hero.dart';
import 'project_detail_page.dart';
import 'project_list.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({
    super.key,
    this.enableEntryAnimation = true,
    required this.animationIndex,
  });
  final bool enableEntryAnimation;
  final Animation<double> animationIndex;

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider>
    with TickerProviderStateMixin {
  // late final AnimationController entryAnimationController;

  // List<Animation<double>> entryAnimations =
  //     List.filled(4, const AlwaysStoppedAnimation(1));

  late PageController pageController;

  double offset = 0;

  double currentPageValue = 0.0;
  @override
  void initState() {
    pageController = PageController(
      viewportFraction: 0.9,
    );

    pageController.addListener(pageListener);
    // entryAnimationController = AnimationController(
    //   vsync: this,
    //   duration: const Duration(milliseconds: 1200),
    //   value: 0,
    // );
    // if (widget.enableEntryAnimation) {
    //   entryAnimations = List.generate(
    //     4,
    //     (index) => CurvedAnimation(
    //       parent: entryAnimationController,
    //       curve: Interval(0, .2 * (index + 1), curve: Curves.fastOutSlowIn),
    //     ),
    //   );
    //   Future.delayed(
    //     const Duration(milliseconds: 400),
    //     () => entryAnimationController.forward(),
    //   );
    // }
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();

    // controller
    //   ..removeListener(pageListener)
    //   ..dispose();
    // entryAnimationController.dispose();

    super.dispose();
  }

  void pageListener() {
    currentPageValue = pageController.page ?? 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return EntryOutTransition(
      entryAnimation: widget.animationIndex,
      // outAnimation: outAnimationController,
      entryBeginOffset: const Offset(0, .5),
      outBeginOffset: const Offset(0, .5),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            PageView.builder(
              controller: pageController,
              itemCount: projects.length,
              itemBuilder: (context, index) {
                final project = projects[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 300),
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return ScaleTransition(
                            scale: Tween<double>(
                              begin: 0.0,
                              end: 1.0,
                            ).animate(
                              CurvedAnimation(
                                parent: animation,
                                curve: Curves.fastLinearToSlowEaseIn,
                              ),
                            ),
                            child: FadeTransition(
                              opacity: animation,
                              child: CustomProjectDetail(project: project),
                            ),
                          );
                        },
                      ),
                    );
                  },
                  child: AnimatedBuilder(
                    animation: pageController,
                    builder: (context, child) {
                      double pageOffset = 0;
                      try {
                        if (pageController.position.hasContentDimensions) {
                          pageOffset = pageController.page! - index;
                        }
                      } catch (e) {}

                      double gauss = math
                          .exp(-(math.pow(pageOffset.abs() - 0.5, 2) / 0.08));
                      double val = pageOffset.abs() + 0.9;
                      // print(val);

                      return
                          // Transform.scale(
                          //   scale: val,
                          //   child:
                          Transform.translate(
                        offset: Offset(-32 * gauss * pageOffset.sign, 0),
                        child: Container(
                            clipBehavior: Clip.none,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              // color: Colors.white,
                              // borderRadius: BorderRadius.circular(40),
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: Colors.blue.withOpacity(0.15),
                              //     spreadRadius: 5,
                              //     blurRadius: 7,
                              //     offset: const Offset(
                              //         3, 0), // changes position of shadow
                              //   ),
                              // ],
                              border:
                                  Border.all(color: Colors.white, width: 0.25),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(22),
                              ),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(40 - 16),
                                    child: MyHero(
                                      tag: project.imageUrl,
                                      child: Image.asset(
                                        project.imageUrl,
                                        alignment:
                                            Alignment(-pageOffset.abs(), 0),
                                        fit: BoxFit
                                            .cover, // Adjust the fit property as needed
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(22),
                                      gradient: const LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                          Colors.black,
                                          Colors.transparent,
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 16,
                                  left: 16,
                                  right: 16,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        project.name,
                                        // style: const TextStyle(
                                        //   fontSize: 24,
                                        //   fontWeight: FontWeight.bold,
                                        //   color: Colors.white,
                                        // ),
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge,
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        project.content,
                                        maxLines: 3,
                                        // style: const TextStyle(
                                        //   fontSize: 16,
                                        //   color: Colors.white,
                                        // ),
                                        style: AppTheme.headline2.copyWith(
                                            fontSize:
                                                min(size.width * 0.035, 18.0),
                                            color: Colors.white60),
                                      ),
                                      const SizedBox(height: 8),
                                      Wrap(
                                        spacing: 5,
                                        children: project.tech
                                            .map(
                                              (e) => Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 3,
                                                  vertical: 2,
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5,
                                                        horizontal: 10),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.white,
                                                      width: 0.3),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(10),
                                                  ),
                                                ),
                                                child: Text(
                                                  e,
                                                  style: AppTheme.headline2
                                                      .copyWith(
                                                          fontSize: min(
                                                              size.width *
                                                                  0.035,
                                                              18.0)),
                                                ),
                                              ),
                                            )
                                            .toList(),
                                      ),
                                    ],
                                  ),
                                ),
                                // Positioned(
                                //   right: 15,
                                //   top: 15,
                                //   child: InkWell(
                                //     onTap: () =>
                                //         _deleteProject(project.id ?? 0),
                                //     child: ClipRRect(
                                //       borderRadius: const BorderRadius.all(
                                //         Radius.circular(20),
                                //       ),
                                //       child: Container(
                                //         color: Colors.white,
                                //         padding: const EdgeInsets.all(10),
                                //         child: const Icon(
                                //           CupertinoIcons.delete,
                                //           color: Colors.red,
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                              ],
                            )),
                      )
                          // ,
                          // )
                          ;
                    },
                  ),
                );
              },
            ),
            if (currentPageValue.floor() != projects.length - 1 &&
                size.width > 450)
              Positioned(
                // top: 0,
                // bottom: 0,
                right: 0,
                child: InkWell(
                  onTap: () {
                    if (currentPageValue.floor() != projects.length - 1) {
                      // print("Move Forward");
                      pageController.animateToPage(
                        currentPageValue.floor() + 1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear,
                      );
                    }
                  },
                  child: Container(
                    width: min(size.width * 0.08, 30),
                    height: min(size.width * 0.09, 100),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [
                          Colors.black,
                          Colors.transparent,
                        ],
                      ),
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      border: Border.all(color: Colors.white, width: 0.5),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(size.width * 0.08),
                        bottomLeft: Radius.circular(size.width * 0.08),
                      ),
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            if (currentPageValue.floor() != 0 && size.width > 450)
              Positioned(
                // bottom: size.width * 0.04,
                // right: size.width * 0.04,
                // top: 0,
                // bottom: 0,
                left: 0,
                child: InkWell(
                  onTap: () {
                    // print(size.width);
                    if (currentPageValue.floor() != 0) {
                      // print("Move backward");
                      pageController.animateToPage(
                        currentPageValue.floor() - 1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear,
                      );
                    }
                  },
                  child: Container(
                    width: min(size.width * 0.08, 30),
                    height: min(size.width * 0.09, 100),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [
                          Colors.black,
                          Colors.transparent,
                        ],
                      ),
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      border: Border.all(color: Colors.white, width: 0.5),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(size.width * 0.08),
                        bottomRight: Radius.circular(size.width * 0.08),
                      ),
                    ),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
