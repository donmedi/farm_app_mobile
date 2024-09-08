import 'package:farm_loan_app/constant/color_const.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:overlay_support/overlay_support.dart';

class InAppNotificationCard extends StatelessWidget {
  RemoteMessage? message;
  InAppNotificationCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 4),
        child: ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
          leading: SizedBox.fromSize(
            size: Size(40, 40),
            child: Container(
              child: Image.asset(
                'images/logo.png',
                height: 48.h,
                width: 48.h,
              ),
              color: Colors.white,
            ),
          ),
          title: Text(message?.notification?.title ?? 'N/A',
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message?.notification?.body ?? 'N/A',
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: ColorConst.mainPrimaryColor),
              ),
              // InkWell(
              //   onTap: () {
              //     OverlaySupportEntry.of(context)!.dismiss();
              //     customNotificationModal(context, message);
              //   },
              //   child: Padding(
              //       padding: EdgeInsets.symmetric(vertical: 8.h),
              //       child: Text(
              //         'Show message',
              //         style: TextStyle(
              //             fontSize: 12.sp,
              //             fontWeight: FontWeight.w600,
              //             color: ColorConstant.mainPrimaryColor),
              //       )),
              // )
            ],
          ),
          trailing: InkWell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.close,
                  color: ColorConst.mainPrimaryColor,
                ),
              ),
              onTap: () {
                OverlaySupportEntry.of(context)!.dismiss();
              }),
        ),
      ),
    );
  }
}
