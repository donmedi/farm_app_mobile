import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SupportWidget extends StatelessWidget {
  const SupportWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.sp),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Support',
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700),
            ),
            Text(
              'Contact our support, open from 8am to 6pm daily',
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 24.h,
            ),
            Text(
              'Email',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              'farm_loans@mails.com',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
            ),
            Divider(
              height: 24.h,
            ),
            Text(
              'phone Number',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              '01-2345-4095',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 44.h,
            ),
          ]),
    );
  }
}
