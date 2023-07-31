import 'package:ecommerce/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class StyleApp{
  static ThemeData lightMode = ThemeData(
      textTheme: TextTheme(
        bodySmall: TextStyle(
            fontFamily: "poppinsLight",
            fontSize: 18.sp,
            color: const Color(0xB2000000),
            fontWeight: FontWeight.w300
        ),
        bodyMedium: TextStyle(
            fontFamily: "poppinsLight",
            fontSize: 18.sp,
            color: const Color(0xff004182),
            fontWeight: FontWeight.w600
        ),
        titleSmall: TextStyle(
            fontFamily: "poppinsLight",
            fontSize: 18.sp,
            color: const Color(0xFFFFFFff),
            fontWeight: FontWeight.w500,
        ),
      )
  );
}
