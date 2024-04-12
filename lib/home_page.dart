import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_web/profile_page.dart';
import 'package:my_web/projects_page.dart';

import 'app_bar.dart';
import 'apptheme.dart';
import 'contact_screen.dart';
import 'custom_slider.dart';
import 'entry_out_transition.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    this.enableEntryAnimation = true,
  });
  final bool enableEntryAnimation;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  late PageController pageController;

  double offset = 0;

  double currentPageValue = 0.0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(pageListener);

  }

  void pageListener() {
    currentPageValue = pageController.page ?? 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final List<Widget> homeItems = [
      const ProfilePage(),
      const ProjectPage(),
      const ContactScreen()
    ];
    return Scaffold(
      backgroundColor: Colors.black,
      body:
          // homeItems[0],
          Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: PageView.builder(
                  physics: const PageScrollPhysics(
                      parent: NeverScrollableScrollPhysics()),
                  onPageChanged: (value) {},
                  scrollDirection: Axis.vertical,
                  controller: pageController,
                  itemCount: homeItems.length,
                  itemBuilder: (context, index) {
                    // return homeItems[index];

                    return AnimatedBuilder(
                      animation: pageController,
                      builder: (context, child) {
                        double pageOffset = 0;
                        try {
                          if (pageController.position.hasContentDimensions) {
                            pageOffset = pageController.page! - index;
                          }
                        } catch (e) {}
                        double val = 1 - pageOffset.abs();

                        return Opacity(
                          opacity:
                              val, // Use the animation instead of gauss directly
                          child: Transform.scale(
                            scaleY: val,
                            child: homeItems[index],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),

              LinearProgressIndicator(
                minHeight: 2, // Set the height of the progress indicator
                backgroundColor: Colors.white, // Set the background color
                valueColor: const AlwaysStoppedAnimation<Color>(
                    Colors.red), // Set the progress color
                value: (1 + currentPageValue) /
                    homeItems.length, // Set the progress value
              ),
              // Positioned(
              //   bottom: 0,
              //   // child: Container(
              //   //   height: 5,
              //   //   width: size.width,
              //   //   decoration: const BoxDecoration(
              //   //     color: Colors.white,
              //   //   ),
              //   //   child: AnimatedContainer(
              //   //     duration: Duration(milliseconds: 400),
              //   //     height: 5,
              //   //     // width: size.width - (size.width / index),
              //   //     width: homeItems.length / currentPageValue,
              //   //     decoration: const BoxDecoration(
              //   //       color: Colors.red,
              //   //     ),
              //   //   ),
              //   // ),
              //   child: LinearProgressIndicator(
              //     minHeight: 5, // Set the height of the progress indicator
              //     backgroundColor: Colors.white, // Set the background color
              //     valueColor: AlwaysStoppedAnimation<Color>(
              //         Colors.red), // Set the progress color
              //     value:
              //         currentPageValue / homeItems.length, // Set the progress value
              //   ),
              // ),
            ],
          ),
          Positioned(
            bottom: size.width * 0.04,
            right: size.width * 0.04,
            child: Column(
              children: [
                if (currentPageValue.floor() != 0)
                  Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: IconButton(
                      onPressed: () {
                        if (currentPageValue.floor() != 0) {
                          // print("Move backward");
                          pageController.animateToPage(
                            currentPageValue.floor() - 1,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linear,
                          );
                        }
                      },
                      icon: const Icon(
                        Icons.arrow_upward,
                        color: Colors.black,
                      ),
                    ),
                  ),
                if (currentPageValue.floor() != homeItems.length - 1)
                  const SizedBox(
                    height: 10,
                  ),
                if (currentPageValue.floor() != homeItems.length - 1)
                  Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: IconButton(
                      onPressed: () {
                        if (currentPageValue.floor() != homeItems.length - 1) {
                          // print("Move Forward");
                          pageController.animateToPage(
                            currentPageValue.floor() + 1,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linear,
                          );
                        }
                      },
                      icon: const Icon(
                        Icons.arrow_downward,
                        color: Colors.black,
                      ),
                    ),
                  ),
                if (!(currentPageValue.floor() != homeItems.length - 1))
                  const SizedBox(
                    height: 45,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
