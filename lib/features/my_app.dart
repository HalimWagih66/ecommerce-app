import 'package:ecommerce/core/utils/style_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/routes.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child)
      => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.signUp,
        onGenerateRoute: (settings) => AppRoutes.onGenerate(settings),
        theme: StyleApp.lightMode,
      ),
    );
  }
}