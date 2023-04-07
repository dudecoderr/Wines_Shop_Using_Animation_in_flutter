// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:wine_shop_app/detail_screen/detail_screen.dart';
import 'package:wine_shop_app/home_screen/home_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<String> _containerTitles = ['Chateau', 'La Mission', 'Leognan'];
  final List<String> _containerYearText = ['1996, 075L', '1997, 0.75L', '1998, 075L'];
  final List<double> _containerPrice = [1286, 1001, 908];

  double get sum => _containerPrice.fold(0, (a, b) => a + b);

  final List<String> _containerImage = ['assets/cart_chateau.png', 'assets/cart_leognan.png', 'assets/cart_mission.png'];

  void _deleteContainer(int index) {
    setState(() {
      _containerTitles.removeAt(index);
      _containerPrice.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff070d1b),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AnimationLimiter(
              child: Column(
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(seconds: 4),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    horizontalOffset: MediaQuery.of(context).size.width / 2,
                    child: FadeInAnimation(child: widget),
                  ),
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 45.h, left: 15.w, right: 15.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /// ====================== Back Arrow Icon ======================
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DetailScreen(wineName: ''),
                                ),
                              );
                            },
                            child: Container(
                              width: 49.w,
                              height: 49.h,
                              decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white)),
                              child: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20.sp),
                            ),
                          ),

                          /// ====================== Cart Text ======================
                          Text('Cart',
                              style: TextStyle(color: Colors.white, fontFamily: 'Source_Code_Pro', fontSize: 30.sp, fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// ====================== ListView.builder ======================
            SizedBox(
              height: 500.h,
              child: ListView.builder(
                itemCount: _containerTitles.length,
                itemBuilder: (context, index) {
                  return ContainerWithCloseIcon(
                    title: _containerTitles[index],
                    yearText: _containerYearText[index],
                    price: '\$${_containerPrice[index]}',
                    image: _containerImage[index],
                    onCloseIconTap: () => _deleteContainer(index),
                  );
                },
              ),
            ),

            /// ====================== ElevatedButton ======================
            SizedBox(height: 10.h),
            AnimationLimiter(
              child: Column(
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(seconds: 4),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    verticalOffset: MediaQuery.of(context).size.height / 2,
                    child: FadeInAnimation(child: widget),
                  ),
                  children: [
                    SizedBox(
                      height: 70.h,
                      width: 320.w,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffFCE836), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r))),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        },
                        child: Text('Buy for \$$sum',
                            style: TextStyle(color: Colors.black, fontFamily: 'Source_Code_Pro', fontSize: 20.sp, fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerWithCloseIcon extends StatelessWidget {
  final String title;
  final String yearText;
  final String price;
  final String image;
  final VoidCallback onCloseIconTap;

  const ContainerWithCloseIcon(
      {super.key, required this.title, required this.onCloseIconTap, required this.yearText, required this.price, required this.image});

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: Column(
        children: AnimationConfiguration.toStaggeredList(
          duration: const Duration(seconds: 3),
          childAnimationBuilder: (widget) => SlideAnimation(
            verticalOffset: MediaQuery.of(context).size.height / 2,
            child: FadeInAnimation(child: widget),
          ),
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(right: 5.w, left: 5.w),
                  height: 150.h,
                  width: 350.w,
                  // color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// ====================== Image ======================
                      Image.asset(image),

                      Container(
                        padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                        height: 130.h,
                        width: 130.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /// ====================== Title ======================
                            Text(title, style: TextStyle(fontSize: 20.sp, color: Colors.white, fontWeight: FontWeight.w500)),

                            /// ====================== Year Text ======================
                            Text(yearText, style: TextStyle(fontSize: 15.sp, color: const Color(0xff606572), fontWeight: FontWeight.w400)),

                            /// ====================== Price ======================
                            SizedBox(height: 10.h),
                            Text(price,
                                style: TextStyle(
                                    fontSize: 27.sp, color: const Color(0xffFCE836), fontWeight: FontWeight.w800, fontFamily: 'Source_Code_Pro')),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          /// ====================== Close Icon ======================
                          InkWell(
                            onTap: onCloseIconTap,
                            child: Container(
                              width: 50.w,
                              height: 50.h,
                              decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                              child: Icon(Icons.close, color: const Color(0xff070d1b), size: 24.sp),
                            ),
                          ),

                          /// ====================== Expand More Icon ======================
                          Container(
                            width: 50.w,
                            height: 50.h,
                            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white)),
                            child: Icon(Icons.expand_more, color: Colors.white, size: 33.sp),
                          ),
                        ],
                      ),
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
