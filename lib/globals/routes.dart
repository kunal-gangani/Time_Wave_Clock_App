import 'package:flutter/material.dart';
import 'package:clock_app/views/homePage.dart';
class Routes{
  static String myHome = '/';


   static Map<String,WidgetBuilder> myRoutes = {
    myHome : (context) => const HomePage(),
    
  };
}