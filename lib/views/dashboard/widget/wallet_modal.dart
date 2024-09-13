import 'package:farm_loan_app/layout/custom_button.dart';
import 'package:farm_loan_app/routes/custom_router.dart';
import 'package:farm_loan_app/tools/cutomBottomSheet.dart';
import 'package:farm_loan_app/tools/helper.dart';
import 'package:farm_loan_app/views/auth_screens/model/authModel.dart';
import 'package:farm_loan_app/views/auth_screens/provider/auth_provider.dart';
import 'package:farm_loan_app/views/dashboard/services/dashboard_services.dart';
import 'package:farm_loan_app/views/dashboard/widget/withdraw_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class WalletModalWidget extends StatelessWidget {
  const WalletModalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AuthModel? userData = context.watch<AuthProvider>().userData;
    String outstanding = context.watch<DashboardServices>().outstandingBal;

    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(24.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Wallet Balance',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          Container(
            padding: EdgeInsets.all(20.sp),
            width: double.maxFinite,
            // margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(width: 1.sp, color: Colors.black54)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Outstanding Balance',
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  'NGN ${digitConverterString(outstanding)}',
                  style:
                      TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
              padding: EdgeInsets.all(20.sp),
              width: double.maxFinite,
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(width: 1.sp, color: Colors.black54)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Current Balance',
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    'NGN ${digitConverterString(userData?.wallet?.balance ?? '0')}',
                    style:
                        TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700),
                  ),
                ],
              )),
          SizedBox(
            height: 24.h,
          ),
          CustomPrimaryButton(
              title: 'Withdraw',
              callBack: () {
                CustomRouters.routePop(context);

                customBottomSheet(context, WithdrawModal());
              })
        ],
      ),
    );
  }
}
