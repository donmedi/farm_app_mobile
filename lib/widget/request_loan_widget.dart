import 'dart:developer';
import 'package:farm_loan_app/tools/helper.dart';
import 'package:farm_loan_app/tools/toaster.dart';
import 'package:farm_loan_app/views/dashboard/services/dashboard_services.dart';
import 'package:intl/intl.dart';
import 'package:farm_loan_app/constant/color_const.dart';
import 'package:farm_loan_app/layout/custom_button.dart';
import 'package:farm_loan_app/layout/custom_form_input.dart';
import 'package:farm_loan_app/layout/custom_modal.dart';
import 'package:farm_loan_app/routes/custom_router.dart';
import 'package:farm_loan_app/tools/cutomBottomSheet.dart';
import 'package:farm_loan_app/widget/fram_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class RequestLoanWidget extends StatefulWidget {
  const RequestLoanWidget({super.key});

  @override
  State<RequestLoanWidget> createState() => _RequestLoanWidgetState();
}

class _RequestLoanWidgetState extends State<RequestLoanWidget> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _controllerProduce = TextEditingController();
  // TextEditingController _controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  List _priceList = ['2000', '5000', '10000', '20000'];

  String _paymentType = '';
  Map _repaymentTime = {};

  void _handleRadioValueChange(String? value) {
    setState(() {
      _paymentType = value!;
    });
  }

  void _handleRepaymentChange(Map? value) {
    setState(() {
      _repaymentTime = value!;
    });
  }

  String _selectedProduce = '';

  void _handleProduceChange(String? value) {
    setState(() {
      _selectedProduce = value!;
      _controllerProduce.text = value;
    });
    CustomRouters.routePop(context);
  }

  // String _selectedPrice = '';

  // List _timeList = ['3 Months', '6 Months', '12 Months', '18 Months'];

  List<Map<String, dynamic>> calculateDueDates() {
    DateTime currentDate = DateTime.now();
    List<Map<String, dynamic>> dueDates = [];

    for (String dueDate in ['3 Months', '6 Months', '12 Months', '18 Months']) {
      int monthsToAdd =
          int.parse(dueDate.split(' ')[0]); // Get the number of months
      DateTime newDueDate = DateTime(
        currentDate.year,
        currentDate.month + monthsToAdd,
        currentDate.day,
      );

      String formattedDate = DateFormat('dd MMMM yyyy').format(newDueDate);

      dueDates.add({
        'title': dueDate,
        'value': formattedDate,
        'noMonths': int.parse(dueDate.split(' ')[0])
      });
    }

    return dueDates;
  }

  String calculateGrossTotal() {
    log('number ${_repaymentTime['noMonths']}');
    double amount =
        double.parse(_controller.text.isNotEmpty ? _controller.text : '0');
    int noOfMonths = _repaymentTime['noMonths'] ?? 0;
    double interestRate = 0.03; // 3% interest
    double grossTotal = amount + (amount * interestRate * noOfMonths);
    return digitConverterString(grossTotal.toStringAsFixed(2));
  }

  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    // log('${calculateDueDates()}');

    return ModalProgressHUD(
      inAsyncCall: _loading,
      progressIndicator: loader,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(24.sp)
            .copyWith(bottom: MediaQuery.of(context).viewInsets.bottom),
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
                    'Loan Request',
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
                  ),
                  InkWell(
                    onTap: () {
                      CustomRouters.routePop(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(FeatherIcons.x),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              CustomNumberInput(
                label: 'Amount',
                controller: _controller,
                minAmount: '20000',
                validationText: 'Amount is required',
                hintText: 'Amount to borrow',
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                'minimum of NGN20,000',
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 25.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Loan Lifetime',
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Wrap(
                    spacing: 10.w, // Space between items
                    runSpacing: 10.h, // Space between lines
                    children: [
                      ...calculateDueDates().map(
                        (item) => GestureDetector(
                          onTap: () {
                            _handleRepaymentChange(item);
                          },
                          child: Container(
                            width: 100,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                vertical: 12.h, horizontal: 12.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24.r),
                                color: _repaymentTime['title'] == item['title']
                                    ? ColorConst.yellow40
                                    : Colors.white,
                                border: Border.all(
                                    width: 1.sp, color: Colors.black54)),
                            child: Text(
                              '${item['title']}',
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black54),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                padding: EdgeInsets.all(10.sp),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Color.fromARGB(255, 223, 239, 248)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Summary',
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Monthly Interest'),
                        Text('3%'),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Due Date'),
                        Text('${_repaymentTime['value'] ?? ''}'),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Gross Total'),
                        Text('NGN ${calculateGrossTotal()}'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
              CustomPrimaryButton(
                  title: 'Submit',
                  callBack: () {
                    if (_formKey.currentState!.validate()) {
                      if (_repaymentTime != {}) {
                        context.read<DashboardServices>().loanRequest(context, {
                          'amount': _controller.text,
                          'repaymentTime': _repaymentTime['title']
                        }, (e) {
                          setState(() {
                            _loading = e;
                          });
                        });
                      } else {
                        NotificationClass.showWarningToast(context, 'Warning',
                            'Select loan duration to continue');
                      }
                    }
                  }),
              SizedBox(
                height: 32.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
