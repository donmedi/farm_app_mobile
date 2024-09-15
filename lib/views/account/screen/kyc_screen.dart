import 'dart:convert'; // For Base64 encoding
import 'dart:developer';
import 'dart:io'; // For handling file
import 'package:farm_loan_app/layout/custom_button.dart';
import 'package:farm_loan_app/layout/custom_form_input.dart';
import 'package:farm_loan_app/tools/helper.dart';
import 'package:farm_loan_app/views/auth_screens/provider/auth_provider.dart';
import 'package:farm_loan_app/views/dashboard/services/dashboard_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class KycScreen extends StatefulWidget {
  const KycScreen({super.key});

  @override
  State<KycScreen> createState() => _KycScreenState();
}

class _KycScreenState extends State<KycScreen> {
  bool _loading = false;
  final _formKey = GlobalKey<FormState>();

  TextEditingController _bvn = TextEditingController();
  TextEditingController _nin = TextEditingController();
  TextEditingController _address = TextEditingController();

  XFile? _image;
  String? _base64Image;

//image picker
  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final bytes = await File(image.path).readAsBytes();
      setState(() {
        _image = image;
        _base64Image = base64Encode(bytes);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'KYC Information',
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
                Text('Add KYC',
                    style: TextStyle(
                        fontSize: 24.sp, fontWeight: FontWeight.w700)),
                SizedBox(
                  height: 14.h,
                ),
                Text(
                  'Add KYC information to enjoy full access to the app e.g request and withdrawal',
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 24.h),
                // Image selection and preview
                InkWell(
                  onTap: () {
                    pickImage();
                  }, // Call the image picker when tapping
                  child: CircleAvatar(
                    radius: 50.sp,
                    backgroundImage: _image != null
                        ? FileImage(File(_image!.path)) // Show selected image
                        : null, // Default case if no image is selected
                    child: _image == null
                        ? Icon(Icons.camera_alt, size: 50.sp)
                        : null, // Show camera icon if no image
                  ),
                ),
                SizedBox(height: 15.h),

                // Address Input
                CustomFormInput(
                  label: 'Address',
                  placeHolder: 'Address',
                  controller: _address,
                  valText: 'Address is required',
                  callBack: (e) {},
                ),
                SizedBox(height: 15.h),

                // BVN Input
                CustomNumberInput2(
                  label: 'BVN',
                  controller: _bvn,
                  hintText: 'BVN',
                  validationText: 'BVN is required',
                  minLenght: 11,
                ),
                SizedBox(height: 15.h),

                // NIN Input
                CustomNumberInput2(
                  label: 'NIN',
                  controller: _nin,
                  hintText: 'NIN',
                  validationText: 'NIN is required',
                  minLenght: 11,
                ),
                SizedBox(height: 24.h),

                // Submit Button
                CustomPrimaryButton(
                  title: 'Submit',
                  callBack: () {
                    if (_formKey.currentState!.validate()) {
                      if (_image == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please select an image')),
                        );
                      } else {
                        context.read<AuthProvider>().update_kyc(context, {
                          'image': _base64Image,
                          'address': _address.text,
                          'nin': _nin.text,
                          'bvn': _bvn.text
                        }, (e) {
                          setState(() {
                            _loading = e;
                          });
                        });
                        // Perform the form submission with the base64 image
                        // For example, send the Base64 image to the backend
                        // Use _base64Image for this purpose
                        log('Base64 Image: $_base64Image');
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:farm_loan_app/layout/custom_button.dart';
// import 'package:farm_loan_app/layout/custom_form_input.dart';
// import 'package:farm_loan_app/tools/helper.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// class KycScreen extends StatefulWidget {
//   const KycScreen({super.key});

//   @override
//   State<KycScreen> createState() => _KycScreenState();
// }

// class _KycScreenState extends State<KycScreen> {
//   bool _loading = false;

//   final _formKey = GlobalKey<FormState>();

//   TextEditingController _bvn = TextEditingController();
//   TextEditingController _nin = TextEditingController();
//   TextEditingController _adddress = TextEditingController();

//   late XFile? _image;

//   List _genders = ['Male', 'Female'];

//   Future<void> pickImage() async {
//     final ImagePicker _picker = ImagePicker();
//     // Capture a photo
//     final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
//     if (photo != null) {
//       setState(() {
//         _image = photo;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         title: Text(
//           'Add KYC',
//           style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600),
//         ),
//       ),
//       body: ModalProgressHUD(
//         inAsyncCall: _loading,
//         progressIndicator: loader,
//         child: SingleChildScrollView(
//             padding: EdgeInsets.all(24.sp),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Add KYC',
//                     style:
//                         TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700),
//                   ),
//                   SizedBox(
//                     height: 24.h,
//                   ),
//                   CircleAvatar(
//                     child: Image.memory(bytes),
//                   ),
//                   SizedBox(height: 15.h),
//                   CustomFormInput(
//                       label: 'Address',
//                       controller: _adddress,
//                       valText: 'Address is required',
//                       callBack: (e) {}),
//                   SizedBox(height: 15.h),
//                   CustomNumberInput2(
//                     label: 'BVN',
//                     controller: _bvn,
//                     hintText: 'BVN',
//                     validationText: 'BVN is required',
//                     minLenght: 11,
//                   ),
//                   SizedBox(height: 15.h),
//                   CustomNumberInput2(
//                     label: 'NIN',
//                     controller: _nin,
//                     hintText: 'NIN',
//                     validationText: 'NIN is required',
//                     minLenght: 11,
//                   ),

//                   SizedBox(
//                     height: 24.h,
//                   ),
//                   CustomPrimaryButton(
//                       title: 'Submit',
//                       callBack: () {
//                         if (_formKey.currentState!.validate()) {
//                           // context.read<AuthProvider>().update_profile(context, {
//                           //   'firstName': _firstNameController.text,
//                           //   'lastName': _lastNameController.text
//                           // }, (e) {
//                           //   setState(() {
//                           //     _loading = e;
//                           //   });
//                           // });
//                         }
//                       })
//                 ],
//               ),
//             )),
//       ),
//     );
//   }
// }
