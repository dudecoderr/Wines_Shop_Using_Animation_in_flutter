// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_text/circular_text/model.dart';
import 'package:flutter_circular_text/circular_text/widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:wine_shop_app/cart_screen/cart_screen.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  _SliderScreenState createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> with TickerProviderStateMixin {
  int _current = 0;
  dynamic _selectedIndex = {};

  final CarouselController _carouselController = CarouselController();

  final List<dynamic> _products = [
    {
      'first': 'France',
      'second': '13.5%',
      'third': 'Dry',
      'forth': 'Red',
      'year': 'assets/year_1996.png',
      'circleText': 'CHATEAU  CHATEAU  CHATEAU  CHATEAU  CHATEAU',
      'image': 'assets/wine_bottle.png.png'
    },
    {
      'first': 'Chile',
      'second': '15.2%',
      'third': 'Dry',
      'forth': 'Red',
      'year': 'assets/year_1997.png',
      'circleText': 'MISSION  MISSION  MISSION  MISSION  MISSION',
      'image': 'assets/wine_bottle.png.png'
    },
    {
      'first': 'France',
      'second': '10.3%',
      'third': 'Dry',
      'forth': 'Red',
      'year': 'assets/year_1998.png',
      'circleText': 'LEOGNAN  LEOGNAN  LEOGNAN  LEOGNAN  LEOGNAN',
      'image': 'assets/wine_bottle.png.png'
    }
  ];

  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 12));
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.slowMiddle,
    );
    controller.repeat();
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  int current_index = 0;
  void OnTapped(int index) {
    setState(() {
      current_index = index;
    });
  }

  int index = 0;

  final List<String> buttonText = ['Buy for \$1286', 'Buy for \$1001', 'Buy for \$908'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff070d1b),
      body: Column(
        children: [
          CarouselSlider(
              carouselController: _carouselController,
              options: CarouselOptions(
                  height: 550.0,
                  aspectRatio: 16 / 12,
                  viewportFraction: 0.99,
                  enlargeCenterPage: true,
                  pageSnapping: true,
                  onPageChanged: (i, reason) {
                    setState(() {
                      _current = index;
                    });
                    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                      if (index != i) {
                        setState(() {
                          index = i;
                          // print("index change kar=== $index  $i");
                        });
                      }
                    });
                  }),
              items: _products.map((wine) {
                return Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_selectedIndex == wine) {
                            _selectedIndex = {};
                          } else {
                            _selectedIndex = wine;
                          }
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: const Color(0xff070d1b),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 1.h,
                              child: SizedBox(
                                width: 360.w,
                                child: Image.asset(wine['year'], fit: BoxFit.cover),
                              ),
                            ),

                            /// ====================== Circle Text ======================
                            Positioned(
                              top: 90.h,
                              child: Padding(
                                padding: EdgeInsets.only(right: 40.w, left: 40.w),
                                child: Container(
                                  height: 250.h,
                                  width: 270.w,
                                  // width: _width, height: _height,
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.transparent),
                                  child: RotationTransition(
                                    turns: animation,
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: 200.h,
                                      width: 200.h,
                                      decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.transparent),
                                      child: CircularText(children: [
                                        TextItem(
                                            text: Text(
                                              wine['circleText'],
                                              style: const TextStyle(fontSize: 20, color: Color(0xff606572), fontWeight: FontWeight.bold),
                                            ),
                                            space: 8,
                                            startAngle: -90,
                                            startAngleAlignment: StartAngleAlignment.center,
                                            direction: CircularTextDirection.clockwise),
                                      ], radius: 120, position: CircularTextPosition.inside),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            Positioned(
                              top: 110.h,
                              left: 80.w,
                              child: SizedBox(
                                height: 200.h,
                                width: 200.w,
                                child: Image.asset(wine['image']),
                              ),
                            ),

                            /// ====================== Row ======================
                            const SizedBox(height: 20),
                            Positioned(
                              top: 370.h,
                              right: 10.w,
                              left: 10.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  AnimationLimiter(
                                    child: Column(
                                      children: AnimationConfiguration.toStaggeredList(
                                        duration: const Duration(seconds: 1),
                                        childAnimationBuilder: (widget) => SlideAnimation(
                                          horizontalOffset: MediaQuery.of(context).size.width / 2,
                                          child: FadeInAnimation(child: widget),
                                        ),
                                        children: [
                                          Container(
                                            height: 65.h,
                                            width: 75.w,
                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.sp), color: const Color(0xff0e172e)),
                                            child: Center(
                                                child: Text(wine['first'],
                                                    style: TextStyle(color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.w500))),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  AnimationLimiter(
                                    child: Column(
                                      children: AnimationConfiguration.toStaggeredList(
                                        duration: const Duration(seconds: 2),
                                        childAnimationBuilder: (widget) => SlideAnimation(
                                          horizontalOffset: MediaQuery.of(context).size.width / 2,
                                          child: FadeInAnimation(child: widget),
                                        ),
                                        children: [
                                          Container(
                                            height: 65.h,
                                            width: 75.w,
                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.sp), color: const Color(0xff0e172e)),
                                            child: Center(
                                                child: Text(wine['second'],
                                                    style: TextStyle(color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.w500))),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  AnimationLimiter(
                                    child: Column(
                                      children: AnimationConfiguration.toStaggeredList(
                                        duration: const Duration(seconds: 3),
                                        childAnimationBuilder: (widget) => SlideAnimation(
                                          horizontalOffset: MediaQuery.of(context).size.width / 2,
                                          child: FadeInAnimation(child: widget),
                                        ),
                                        children: [
                                          Container(
                                            height: 65.h,
                                            width: 75.w,
                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.sp), color: const Color(0xff0e172e)),
                                            child: Center(
                                                child: Text(wine['third'],
                                                    style: TextStyle(color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.w500))),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  AnimationLimiter(
                                    child: Column(
                                      children: AnimationConfiguration.toStaggeredList(
                                        duration: const Duration(seconds: 4),
                                        childAnimationBuilder: (widget) => SlideAnimation(
                                          horizontalOffset: MediaQuery.of(context).size.width / 2,
                                          child: FadeInAnimation(child: widget),
                                        ),
                                        children: [
                                          Container(
                                            height: 65.h,
                                            width: 75.w,
                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.sp), color: const Color(0xff0e172e)),
                                            child: Center(
                                                child: Text(wine['forth'],
                                                    style: TextStyle(color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.w500))),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }).toList()),

          /// ====================== Elevated Button ======================
          SizedBox(
            height: 70.h,
            width: 330.w,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffFCE836), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r))),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CartScreen(),
                  ),
                );
              },
              child: Text(buttonText[index],
                  style: TextStyle(color: Colors.black, fontFamily: 'Source_Code_Pro', fontSize: 20.sp, fontWeight: FontWeight.w500)),
            ),
          ),
          SizedBox(height: 15.h),
        ],
      ),
    );
  }
}
