import 'dart:developer';

import 'package:farm_loan_app/constant/color_const.dart';
import 'package:farm_loan_app/layout/custom_button.dart';
import 'package:farm_loan_app/layout/custom_form_input.dart';
import 'package:farm_loan_app/layout/custom_modal.dart';
import 'package:farm_loan_app/routes/custom_router.dart';
import 'package:farm_loan_app/tools/cutomBottomSheet.dart';
import 'package:farm_loan_app/tools/helper.dart';
import 'package:farm_loan_app/views/repayment_screen/services/repayment_service.dart';
import 'package:farm_loan_app/widget/branch_address_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class FarmDeliveryInfo extends StatefulWidget {
  final String amount;
  final String produceType;
  const FarmDeliveryInfo(
      {super.key, required this.amount, required this.produceType});

  @override
  State<FarmDeliveryInfo> createState() => _FarmDeliveryInfoState();
}

class _FarmDeliveryInfoState extends State<FarmDeliveryInfo> {
  TextEditingController _branch = TextEditingController();
  TextEditingController _numberOfProduce = TextEditingController();
  // TextEditingController +

  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    log('amoutn ${widget.amount}');

    return ModalProgressHUD(
      inAsyncCall: _loading,
      progressIndicator: loader,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(24.sp)
            .copyWith(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Produce Information',
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
                ),
                InkWell(
                  onTap: () {
                    CustomRouters.routePop(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(FeatherIcons.x),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomFormDisabledInput(
                label: 'Branch',
                controller: _branch,
                valText: '',
                placeHolder: 'Which branch you want to deliver to?',
                callBack: () {
                  customBottomSheet(
                      context,
                      BranchDeliveryWidget(
                          handleAddressChange: (e) {
                            setState(() {
                              _branch.text = e;
                            });
                            CustomRouters.routePop(context);
                          },
                          selectedProduce: _branch.text));
                }),
            SizedBox(
              height: 15.h,
            ),
            CustomFormDisabledInput2(
                label: 'Number of Produce',
                controller: _numberOfProduce,
                valText: '',
                placeHolder: 'Number of Produce',
                callBack: () {
                  customBottomSheet(
                      context,
                      SingleChildScrollView(
                        padding: EdgeInsets.all(20.sp),
                        // width: double.maxFinite,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Select Number of Produce',
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            ...List.generate(20, (e) {
                              return InkWell(
                                  onTap: () {
                                    setState(() {
                                      _numberOfProduce.text =
                                          (e + 1).toString();
                                    });

                                    CustomRouters.routePop(context);
                                  },
                                  child: Container(
                                      width: double.maxFinite,
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  width: 1.sp,
                                                  color:
                                                      ColorConst.borderColor))),
                                      padding: EdgeInsets.all(15.sp),
                                      child: Text('${e + 1}')));
                            })
                          ],
                        ),
                      ));
                }),
            SizedBox(
              height: 15.h,
            ),
            SizedBox(
              height: 35.h,
            ),
            CustomPrimaryButton(
                title: 'Submit',
                callBack: () {
                  context.read<RepaymentService>().repaymentReq(context, {
                    'requestId': context.read<RepaymentService>().requestId,
                    "amountPaid": int.parse(widget.amount) *
                        int.parse(_numberOfProduce.text),
                    'produce': widget.produceType,
                    'branch': _branch.text,
                    "isCard": false,
                    'cardNumber': '1234',
                    'numberOfProduce': _numberOfProduce.text
                  }, (e) {
                    setState(() {
                      _loading = e;
                    });
                  });
                  // CustomRouters.routePop(context);
                  // CustomRouters.routePop(context);

                  // successModalMinimal(context, 'Delivery Repayment Successfully');
                }),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
