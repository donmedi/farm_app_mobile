import 'package:farm_loan_app/constant/color_const.dart';
import 'package:farm_loan_app/layout/custom_button.dart';
import 'package:farm_loan_app/layout/custom_form_input.dart';
import 'package:farm_loan_app/routes/app_routes.dart';
import 'package:farm_loan_app/routes/custom_router.dart';
import 'package:farm_loan_app/tools/helper.dart';
import 'package:farm_loan_app/views/auth_screens/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  TextEditingController _confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _loading,
      progressIndicator: loader,
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  'Register',
                  style:
                      TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 14.h,
                ),
                Text(
                  'Discover an easy way to farm and make money',
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomFormInput(
                    label: 'Firstname',
                    controller: _firstNameController,
                    placeHolder: 'First Name',
                    valText: 'First Name is required',
                    callBack: (e) {}),
                SizedBox(
                  height: 20,
                ),
                CustomFormInput(
                    label: 'Last Name',
                    controller: _lastNameController,
                    placeHolder: 'Last Name',
                    valText: 'Last Name is required',
                    callBack: (e) {}),
                SizedBox(
                  height: 20,
                ),
                CustomFormInput(
                    label: 'Email',
                    placeHolder: 'Email Address',
                    controller: _emailController,
                    valText: 'Email is required',
                    callBack: (e) {}),
                SizedBox(
                  height: 20,
                ),
                CustomPhoneInput(
                    controller: _phoneController,
                    hintText: 'Phone Number',
                    label: 'Phone Number',
                    validationText: 'Phone Number is required'),
                SizedBox(
                  height: 20,
                ),
                CustomBasicPassword(
                  label: 'Password',
                  hintText: 'Enter password',
                  controller: _passwordController,
                  validationText: 'Password is required',
                ),
                SizedBox(
                  height: 20,
                ),
                CustomPasswordConfirm(
                  label: 'Confirm Password',
                  mainPassword: _passwordController.text,
                  hintText: 'Confirm Password',
                  onChange: (e) {
                    setState(() {
                      _confirmPasswordController.text = e;
                    });
                  },
                  controller: _confirmPasswordController,
                  validationText: 'Confrim Password is required',
                ),
                SizedBox(
                  height: 44.h,
                ),
                CustomPrimaryButton(
                    title: 'Register',
                    callBack: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthProvider>().register(context, {
                          'email': _emailController.text,
                          'firstName': _firstNameController.text,
                          'lastName': _lastNameController.text,
                          'phone': _phoneController.text,
                          'password': _passwordController.text
                        }, (e) {
                          setState(() {
                            _loading = e;
                          });
                        });
                      }
                    }),
                SizedBox(
                  height: 34.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already Have an account? ',
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w500),
                    ),
                    InkWell(
                      onTap: () {
                        CustomRouters.routePushWithName(
                            context, AppRouter.login);
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: ColorConst.mainPrimaryColor),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
