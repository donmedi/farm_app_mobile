import 'package:farm_loan_app/constant/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPrimaryButton extends StatelessWidget {
  String title;
  Function callBack;
  CustomPrimaryButton({super.key, required this.title, required this.callBack});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.maxFinite,
      color: Colors.amber,
      padding: EdgeInsets.all(14.sp),
      elevation: 0,
      height: 54.h,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      onPressed: () {
        callBack();
      },
      child: Text(
        title,
        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class CustomSecondaryButton extends StatelessWidget {
  String title;
  Function callBack;
  CustomSecondaryButton(
      {super.key, required this.title, required this.callBack});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.maxFinite,
      color: ColorConst.darkText,
      padding: EdgeInsets.all(14.sp),
      elevation: 0,
      height: 54.h,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      onPressed: () {
        callBack();
      },
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: Colors.amber,
        ),
      ),
    );
  }
}
