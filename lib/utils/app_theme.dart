import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



Color? kPrimaryColor = const Color(0xFFDF1721);
Color? kWhiteColor = const Color(0XFFFFFFFF);
Color? kBlackColor = const Color(0xFF0D0D0D);
Color? kSecondaryColor = const Color(0xFFE2F5F6);
Color? kTealColor = const Color(0XFF28B59D);
Color? kGreyColor = const Color(0xFFE0E0E0);
Color? kOrangeAccentColor = const Color(0xFFFFD0B3);



ThemeData themeData() {

  return ThemeData(

    fontFamily: 'Roboto',

    primaryColor: kBlackColor,
    textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 25.sp,
          //fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: kBlackColor,
        ),
        headline2: TextStyle(
          fontSize: 16.0.sp,
          fontWeight: FontWeight.w600,
          color: kBlackColor,
        ),
        headline3: TextStyle(
        //  fontSize: 14.0,
          fontSize: 16.0.sp,
          fontWeight: FontWeight.w600,
          color: kBlackColor?.withOpacity(0.8),
        ),
        headline4: TextStyle(
        //  fontSize: 16,
          fontSize: 16.0.sp,
          fontWeight: FontWeight.w600,
          color: kWhiteColor,
        ),
        bodyText1: TextStyle(
         // fontSize: 16,
          fontSize: 16.0.sp,
          fontWeight: FontWeight.bold,
          color: kBlackColor?.withOpacity(0.6),
        ),
        bodyText2: TextStyle(
       //   fontSize: 14,
          fontSize: 16.0.sp,
          fontWeight: FontWeight.w600,
          color: kBlackColor?.withOpacity(0.6),
        ),
        subtitle1: TextStyle(
       //   fontSize: 12,
          fontSize: 16.0.sp,
          color: kBlackColor?.withOpacity(0.7),
          fontWeight: FontWeight.bold,
        ),
        subtitle2: TextStyle(
        //  fontSize: 12,
          fontSize: 16.0.sp,
          color: kWhiteColor,
          fontWeight: FontWeight.w600,
        )),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.only(top: 8, left: 12, right: 10),
      labelStyle:  TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      //  fontSize: 18,
        fontSize: 16.0.sp,
      ),
      hintStyle: TextStyle(
        color: kBlackColor?.withOpacity(0.8),
        fontWeight: FontWeight.w500,
       // fontSize: 14,
        fontSize: 16.0.sp,
      ),
      border: InputBorder.none,
    ),
  );
}
