// ignore_for_file: prefer_const_constructors

import 'package:farm_loan_app/constant/color_const.dart';
import 'package:farm_loan_app/routes/app_routes.dart';
import 'package:farm_loan_app/routes/custom_router.dart';
import 'package:farm_loan_app/tools/cutomBottomSheet.dart';
import 'package:farm_loan_app/tools/helper.dart';
import 'package:farm_loan_app/views/account/widget/support.dart';
import 'package:farm_loan_app/views/auth_screens/model/authModel.dart';
import 'package:farm_loan_app/views/auth_screens/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  // Map userData = box.get('userData');

  @override
  Widget build(BuildContext context) {
    AuthModel? userData = context.watch<AuthProvider>().userData;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'My Account',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            color: ColorConst.mainPrimaryColor,
          ),
        ),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 22.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.account_circle_outlined,
                color: ColorConst.mainPrimaryColor,
                size: 120.sp,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '${capitalize(userData?.firstName ?? '')} ${capitalize(userData?.lastName ?? '')}',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 50.h,
              ),
              InkWell(
                  onTap: () {
                    CustomRouters.routePushWithName(
                        context, AppRouter.update_profile);
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
                    CustomRouters.routePushWithName(
                        context, AppRouter.update_password);
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
                              'Update Password',
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
              // InkWell(
              //     onTap: () {
              //       // Navigator.of(context).pushNamed('/refearer');
              //       // Share.share(
              //       //     'Invite your friends and family to UNICXCHANGE');
              //     },
              //     child: Card(
              //       child: Container(
              //           padding:
              //               EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              //           child: Row(
              //             children: [
              //               Icon(
              //                 FeatherIcons.share,
              //                 size: 18.sp,
              //                 color: ColorConst.mainPrimaryColor,
              //               ),
              //               SizedBox(
              //                 width: 10.w,
              //               ),
              //               Text(
              //                 'Share With Friends',
              //                 style: TextStyle(color: Color(0xff302530)),
              //               ),
              //               Spacer(),
              //               Icon(
              //                 Icons.chevron_right,
              //                 size: 22.sp,
              //                 color: Colors.grey[600],
              //               )
              //             ],
              //           )),
              //     )),
              SizedBox(
                height: 8.h,
              ),
              InkWell(
                  onTap: () {
                    customBottomSheet(context, SupportWidget());
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
