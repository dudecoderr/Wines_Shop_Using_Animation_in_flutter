// ignore_for_file: unrelated_type_equality_checks

import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import 'package:wine_shop_app/detail_screen/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  RxBool redWine = false.obs;
  RxBool whiteWine = false.obs;
  RxBool roseWine = false.obs;

  /// ====================== BottomSheet ======================
  void bottomSheet() {
    showModalBottomSheet(
      backgroundColor: const Color(0xff0e172e),
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: 800.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// ====================== What type... ======================
              AnimationLimiter(
                child: Column(
                  children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(seconds: 1),
                    childAnimationBuilder: (widget) => SlideAnimation(
                      verticalOffset: MediaQuery.of(context).size.height / 2,
                      child: FadeInAnimation(child: widget),
                    ),
                    children: [
                      Text('What type do you prefer?',
                          style: TextStyle(fontSize: 20.sp, color: Colors.white, fontFamily: 'Source_Code_Pro', fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),

              /// ====================== Red Wine ======================
              SizedBox(height: 10.h),
              AnimationLimiter(
                child: Column(
                  children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(seconds: 2),
                    childAnimationBuilder: (widget) => SlideAnimation(
                      verticalOffset: MediaQuery.of(context).size.height / 2,
                      child: FadeInAnimation(child: widget),
                    ),
                    children: [
                      Obx(() {
                        return InkWell(
                          onTap: () {
                            redWine.value = !redWine.value;
                            Future.delayed(const Duration(seconds: 1), () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DetailScreen(wineName: 'Red wine'),
                                ),
                              );
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            height: 100.h,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(18.r), color: const Color(0xff070d1b)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('Red Wine', style: TextStyle(fontSize: 15.sp, color: Colors.white, fontWeight: FontWeight.w600)),
                                    Text('Produced from red grapes \nAnthocyanins from skins to must',
                                        style: TextStyle(fontSize: 13.sp, color: const Color(0xff777a80), fontWeight: FontWeight.w500)),
                                  ],
                                ),
                                Container(
                                  height: 50.h,
                                  width: 50.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: redWine == true ? const Color(0xffFCE836) : Colors.white),
                                    color: redWine == true ? const Color(0xffFCE836) : const Color(0xff070d1b),
                                  ),
                                  child: Icon(Icons.arrow_forward_ios, size: 20.sp, color: redWine == true ? const Color(0xff070d1b) : Colors.white),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),

              /// ====================== White Wine ======================
              AnimationLimiter(
                child: Column(
                  children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(seconds: 2),
                    childAnimationBuilder: (widget) => SlideAnimation(
                      verticalOffset: MediaQuery.of(context).size.height / 2,
                      child: FadeInAnimation(child: widget),
                    ),
                    children: [
                      Obx(() {
                        return InkWell(
                          onTap: () {
                            whiteWine.value = !whiteWine.value;
                            Future.delayed(const Duration(seconds: 1), () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DetailScreen(wineName: 'White wine'),
                                ),
                              );
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            height: 100.h,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(18.r), color: const Color(0xff070d1b)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('White Wine', style: TextStyle(fontSize: 15.sp, color: Colors.white, fontWeight: FontWeight.w600)),
                                    Text('It is made from both white and \nred or pink grape varieties',
                                        style: TextStyle(fontSize: 13.sp, color: const Color(0xff777a80), fontWeight: FontWeight.w500)),
                                  ],
                                ),
                                Container(
                                  height: 50.h,
                                  width: 50.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: whiteWine == true ? const Color(0xffFCE836) : Colors.white),
                                    color: whiteWine == true ? const Color(0xffFCE836) : const Color(0xff070d1b),
                                  ),
                                  child:
                                      Icon(Icons.arrow_forward_ios, size: 20.sp, color: whiteWine == true ? const Color(0xff070d1b) : Colors.white),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),

              /// ====================== Rose Wine ======================
              AnimationLimiter(
                child: Column(
                  children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(seconds: 2),
                    childAnimationBuilder: (widget) => SlideAnimation(
                      verticalOffset: MediaQuery.of(context).size.height / 2,
                      child: FadeInAnimation(child: widget),
                    ),
                    children: [
                      Obx(() {
                        return InkWell(
                          onTap: () {
                            roseWine.value = !roseWine.value;
                            Future.delayed(const Duration(seconds: 1), () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DetailScreen(wineName: 'Rose wine'),
                                ),
                              );
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            height: 100.h,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(18.r), color: const Color(0xff070d1b)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('Rose Wine', style: TextStyle(fontSize: 15.sp, color: Colors.white, fontWeight: FontWeight.w600)),
                                    Text('Obtained using red grape \nvarieties by mixing with pulp',
                                        style: TextStyle(fontSize: 13.sp, color: const Color(0xff777a80), fontWeight: FontWeight.w500)),
                                  ],
                                ),
                                Container(
                                  height: 50.h,
                                  width: 50.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: roseWine == true ? const Color(0xffFCE836) : Colors.white),
                                    color: roseWine == true ? const Color(0xffFCE836) : const Color(0xff070d1b),
                                  ),
                                  child: Icon(Icons.arrow_forward_ios, size: 20.sp, color: roseWine == true ? const Color(0xff070d1b) : Colors.white),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// ====================== showExitPopup ======================
  Future<bool> showExitPopup(context) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            height: 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Do you want to exit?"),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          print('yes selected');
                          exit(0);
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: const Color(0xff070d1b)),
                        child: const Text("Yes"),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          print('no selected');
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                        child: const Text("No", style: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Scaffold(
        backgroundColor: const Color(0xff070d1b),
        body: Stack(
          children: [
            Positioned(
              top: 45.h,
              left: 15.w,
              right: 15.w,
              child: AnimationLimiter(
                child: Column(
                  children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(seconds: 4),
                    childAnimationBuilder: (widget) => SlideAnimation(
                      horizontalOffset: MediaQuery.of(context).size.width / 2,
                      child: FadeInAnimation(child: widget),
                    ),
                    children: [
                      Row(
                        children: [
                          /// ====================== Expand your Collection ======================
                          Text('EXPAND YOUR \nCOLLECTION',
                              style: TextStyle(color: Colors.white, fontFamily: 'Source_Code_Pro', fontSize: 30.sp, fontWeight: FontWeight.w400)),

                          /// ====================== Expand More Icon ======================
                          const Spacer(),
                          Container(
                            width: 50.w,
                            height: 50.h,
                            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white)),
                            child: Icon(Icons.expand_more, color: Colors.white, size: 30.sp),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// ============================================
            Positioned(
              top: 150.h,
              child: Transform.rotate(
                angle: -math.pi / 50,
                child: Container(height: 2.3.h, width: MediaQuery.of(context).size.width.w, color: const Color(0xffFCE836)),
              ),
            ),

            /// ====================== Coins ======================
            TransFormText(
              text: 'COINS',
              subtext: '254',
              topPosition: 200.h,
              leftPosition: 40.w,
              selected: index == 1 ? true : false,
              onTap: () {
                setState(() {
                  index = 1;
                });
                bottomSheet();
              },
            ),

            /// ====================== Knives ======================
            TransFormText(
              text: 'KNIVES',
              subtext: '232',
              topPosition: 270.h,
              leftPosition: 120.w,
              selected: index == 2 ? true : false,
              onTap: () {
                setState(() {
                  index = 2;
                });
                bottomSheet();
              },
            ),

            /// ====================== paint ======================
            TransFormText(
              text: 'PAINT',
              subtext: '123',
              topPosition: 350.h,
              leftPosition: 40.w,
              selected: index == 3 ? true : false,
              onTap: () {
                setState(() {
                  index = 3;
                });
                bottomSheet();
              },
            ),

            /// ====================== wine ======================
            TransFormText(
              text: 'WINE',
              subtext: '538',
              topPosition: 420.h,
              leftPosition: 180.w,
              selected: index == 4 ? true : false,
              onTap: () {
                setState(() {
                  index = 4;
                });
                bottomSheet();
              },
            ),

            /// ====================== Books ======================
            TransFormText(
              text: 'BOOKS',
              subtext: '910',
              topPosition: 500.h,
              leftPosition: 90.w,
              selected: index == 5 ? true : false,
              onTap: () {
                setState(() {
                  index = 5;
                });
                bottomSheet();
              },
            ),

            /// ====================== Ethnos ======================
            TransFormText(
              text: 'ETHNOS',
              subtext: '431',
              topPosition: 580.h,
              leftPosition: 40.w,
              selected: index == 6 ? true : false,
              onTap: () {
                setState(() {
                  index = 6;
                });
                bottomSheet();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TransFormText extends StatefulWidget {
  const TransFormText(
      {Key? key,
      required this.text,
      required this.topPosition,
      required this.leftPosition,
      required this.selected,
      required this.onTap,
      required this.subtext})
      : super(key: key);
  final String text;
  final String subtext;
  final double topPosition;
  final double leftPosition;
  final bool selected;
  final VoidCallback onTap;

  @override
  State<TransFormText> createState() => _TransFormTextState();
}

class _TransFormTextState extends State<TransFormText> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.topPosition,
      left: widget.leftPosition,
      child: AnimationLimiter(
        child: Column(
          children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(seconds: 1),
            childAnimationBuilder: (widget) => SlideAnimation(
              verticalOffset: MediaQuery.of(context).size.height / 2,
              child: FadeInAnimation(child: widget),
            ),
            children: [
              Column(
                children: [
                  Transform.rotate(
                    angle: -math.pi / 50,
                    child: InkWell(
                      onTap: widget.onTap,
                      child: Wrap(
                        direction: Axis.horizontal,
                        children: [
                          Text(widget.text,
                              style: TextStyle(
                                  color: widget.selected == true ? const Color(0xffFCE836) : Colors.white,
                                  fontSize: 50.sp,
                                  fontFamily: 'Source_Code_Pro',
                                  fontWeight: FontWeight.bold)),
                          Text(
                            widget.subtext,
                            style: TextStyle(
                              color: widget.selected == true ? const Color(0xffFCE836) : Colors.white,
                              fontSize: 15.sp,
                              fontFeatures: const [FontFeature.superscripts()],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
