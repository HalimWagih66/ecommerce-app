import 'package:flutter/material.dart';

import '../core/utils/components/unDefinedScreen.dart';
import '../features/sign_up/presentation/pages/sign_up.dart';

class Routes{
  static const String signUp = "signUp";
}
class AppRoutes{
  static Route onGenerate(RouteSettings routeSettings){
     switch(routeSettings.name){
       case Routes.signUp:
         return MaterialPageRoute(builder: (context) => SignUp());
       default:
         return MaterialPageRoute(builder: (context) => unDefinedScreen());
     }
  }
}
