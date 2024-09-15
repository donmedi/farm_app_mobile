import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyTransaction extends StatelessWidget {
  final String? text;
  const EmptyTransaction({super.key, this.text});

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
              text == null || text == '' ? 'No Transaction' : (text ?? ''),
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
            )
          ],
        )));
  }
}
