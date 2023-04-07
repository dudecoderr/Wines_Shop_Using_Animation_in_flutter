import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:wine_shop_app/home_screen/bottom_sheet/slider_screen.dart';
import 'package:wine_shop_app/home_screen/home_screen.dart';

class DetailScreen extends StatefulWidget {
  final String wineName;

  const DetailScreen({Key? key, required this.wineName}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        /// ====================== Back Arrow Icon ======================
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                            );
                          },
                          child: Container(
                            width: 50.w,
                            height: 50.h,
                            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white)),
                            child: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20.sp),
                          ),
                        ),

                        /// ====================== Wine Text ======================
                        const Spacer(),
                        Text(widget.wineName,
                            style: TextStyle(color: Colors.white, fontFamily: 'Source_Code_Pro', fontSize: 30.sp, fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// ====================== Slider Screen ======================
          Positioned(
            top: 130.h,
            right: 1.w,
            left: 1.w,
            child: AnimationLimiter(
              child: Column(
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(seconds: 1),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    verticalOffset: MediaQuery.of(context).size.height / 2,
                    child: FadeInAnimation(child: widget),
                  ),
                  children: [
                    SizedBox(
                      height: 580.h,
                      child: const SliderScreen(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
