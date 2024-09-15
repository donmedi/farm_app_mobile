import 'package:farm_loan_app/layout/custom_button.dart';
import 'package:farm_loan_app/layout/custom_form_input.dart';
import 'package:farm_loan_app/tools/helper.dart';
import 'package:farm_loan_app/views/auth_screens/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({super.key});

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  TextEditingController _oldController = TextEditingController();
  TextEditingController _newController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _loading,
      progressIndicator: loader,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Edit Password',
            style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(24.sp),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Update Password',
                  style:
                      TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 24.h,
                ),
                CustomBasicPassword(
                  label: 'Old Password',
                  controller: _oldController,
                  validationText: 'Old Password is required',
                  hintText: 'Old Password',
                ),
                SizedBox(height: 15.h),
                CustomBasicPassword(
                  label: 'New Password',
                  controller: _newController,
                  hintText: 'New Password',
                  validationText: 'New Password is required',
                ),
                SizedBox(
                  height: 64.h,
                ),
                CustomPrimaryButton(
                    title: 'Submit',
                    callBack: () {
                      //update password
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthProvider>().update_password(context, {
                          'oldPassword': _oldController.text,
                          'newPassword': _newController.text
                        }, (e) {
                          setState(() {
                            _loading = e;
                          });
                        });
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
