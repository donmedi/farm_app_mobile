import 'package:farm_loan_app/layout/custom_button.dart';
import 'package:farm_loan_app/layout/custom_form_input.dart';
import 'package:farm_loan_app/tools/helper.dart';
import 'package:farm_loan_app/views/auth_screens/model/authModel.dart';
import 'package:farm_loan_app/views/auth_screens/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateData();
  }

  void updateData() {
    AuthModel? userData = context.read<AuthProvider>().userData;
    setState(() {
      _firstNameController.text = userData?.firstName ?? '';
      _lastNameController.text = userData?.lastName ?? '';
      _emailController.text = userData?.email ?? '';
      _phoneController.text = userData?.phone ?? '';
    });
  }

  final _formKey = GlobalKey<FormState>();

  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Edit Profile',
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: _loading,
        progressIndicator: loader,
        child: SingleChildScrollView(
            padding: EdgeInsets.all(24.sp),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Update Profile',
                    style:
                        TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomFormInput(
                      label: 'First Name',
                      controller: _firstNameController,
                      valText: '',
                      callBack: (e) {}),
                  SizedBox(height: 15.h),
                  CustomFormInput(
                      label: 'Last Name',
                      controller: _lastNameController,
                      valText: '',
                      callBack: (e) {}),
                  SizedBox(height: 15.h),
                  CustomFormDisabledInput2(
                      label: 'Email Address',
                      controller: _emailController,
                      valText: '',
                      callBack: () {}),
                  SizedBox(height: 15.h),
                  CustomFormDisabledInput2(
                      label: 'Phone Number',
                      controller: _emailController,
                      valText: '',
                      callBack: () {}),
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomPrimaryButton(
                      title: 'Submit',
                      callBack: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthProvider>().update_profile(context, {
                            'firstName': _firstNameController.text,
                            'lastName': _lastNameController.text
                          }, (e) {
                            setState(() {
                              _loading = e;
                            });
                          });
                        }
                      })
                ],
              ),
            )),
      ),
    );
  }
}
