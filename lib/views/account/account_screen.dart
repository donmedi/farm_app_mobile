// ignore_for_file: prefer_const_constructors

import 'package:farm_loan_app/constant/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountScreen extends StatefulWidget {
  AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  // Map userData = box.get('userData');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 52.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'My Account',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: ColorConst.mainPrimaryColor,
                    ),
                  )),
              SizedBox(
                height: 50.h,
              ),
              Icon(
                Icons.account_circle_outlined,
                color: ColorConst.mainPrimaryColor,
                size: 60.sp,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'User',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 50.h,
              ),
              InkWell(
                  onTap: () {
                    // Navigator.of(context)
                    // .push(MaterialPageRoute(builder: (_) => EditProfile()));
                  },
                  child: Card(
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 15.h),
                        child: Row(
                          children: [
                            Icon(
                              FeatherIcons.user,
                              size: 18.sp,
                              color: ColorConst.mainPrimaryColor,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              'Edit Profile',
                              style: TextStyle(color: Color(0xff302530)),
                            ),
                            Spacer(),
                            Icon(
                              Icons.chevron_right,
                              size: 22.sp,
                              color: Colors.grey[600],
                            )
                          ],
                        )),
                  )),
              SizedBox(
                height: 8.h,
              ),
              InkWell(
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    //   return SecurityPage();
                    // }));
                  },
                  child: Card(
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 15.h),
                        child: Row(
                          children: [
                            Icon(
                              FeatherIcons.key,
                              size: 18.sp,
                              color: ColorConst.mainPrimaryColor,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              'Security Settings',
                              style: TextStyle(color: Color(0xff302530)),
                            ),
                            Spacer(),
                            Icon(
                              Icons.chevron_right,
                              size: 22.sp,
                              color: Colors.grey[600],
                            )
                          ],
                        )),
                  )),
              SizedBox(
                height: 8.h,
              ),
              InkWell(
                  onTap: () {
                    // Navigator.of(context).pushNamed('/refearer');
                    // Share.share(
                    //     'Invite your friends and family to UNICXCHANGE');
                  },
                  child: Card(
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        child: Row(
                          children: [
                            Icon(
                              FeatherIcons.share,
                              size: 18.sp,
                              color: ColorConst.mainPrimaryColor,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              'Share With Friends',
                              style: TextStyle(color: Color(0xff302530)),
                            ),
                            Spacer(),
                            Icon(
                              Icons.chevron_right,
                              size: 22.sp,
                              color: Colors.grey[600],
                            )
                          ],
                        )),
                  )),
              SizedBox(
                height: 8.h,
              ),
              InkWell(
                  onTap: () {
                    // customBottomSheet(context, SupportWidget());
                    // launchWhatApp();
                  },
                  child: Card(
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        child: Row(
                          children: [
                            Icon(
                              FeatherIcons.headphones,
                              size: 18.sp,
                              color: ColorConst.mainPrimaryColor,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              'Support',
                              style: TextStyle(color: Color(0xff302530)),
                            ),
                            Spacer(),
                            Icon(
                              Icons.chevron_right,
                              size: 22.sp,
                              color: Colors.grey[600],
                            )
                          ],
                        )),
                  )),
              Spacer(),
              MaterialButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/login', (route) => false);
                  },
                  color: ColorConst.darkText,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.all(15.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FeatherIcons.logOut,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        'Logout',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                            color: Colors.white),
                      ),
                    ],
                  ))
            ],
          )),
    );
  }
}
