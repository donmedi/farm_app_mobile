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

class ExpireyDateInput extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  ExpireyDateInput({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Expiry Date"),
        SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly, // Allow only digits
            LengthLimitingTextInputFormatter(5), // Max 5 characters for MM/YY
            ExpiryDateInputFormatter() // Custom formatter for expiry date
          ],
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Expiry date is required';
            } else if (value.length != 5) {
              return 'Enter a valid expiry date (MM/YY)';
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: 'MM/YY',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}

class ExpiryDateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text.replaceAll("/", ""); // Remove existing slash

    if (newText.length > 4) {
      newText = newText.substring(0, 4); // Restrict to 4 digits (MMYY)
    }

    if (newText.length >= 3) {
      newText =
          newText.substring(0, 2) + '/' + newText.substring(2, newText.length);
    }

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

class CustomNumberInput2 extends StatelessWidget {
  String label;
  TextEditingController controller;
  String hintText;
  String validationText;
  int minLenght;
  CustomNumberInput2(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.label,
      required this.minLenght,
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
            LengthLimitingTextInputFormatter(controller.text.length < minLenght
                ? minLenght
                : controller.text.length),
          ],
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (e) {
            if (controller.text == '') {
              return validationText;
            } else if (controller.text.length < minLenght) {
              return '$label must be $minLenght digit';
            }
            return null;
          },
          onChanged: (e) {
            if (e.length <= minLenght) {}
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
      )
    ]);
  }
}

class CustomFormDisabledInput2 extends StatelessWidget {
  String label;
  TextEditingController controller;
  String valText;
  VoidCallback callBack;
  String? placeHolder;
  CustomFormDisabledInput2(
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
        ),
      )
    ]);
  }
}

class CardNumberFormInput extends StatelessWidget {
  TextEditingController controller;

  CardNumberFormInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Card Number"),
        SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly, // Allow only digits
            LengthLimitingTextInputFormatter(19), // 16 digits + 3 spaces
            CardNumberInputFormatter() // Custom formatter
          ],
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Card number is required';
            } else if (value.replaceAll(" ", "").length != 16) {
              return 'Card number must be 16 digits';
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: '4444 5555 5555 5555',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text.replaceAll(" ", ""); // Remove spaces

    if (newText.length > 16) {
      newText = newText.substring(0, 16); // Restrict to 16 digits
    }

    List<String> parts = [];
    for (int i = 0; i < newText.length; i += 4) {
      parts.add(newText.substring(
          i, i + 4 > newText.length ? newText.length : i + 4));
    }

    final formatted = parts.join(" ");
    return newValue.copyWith(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
