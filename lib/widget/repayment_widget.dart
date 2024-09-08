import 'package:farm_loan_app/constant/color_const.dart';
import 'package:farm_loan_app/layout/custom_button.dart';
import 'package:farm_loan_app/layout/custom_form_input.dart';
import 'package:farm_loan_app/routes/custom_router.dart';
import 'package:farm_loan_app/tools/cutomBottomSheet.dart';
import 'package:farm_loan_app/views/dashboard/services/dashboard_services.dart';
import 'package:farm_loan_app/widget/farm_delivery.dart';
import 'package:farm_loan_app/widget/fram_product_widget.dart';
import 'package:farm_loan_app/widget/loan_list.dart';
import 'package:farm_loan_app/widget/pay_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoanRepaymentWidget extends StatefulWidget {
  const LoanRepaymentWidget({super.key});

  @override
  State<LoanRepaymentWidget> createState() => _LoanRepaymentWidgetState();
}

class _LoanRepaymentWidgetState extends State<LoanRepaymentWidget> {
  TextEditingController _amountController = TextEditingController();
  TextEditingController _controllerProduce = TextEditingController();
  TextEditingController _loanController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<DashboardServices>().fetchOutstandingHistory(context);
  }

  final _formKey = GlobalKey<FormState>();

  List _priceList = ['2000', '5000', '10000', '20000'];

  String _paymentType = '';
  String _repaymentTime = '';

  void _handleRadioValueChange(String? value) {
    setState(() {
      _paymentType = value!;
    });
  }

  void _handleRepaymentChange(String? value) {
    setState(() {
      _repaymentTime = value!;
    });
  }

  String _selectedProduce = '';
  String _selectedPrice = '';

  void _handleProduceChange(String? value, String price) {
    setState(() {
      _selectedPrice = price;
      _selectedProduce = value!;
      _controllerProduce.text = value;
    });
    CustomRouters.routePop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(24.sp),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Loan Repayment',
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
              height: 24.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Repayment Type',
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile<String>(
                        title: const Text('Card'),
                        value: 'cash',
                        groupValue: _paymentType,
                        onChanged: _handleRadioValueChange,
                        visualDensity: VisualDensity.compact,
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<String>(
                        title: const Text('Farm Produce'),
                        value: 'farm_produce',
                        groupValue: _paymentType,
                        onChanged: _handleRadioValueChange,
                        visualDensity: VisualDensity.compact,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            _paymentType == 'farm_produce'
                ? CustomFormDisabledInput(
                    label: 'Farm Produce',
                    controller: _controllerProduce,
                    valText: '',
                    placeHolder: 'Select farm produce',
                    callBack: () {
                      customBottomSheet(
                          context,
                          FarmProductWidget(
                              handleProduceChange: _handleProduceChange,
                              selectedProduce: _selectedProduce));
                    })
                : SizedBox(),
            _paymentType == 'cash'
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Repayment Amount',
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          ..._priceList.map((item) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    // _selectedProduce = item['name'];
                                    // _selectedPrice = item['price'].toString();
                                    _amountController.text =
                                        item['price'].toString();
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 10.w),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 12.h, horizontal: 12.w),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      border: Border.all(
                                          width: 1.sp,
                                          color: _selectedPrice == item
                                              ? ColorConst.yellow40
                                              : Colors.black54)),
                                  child: Text(
                                    'NGN$item',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        color: _selectedPrice == item
                                            ? ColorConst.yellow40
                                            : Colors.black54),
                                  ),
                                ),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomFormInput(
                          label: '',
                          controller: _amountController,
                          valText: '',
                          placeHolder: 'Amount to repay',
                          callBack: (e) {}),
                    ],
                  )
                : SizedBox(),
            SizedBox(
              height: 15.h,
            ),
            SizedBox(
              height: 32.h,
            ),
            CustomPrimaryButton(
                title: 'Continue',
                callBack: () {
                  if (_formKey.currentState!.validate()) {
                    if (_paymentType == 'farm_produce') {
                      customBottomSheet(
                          context,
                          FarmDeliveryInfo(
                            amount: _selectedPrice,
                            produceType: _selectedProduce,
                          ));
                    } else {
                      customBottomSheet(
                          context,
                          PayCardWidget(
                            amount: _amountController.text,
                          ));
                    }
                  }
                }),
            SizedBox(
              height: 32.h,
            ),
          ],
        ),
      ),
    );
  }
}




  // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     // Text(
            //     //   'Repayment Time',
            //     //   style:
            //     //       TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            //     // ),
            //     // SizedBox(
            //     //   height: 10,
            //     // ),
            //     // Row(
            //     //   children: [
            //     //     ..._timeList.map((item) => Expanded(
            //     //           child: GestureDetector(
            //     //             onTap: () {
            //     //               _handleRepaymentChange(item);
            //     //             },
            //     //             child: Container(
            //     //               alignment: Alignment.center,
            //     //               margin: EdgeInsets.only(right: 10.w),
            //     //               padding: EdgeInsets.symmetric(
            //     //                   vertical: 12.h, horizontal: 12.w),
            //     //               decoration: BoxDecoration(
            //     //                   borderRadius: BorderRadius.circular(3),
            //     //                   border: Border.all(
            //     //                       width: 1.sp,
            //     //                       color: _repaymentTime == item
            //     //                           ? ColorConst.yellow40
            //     //                           : Colors.black54)),
            //     //               child: Text(
            //     //                 '$item',
            //     //                 style: TextStyle(
            //     //                     fontSize: 14.sp,
            //     //                     fontWeight: FontWeight.w500,
            //     //                     color: _repaymentTime == item
            //     //                         ? ColorConst.yellow40
            //     //                         : Colors.black54),
            //     //               ),
            //     //             ),
            //     //           ),
            //     //         ))
            //     // Expanded(
            //     //   child: RadioListTile<String>(
            //     //     title: const Text('Weekly'),
            //     //     value: 'weekly',
            //     //     groupValue: _repaymentTime,
            //     //     onChanged: _handleRepaymentChange,
            //     //     visualDensity: VisualDensity.compact,
            //     //   ),
            //     // ),
            //     // Expanded(
            //     //   child: RadioListTile<String>(
            //     //     title: const Text('Monthly'),
            //     //     value: 'monthly',
            //     //     groupValue: _repaymentTime,
            //     //     onChanged: _handleRepaymentChange,
            //     //     visualDensity: VisualDensity.compact,
            //     //   ),
            //     // ),
            //     //   ],
            //     // ),
            //   ],
            // ),