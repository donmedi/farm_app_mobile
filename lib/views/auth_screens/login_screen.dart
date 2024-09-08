import 'dart:developer';

import 'package:farm_loan_app/constant/color_const.dart';
import 'package:farm_loan_app/data/shared_pref_helper.dart';
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

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool loading = false;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateEmail();
  }

  void updateEmail() async {
    var email = await SharedPrefsHelper.getValue('email') ?? '';
    log('email $email');
    if (email != null) {
      setState(() {
        _controller.text = email;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: loading,
      progressIndicator: loader,
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40.h,
                ),
                Center(
                  child: Image.asset(
                    'images/logo.png',
                    height: 250.h,
                    width: 250.w,
                  ),
                ),
                Text(
                  'Discover an easy way to farm and make money',
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomFormInput(
                    placeHolder: 'Enter Email',
                    label: 'Email',
                    controller: _controller,
                    valText: 'Email is required',
                    callBack: (e) {}),
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
                  height: 44.h,
                ),
                CustomPrimaryButton(
                    title: 'Login',
                    callBack: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthProvider>().login(context, {
                          'email': _controller.text,
                          'password': _passwordController.text
                        }, (e) {
                          setState(() {
                            loading = e;
                          });
                        });
                      }
                    }),
                SizedBox(
                  height: 34.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        CustomRouters.routePushWithName(
                            context, AppRouter.forgot_password);
                      },
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w600),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          CustomRouters.routePushWithName(
                              context, AppRouter.register);
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              color: ColorConst.mainPrimaryColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600),
                        )),
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
