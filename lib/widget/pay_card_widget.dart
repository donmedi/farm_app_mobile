import 'package:farm_loan_app/layout/custom_button.dart';
import 'package:farm_loan_app/layout/custom_form_input.dart';
import 'package:farm_loan_app/layout/custom_modal.dart';
import 'package:farm_loan_app/routes/custom_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PayCardWidget extends StatefulWidget {
  const PayCardWidget({super.key});

  @override
  State<PayCardWidget> createState() => _PayCardWidgetState();
}

class _PayCardWidgetState extends State<PayCardWidget> {
  TextEditingController _cardName = TextEditingController();
  TextEditingController _accountNumber = TextEditingController();
  TextEditingController _cvv = TextEditingController();
  TextEditingController _date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(24.sp),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Card Information',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
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
          CustomFormInput(
              label: 'Card Number',
              controller: _cardName,
              valText: '',
              callBack: (e) {}),
          SizedBox(
            height: 10.h,
          ),
          CustomFormInput(
              label: 'Card Number',
              controller: _cardName,
              valText: '',
              callBack: (e) {}),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Flexible(
                  child: CustomFormInput(
                      label: 'CVV',
                      controller: _cvv,
                      valText: '',
                      callBack: (e) {})),
              SizedBox(
                width: 10.w,
              ),
              Flexible(
                  child: CustomFormInput(
                      label: 'Expiry Date',
                      controller: _date,
                      valText: '',
                      callBack: (e) {})),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomPrimaryButton(
              title: 'Submit',
              callBack: () {
                CustomRouters.routePop(context);
                CustomRouters.routePop(context);

                successModalMinimal(context, 'Card Payment Successfully');
              })
        ],
      ),
    );
  }
}
