import 'package:farm_loan_app/constant/color_const.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget loader = CircularProgressIndicator(
  color: ColorConst.mainAccentColor,
);

String digitConverterString(String number) {
  // Check if the string is a valid number
  if (checkIsStringNumber(number)) {
    num formattedStr = num.parse(number);
    final formatter = NumberFormat('#,##0');
    return formatter.format(formattedStr);
  } else {
    return '0';
  }
}

bool checkIsStringNumber(str) {
  final numberRegex = RegExp(r'^-?\d+(\.\d+)?$');
  if (!numberRegex.hasMatch(str)) {
    return false;
  } else {
    return true;
  }
}

String capitalize(String input) {
  if (input.isEmpty) return input;
  return input[0].toUpperCase() + input.substring(1);
}
