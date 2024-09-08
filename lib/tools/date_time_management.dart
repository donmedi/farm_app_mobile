import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeManagmentClass {
  static String formattedDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    DateFormat formatter = DateFormat('MMM dd, yyyy');
    return formatter.format(dateTime);
  }

  static String formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  String formatTimeOfDay(TimeOfDay? time) {
    if (time == null) {
      return '';
    }
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    final formattedTime = DateFormat('HH:mm:ss').format(dt);
    return formattedTime;
  }

  static String timeAgoSinceDate(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inSeconds < 60) {
      return 'just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else if (difference.inDays < 30) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return '$months months ago';
    } else {
      final years = (difference.inDays / 365).floor();
      return '$years years ago';
    }
  }

  static String formatDateTimeAgo(String dateTimeString) {
    final dateTime = DateTime.parse(dateTimeString);
    return timeAgoSinceDate(dateTime);
  }

  static String convertToAmPm(String time) {
    // Parse the time string into a DateTime object
    final parsedTime = DateTime.parse("1970-01-01 $time");
    // Format the time to a string with AM/PM
    final formattedTime = DateFormat.jm().format(parsedTime);
    return formattedTime;
  }

  static String calculateDuration(String startTime, String endTime) {
    // Parse the time strings into DateTime objects
    final start = DateTime.parse("1970-01-01 $startTime");
    final end = DateTime.parse("1970-01-01 $endTime");

    // Calculate the difference between the two times
    final duration = end.difference(start);

    // Extract hours and minutes from the duration
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;

    // Return a formatted string
    return '$hours HRS'.trim();
  }

  static String calculateTimeDifference22(String startTime, String endTime) {
    DateFormat dateFormat = DateFormat.jm();

    DateTime startDateTime = dateFormat.parse(startTime);
    DateTime endDateTime = dateFormat.parse(endTime);

    if (endDateTime.isBefore(startDateTime)) {
      endDateTime = endDateTime.add(Duration(days: 1));
    }

    Duration duration = endDateTime.difference(startDateTime);
    return "${duration.inHours} hours and ${duration.inMinutes.remainder(60)} minutes";
  }

  static String formatYearOnly(String strDate) {
    DateTime date = DateTime.parse(strDate);
    return date.year.toString();
  }

  static String formatYearOnlyPresent(String strDate) {
    DateTime date = DateTime.parse(strDate);
    int currentYear = DateTime.now().year;

    if (date.year == currentYear) {
      return "Present";
    } else {
      return date.year.toString();
    }
  }

  // String digitConverter(num number) {
  //   final formatter = NumberFormat('#,##0');
  //   return formatter.format(number);
  // }
}
