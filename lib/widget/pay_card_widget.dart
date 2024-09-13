import 'package:farm_loan_app/layout/custom_button.dart';
import 'package:farm_loan_app/layout/custom_form_input.dart';
import 'package:farm_loan_app/layout/custom_modal.dart';
import 'package:farm_loan_app/routes/custom_router.dart';
import 'package:farm_loan_app/tools/helper.dart';
import 'package:farm_loan_app/views/dashboard/services/dashboard_services.dart';
import 'package:farm_loan_app/views/repayment_screen/services/repayment_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class PayCardWidget extends StatefulWidget {
  final String amount;
  const PayCardWidget({super.key, required this.amount});

  @override
  State<PayCardWidget> createState() => _PayCardWidgetState();
}

class _PayCardWidgetState extends State<PayCardWidget> {
  TextEditingController _cardNumber = TextEditingController();
  TextEditingController _accountNumber = TextEditingController();
  TextEditingController _cvv = TextEditingController();
  TextEditingController _date = TextEditingController();

  bool _loading = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _loading,
      progressIndicator: loader,
      child: Form(
        key: _formKey,
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
                    'Card Information',
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
                height: 10.h,
              ),
              CardNumberFormInput(
                controller: _cardNumber,
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Flexible(
                      child: CustomNumberInput2(
                    label: 'CVV',
                    controller: _cvv,
                    validationText: 'CVV is required',
                    minLenght: 3,
                    hintText: 'e.g 055',
                  )),
                  SizedBox(
                    width: 10.w,
                  ),
                  Flexible(
                      child: ExpireyDateInput(
                    hintText: 'Expiry Date',
                    controller: _date,
                  )),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomPrimaryButton(
                  title: 'Submit',
                  callBack: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<RepaymentService>().repaymentReq(context, {
                        'requestId': context.read<RepaymentService>().requestId,
                        "amountPaid": widget.amount,
                        "cardNumber": _cardNumber.text,
                        "isCard": true,
                      }, (e) {
                        setState(() {
                          _loading = e;
                        });
                      });
                    }
                  }),
              SizedBox(
                height: 50.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


    // CustomFormInput(
            //     label: 'Card Number',
            //     controller: _cardName,
            //     valText: '',
            //     callBack: (e) {}),