import 'dart:async';

import 'package:farm_loan_app/constant/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void successModalMinimal(context, String message) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0.r))),
      contentPadding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 20.0.sp),
      content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              color: ColorConst.green40,
              size: 50.sp,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text('Successful',
                style: TextStyle(
                    color: ColorConst.green40,
                    fontSize: 16.sp,
                    letterSpacing: 0.9,
                    fontWeight: FontWeight.w400)),
            SizedBox(
              height: 20.h,
            ),
            Text(message,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: ColorConst.darkText,
                    fontSize: 14.sp,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w400)),
          ]),
    ),
  );
}

void errorModal(context, String errorText) {
  Timer timer = Timer(Duration(milliseconds: 6000), () {
    Navigator.of(context, rootNavigator: true).pop();
  });
  showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                FeatherIcons.alertCircle,
                size: 48,
                color: ColorConst.mainPrimaryRed,
              ),
              // Image.asset('images/warning.png', height: 30.sp, width: 30.sp),
              SizedBox(
                height: 20.h,
              ),
              Text('Error',
                  style: TextStyle(
                      fontSize: 16,
                      color: ColorConst.mainPrimaryRed,
                      fontWeight: FontWeight.w700)),
              SizedBox(
                height: 20.h,
              ),
              Align(
                  alignment: Alignment.center,
                  child: Text(
                    errorText,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                  )),
            ],
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0.r))),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0.sp, vertical: 25.sp),
        );
      }).then((val) {
    timer?.cancel();
    // timer = null;
  });
}
