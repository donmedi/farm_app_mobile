import 'package:farm_loan_app/constant/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeType {
  static ThemeData light = ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Raleway',
    visualDensity: VisualDensity.standard,
    // iconTheme: IconThemeData(color: Colors.white),
    buttonTheme: ButtonThemeData(
      minWidth: double.maxFinite,
      padding: const EdgeInsets.all(15),
      buttonColor: Colors.grey, // Sets the background color of the button
      textTheme:
          ButtonTextTheme.primary, // Applies the primary button text style
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(8.0), // Sets the border radius of the button
      ),
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        // color: Colors.black87,
        titleTextStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black87)),
    cardTheme: CardTheme(
        elevation: 0.2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    tabBarTheme: TabBarTheme(
        labelColor: ColorConst.mainPrimaryColor,
        unselectedLabelColor: Colors.black45),

    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: ColorConst.mainPrimaryColor,
      hintStyle: TextStyle(
          fontSize: 12.sp,
          // fontStyle: FontStyle.italic,
          color: Color(0xff8D8D8D)),
      contentPadding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 15),
      filled: true,
      fillColor: Colors.transparent,
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0),
          borderRadius: BorderRadius.circular(8.r)),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0),
          borderRadius: BorderRadius.circular(8.r)),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorConst.mainSecondaryRed, width: 0),
          borderRadius: BorderRadius.circular(8.r)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0),
          borderRadius: BorderRadius.circular(8.r)),
    ),
    brightness: Brightness.light, // Set the default theme to light mode
    primarySwatch: Colors.grey,
    // fontFamily: 'Exo2',
  );
  static ThemeData dark = ThemeData(
    visualDensity: VisualDensity.standard,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ColorConst.mainPrimaryColor),
    scaffoldBackgroundColor: ColorConst.mainPrimaryColor,
    appBarTheme: AppBarTheme(
        backgroundColor: ColorConst.mainPrimaryColor,
        iconTheme: IconThemeData(color: Colors.white),
        actionsIconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        )),
    buttonTheme: ButtonThemeData(
      minWidth: double.maxFinite,
      padding: const EdgeInsets.all(15),
      buttonColor: ColorConst
          .mainPrimaryColor, // Sets the background color of the button
      textTheme:
          ButtonTextTheme.primary, // Applies the primary button text style
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(8.0), // Sets the border radius of the button
      ),
    ),
    brightness: Brightness.dark, // Set the dark theme
    primarySwatch: Colors.blue,
    cardColor: const Color(0xff26262b),
    cardTheme: CardTheme(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: ColorConst.mainPrimaryColor,
      contentPadding: const EdgeInsets.all(10),
      hintStyle: TextStyle(fontSize: 12.sp),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffD9DDE2), width: 1),
          borderRadius: BorderRadius.circular(5.r)),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffD9DDE2), width: 1),
          borderRadius: BorderRadius.circular(5.r)),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorConst.mainPrimaryColor, width: 1),
          borderRadius: BorderRadius.circular(5.r)),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffD9DDE2), width: 1),
          borderRadius: BorderRadius.circular(5.r)),
    ),
  );
}
