// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dots_indicator/dots_indicator.dart';
import 'package:farm_loan_app/constant/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:/layout/styles.dart';
// import 'package:ourgwala/tools/styles.dart';
// import 'package:ourgwala/views/authPage/login.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int currentPage = 0;

  // var userData = box.get('userData');

  // void _getFirstTime() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   // FlutterSecureStorage storage = FlutterSecureStorage();
  //   bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

  //   if (isFirstTime == true) {
  //     // await storage.deleteAll();
  //     box.clear();
  //     prefs.setBool('isFirstTime', false);
  //   }
  //   // log('this is called $isFirstTime');
  // }

  List textArr = [
    {
      'image': 'farmer2.jpg',
      'title': 'Empower Your Agricultural Dreams',
      'desc':
          'Secure affordable loans designed specifically for farmers. From crop cultivation to livestock management, our loans provide the financial boost you need to achieve your farming goals.'
    },
    {
      'image': 'farmer.jpg',
      'title': 'Affordable Farm Financing',
      'desc':
          "Take the next step in your farming journey with our tailored loan solutions. Our competitive rates and flexible terms make it easier than ever to secure the funding your farm needs to thrive."
    },
    {
      'image': 'farmer3.jpg',
      'title': "Boost Your Farm's Potential",
      'desc':
          "Unlock the financial support you need with our affordable farm loans. Whether you’re expanding your operations or investing in new equipment, we’re here to help you grow your agricultural business with ease."
    },
  ];

  @override
  initState() {
    super.initState();
    // _getId();
  }

  Widget build(BuildContext context) {
    final PageController controller = PageController();

    return Scaffold(
      body: Stack(children: [
        PageView(
          /// [PageView.scrollDirection] defaults to [Axis.horizontal].
          /// Use [Axis.vertical] to scroll vertically.
          controller: controller,
          onPageChanged: (e) {
            setState(() {
              currentPage = e;
            });
          },
          children: List.generate(
              textArr.length,
              (index) => Container(
                      child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage('images/${textArr[index]['image']}'),
                          fit: BoxFit.cover),
                    ),
                    width: double.infinity,
                    child: Container(
                      alignment: Alignment.bottomCenter,

                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Color.fromRGBO(0, 0, 0, 0.62),
                            Color.fromRGBO(0, 0, 0, 0.5642),
                            Color.fromRGBO(0, 0, 0, 0),
                          ],
                          stops: [0.1822, 0.4156, 0.6574],
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 40.h, horizontal: 20.w),
                      // color: Color(0xffBAB3D4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Spacer(),
                          SizedBox(
                            height: 140.h,
                          ),
                          Text(textArr[index]['title'],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 32.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700)),
                          SizedBox(
                            height: 14.h,
                          ),
                          Text(textArr[index]['desc'],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontFamily: 'Lato',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500)),
                          Spacer(),
                        ],
                      ),
                    ),
                  ))),
        ),
        Positioned.fill(
            bottom: 60.h,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.bottomCenter,
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: currentPage == 0
                              ? ColorConst.mainPrimaryColor
                              : Colors.white,
                        ),
                        height: 7.h,
                      )),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: currentPage == 1
                                ? ColorConst.mainPrimaryColor
                                : Colors.white),
                        // color: mainColor,
                        height: 7.h,
                      )),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: currentPage == 2
                                ? ColorConst.mainPrimaryColor
                                : Colors.white),
                        // color: mainColor,
                        height: 7,
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: MaterialButton(
                              color: Colors.transparent,
                              elevation: 0,
                              padding: EdgeInsets.symmetric(
                                  vertical: 14.h, horizontal: 40.h),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1,
                                  color: ColorConst.mainPrimaryColor,
                                ),
                                borderRadius: BorderRadius.circular(10.0.r),
                              ),
                              onPressed: (() {
                                Navigator.of(context).pushNamed('/login');
                              }),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              ))),
                      SizedBox(
                        width: 20.w,
                      ),
                      Expanded(
                          child: MaterialButton(
                              elevation: 0,
                              padding: EdgeInsets.symmetric(
                                  vertical: 14.h, horizontal: 40.w),
                              color: ColorConst.mainPrimaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0.r),
                              ),
                              onPressed: (() {
                                Navigator.of(context).pushNamed('/register');
                              }),
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              ))),
                    ],
                  )
                ])))
      ]),
    );
  }
}
