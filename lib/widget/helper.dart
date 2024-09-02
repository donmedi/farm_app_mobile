import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget statusBar(String status) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
    decoration: BoxDecoration(
      color: statusColor(status),
      borderRadius: BorderRadius.circular(15.r),
    ),
    child: Text(
      status,
      style: TextStyle(fontSize: 12.sp, color: Colors.white),
    ),
  );
}

Color statusColor(String text) {
  switch (text) {
    case 'success':
      return Color.fromARGB(255, 102, 237, 183);
    case 'failed':
      return Colors.red;
    case 'pending':
      return Color.fromRGBO(241, 174, 73, 1);
    default:
      return Colors.grey;
  }
}
