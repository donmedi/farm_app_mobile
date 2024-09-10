import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyTransaction extends StatelessWidget {
  const EmptyTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 250.h,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              FeatherIcons.file,
              size: 80.sp,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'No Transaction',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
            )
          ],
        )));
  }
}
