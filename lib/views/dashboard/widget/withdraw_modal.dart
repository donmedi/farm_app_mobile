import 'package:farm_loan_app/layout/custom_button.dart';
import 'package:farm_loan_app/layout/custom_form_input.dart';
import 'package:farm_loan_app/layout/custom_modal.dart';
import 'package:farm_loan_app/routes/custom_router.dart';
import 'package:farm_loan_app/tools/helper.dart';
import 'package:farm_loan_app/views/auth_screens/model/authModel.dart';
import 'package:farm_loan_app/views/auth_screens/provider/auth_provider.dart';
import 'package:farm_loan_app/views/dashboard/services/dashboard_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class WithdrawModal extends StatefulWidget {
  const WithdrawModal({super.key});

  @override
  State<WithdrawModal> createState() => _WithdrawModalState();
}

class _WithdrawModalState extends State<WithdrawModal> {
  TextEditingController _amountController = TextEditingController();
  TextEditingController _accountName = TextEditingController();
  TextEditingController _bankName = TextEditingController();
  TextEditingController _accountNumber = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    AuthModel? userData = context.watch<AuthProvider>().userData;

    return ModalProgressHUD(
      inAsyncCall: _loading,
      progressIndicator: loader,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(24.sp)
            .copyWith(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    'Withdraw',
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                children: [
                  Text('Wallet Balance: '),
                  Text(
                    'NGN ${digitConverterString(userData?.wallet?.balance ?? '0')}',
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomNumberInput(
                label: 'Amount',
                controller: _amountController,
                hintText: 'Amount',
                validationText: 'Amount is required',
                minAmount: '0',
              ),
              SizedBox(
                height: 14.h,
              ),
              CustomNumberInput(
                label: 'Account Number',
                controller: _accountNumber,
                minAmount: '-0',
                validationText: 'Account Number is required',
                hintText: 'Accont Number',
              ),
              SizedBox(
                height: 14.h,
              ),
              CustomFormInput(
                  label: 'Account Name',
                  controller: _accountName,
                  valText: 'Account Name',
                  placeHolder: 'Account Name',
                  callBack: (e) {}),
              SizedBox(
                height: 14.h,
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomFormInput(
                  label: 'Bank Name',
                  controller: _bankName,
                  valText: 'Bank Name is required',
                  placeHolder: 'Bank Name',
                  callBack: (e) {}),
              SizedBox(
                height: 14.h,
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomPrimaryButton(
                  title: 'Continue',
                  callBack: () {
                    if (_formKey.currentState!.validate()) {
                      context
                          .read<DashboardServices>()
                          .withdrawWallet(context, {
                        'bankName': _bankName.text,
                        'accountName': _accountName.text,
                        'amount': _amountController.text,
                        'accountNumber': _accountNumber.text,
                      }, (e) {
                        setState(() {
                          _loading = e;
                        });
                      });
                    }
                    // CustomRouters.routePop(context);
                    // successModalMinimal(
                    //     context, 'Withdraw success, your transaction is pending.');
                  }),
              SizedBox(
                height: 70.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
