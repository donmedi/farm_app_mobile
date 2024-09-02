import 'dart:developer';

import 'package:farm_loan_app/constant/color_const.dart';
import 'package:farm_loan_app/layout/custom_button.dart';
import 'package:farm_loan_app/routes/app_routes.dart';
import 'package:farm_loan_app/routes/custom_router.dart';
import 'package:farm_loan_app/tools/cutomBottomSheet.dart';
import 'package:farm_loan_app/views/auth_screens/model/authModel.dart';
import 'package:farm_loan_app/views/auth_screens/provider/auth_provider.dart';
import 'package:farm_loan_app/views/dashboard/services/dashboard_services.dart';
import 'package:farm_loan_app/views/dashboard/widget/wallet_modal.dart';
import 'package:farm_loan_app/views/transactions/widget/transaction_details.dart';
import 'package:farm_loan_app/widget/helper.dart';
import 'package:farm_loan_app/widget/repayment_widget.dart';
import 'package:farm_loan_app/widget/request_loan_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class DahsboardScreen extends StatefulWidget {
  const DahsboardScreen({super.key});

  @override
  State<DahsboardScreen> createState() => _DahsboardScreenState();
}

class _DahsboardScreenState extends State<DahsboardScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<AuthProvider>(context, listen: false).getProfile(context);
    context.read<DashboardServices>().fetchOutstanding(context);
    context.read<DashboardServices>().fetchHistory(context);
  }

  @override
  Widget build(BuildContext context) {
    List<RouteClass> dataList = [
      RouteClass(
          title: 'Wallet',
          callBack: () {
            customBottomSheet(context, WalletModalWidget());
          },
          icon: Icons.account_balance_wallet),
      RouteClass(
          title: 'Request',
          callBack: () {
            customBottomSheet(context, RequestLoanWidget());
          },
          icon: Icons.account_balance),
      RouteClass(
          title: 'Repay',
          callBack: () {
            customBottomSheet(context, LoanRepaymentWidget());
          },
          icon: Icons.handshake),
    ];

    AuthModel? userData = context.watch<AuthProvider>().userData;

    log('balance ${userData?.wallet?.balance}');
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: ColorConst.mainPrimaryColor,
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hello, ${userData?.firstName}'),
                Text('Good Morning'),
              ],
            ),
            Spacer(),
            InkWell(
                onTap: () {
                  CustomRouters.routePushWithName(
                      context, AppRouter.notification);
                },
                child: Icon(Icons.notifications))
          ],
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: ColorConst.mainPrimaryColor,
              ),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Overall Balance'),
                        Text(
                          'NGN ${userData?.wallet?.balance}',
                          style: TextStyle(
                              fontSize: 32.sp, fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...dataList.map((item) => InkWell(
                      onTap: () {
                        item.callBack.call();
                      },
                      child: Column(
                        children: [
                          CircleAvatar(
                              radius: 25.sp,
                              backgroundColor: ColorConst.yellow40,
                              child: Icon(
                                item.icon,
                                color: Colors.white,
                                size: 30.sp,
                              )),
                          SizedBox(
                            height: 7.h,
                          ),
                          Text(
                            item.title,
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    )),
              ],
            ),
            // CustomSecondaryButton(title: 'Request Loan', callBack: () {}),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent Transactions',
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline),
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            ...List.generate(10, (e) {
              return ListTile(
                onTap: () {
                  customBottomSheet(context, TransactionDetails());
                },
                leading: CircleAvatar(
                  backgroundColor: ColorConst.darkText,
                  child: Icon(FeatherIcons.arrowDownLeft),
                ),
                title: Text('Repayment'),
                subtitle: Text('12/3/2024'),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [Text('NGN12,000'), statusBar('success')],
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}

class RouteClass {
  String title;
  IconData icon;
  Function callBack;

  RouteClass({required this.title, required this.callBack, required this.icon});
}
