import 'package:farm_loan_app/constant/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: Text('Notification'),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, index) {
            return ListTile(
              leading: Container(
                height: 45.sp,
                width: 45.sp,
                decoration: BoxDecoration(
                    color: ColorConst.mainPrimaryColor,
                    borderRadius: BorderRadius.circular(4.r)),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Notification',
                    style: TextStyle(fontSize: 15.sp),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    'What are the odds,What are the oddsWhat are the oddsWhat are the oddsWhat are the odds',
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
