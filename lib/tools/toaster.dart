import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart'; // Ensure you have the correct import for the toastification package

void showToast({
  required BuildContext context,
  required ToastificationType type,
  required String title,
  required String description,
}) {
  toastification.show(
    // context: context,
    type: type,
    style: ToastificationStyle.fillColored,
    autoCloseDuration: const Duration(seconds: 5),
    title: Text(
      title,
      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
    ),
    description: Text(
      description,
      style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
    ),
    showProgressBar: false,
  );
}

class NotificationClass {
  static void showSuccessToast(
      BuildContext context, String title, String description) {
    showToast(
      context: context,
      type: ToastificationType.success,
      title: title,
      description: description,
    );
  }

  static void showFailedToast(
      BuildContext context, String title, String description) {
    showToast(
      context: context,
      type: ToastificationType.error,
      title: 'Error',
      description: description,
    );
  }

  static void showWarningToast(
      BuildContext context, String title, String description) {
    showToast(
      context: context,
      type: ToastificationType.warning,
      title: title,
      description: description,
    );
  }
}
