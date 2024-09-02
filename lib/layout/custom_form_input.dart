import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFormInput extends StatelessWidget {
  String label;
  TextEditingController controller;
  String valText;
  Function callBack;
  String? placeHolder;
  CustomFormInput(
      {super.key,
      required this.label,
      this.placeHolder,
      required this.controller,
      required this.valText,
      required this.callBack});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(label ?? ''),
      SizedBox(
        height: 5,
      ),
      TextFormField(
        onChanged: (e) {
          callBack(e);
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '\u{26A0}${valText}';
          }
          return null;
        },
        controller: controller,
        style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
        decoration: InputDecoration(hintText: placeHolder ?? ''),
      )
    ]);
  }
}

class CustomPhoneInput extends StatelessWidget {
  String label;
  TextEditingController controller;
  String hintText;
  String validationText;

  CustomPhoneInput(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.label,
      required this.validationText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          // style: TextStyle(fontSize: 12.sp),
        ),
        SizedBox(
          height: 8.h,
        ),
        TextFormField(
          controller: controller,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9+]')),
          ],
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (e) {
            if (controller.text == '') {
              return validationText;
            }
            return null;
          },
          style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.call),
              // fillColor: ColorConstant.inputBgGrey,
              hintText: hintText),
        ),
      ],
    );
  }
}

class CustomNumberInput extends StatelessWidget {
  String label;
  TextEditingController controller;
  String hintText;
  String validationText;
  String minAmount;
  CustomNumberInput(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.label,
      required this.minAmount,
      required this.validationText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          // style: TextStyle(fontSize: 12.sp),
        ),
        SizedBox(
          height: 8.h,
        ),
        TextFormField(
          controller: controller,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9+]')),
          ],
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (e) {
            if (controller.text == '') {
              return validationText;
            } else if (num.parse(minAmount) > num.parse(controller.text)) {
              return 'Min amount is ${minAmount}';
            }
            return null;
          },
          style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
          decoration: InputDecoration(
              // prefixIcon: Icon(Icons.call),
              // fillColor: ColorConstant.inputBgGrey,
              hintText: hintText),
        ),
      ],
    );
  }
}

class CustomPasswordConfirm extends StatefulWidget {
  String label;
  TextEditingController controller;
  String mainPassword;
  String hintText;
  String validationText;
  Function onChange;
  CustomPasswordConfirm(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.label,
      required this.mainPassword,
      required this.onChange,
      required this.validationText});

  @override
  State<CustomPasswordConfirm> createState() => _CustomPasswordConfirmState();
}

class _CustomPasswordConfirmState extends State<CustomPasswordConfirm> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(fontSize: 13.sp),
        ),
        SizedBox(
          height: 8.h,
        ),
        TextFormField(
          controller: widget.controller,
          validator: (e) {
            if (widget.controller.text != widget.mainPassword) {
              return 'Password does not match';
            } else if (widget.controller.text == '') {
              return 'Confirm password is required';
            }
            return null;
          },
          onChanged: (e) => widget.onChange(e),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: _isObscure,
          decoration: InputDecoration(
              // fillColor: ColorConstant.inputBgGrey,
              suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                  child: Icon(
                    _isObscure ? FeatherIcons.eye : FeatherIcons.eyeOff,
                    size: 20,
                    color: const Color(0xff8D8D8D),
                  )),
              hintText: widget.hintText),
        ),
      ],
    );
  }
}

class CustomBasicPassword extends StatefulWidget {
  String label;
  TextEditingController controller;
  String hintText;
  String validationText;
  CustomBasicPassword(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.label,
      required this.validationText});

  @override
  State<CustomBasicPassword> createState() => _CustomBasicPasswordState();
}

class _CustomBasicPasswordState extends State<CustomBasicPassword> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(fontSize: 13.sp),
        ),
        SizedBox(
          height: 8.h,
        ),
        TextFormField(
          controller: widget.controller,
          validator: (e) {
            if (widget.controller.text == '') {
              return widget.validationText;
            }
            return null;
          },
          obscureText: _isObscure,
          decoration: InputDecoration(
              // fillColor: ColorConstant.inputBgGrey,
              suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                  child: Icon(
                    _isObscure ? FeatherIcons.eye : FeatherIcons.eyeOff,
                    size: 20,
                    color: const Color(0xff8D8D8D),
                  )),
              hintText: widget.hintText),
        ),
      ],
    );
  }
}

class CustomFormDisabledInput extends StatelessWidget {
  String label;
  TextEditingController controller;
  String valText;
  VoidCallback callBack;
  String? placeHolder;
  CustomFormDisabledInput(
      {super.key,
      required this.label,
      this.placeHolder,
      required this.controller,
      required this.valText,
      required this.callBack});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(label),
      SizedBox(
        height: 5,
      ),
      TextFormField(
        onTap: () {
          callBack.call();
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '\u{26A0}${valText}';
          }
          return null;
        },
        readOnly: true,
        controller: controller,
        style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
            hintText: placeHolder ?? '',
            suffixIcon: Icon(FeatherIcons.chevronDown)),
        //   contentPadding: EdgeInsets.symmetric(horizontal: 5.sp),
        //   prefix: SizedBox(width: 10),
        //   hintStyle: TextStyle(fontSize: 12.sp, color: Colors.black45),
        //   filled: true,
        //   fillColor: Color(0xffFffffff),
        //   errorStyle: TextStyle(
        //     fontSize: 12.sp,
        //   ),
        //   focusedErrorBorder: OutlineInputBorder(
        //       borderSide: BorderSide(color: Color(0xffD9DDE2), width: 1),
        //       borderRadius: BorderRadius.circular(5.r)),
        //   enabledBorder: OutlineInputBorder(
        //       borderSide: BorderSide(color: Color(0xffD9DDE2), width: 1),
        //       borderRadius: BorderRadius.circular(5.r)),
        //   errorBorder: OutlineInputBorder(
        //       borderSide: BorderSide(color: mainSecondaryRed, width: 1),
        //       borderRadius: BorderRadius.circular(5.r)),
        //   focusedBorder: OutlineInputBorder(
        //       borderSide: BorderSide(color: Color(0xffD9DDE2), width: 1),
        //       borderRadius: BorderRadius.circular(5.r)),
        // ),
      )
    ]);
  }
}
