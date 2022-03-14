import 'package:bullshit/screens/home_screen.dart';
import 'package:bullshit/screens/show_todo_screen.dart';
import 'package:bullshit/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashScreen = "/";
  static const String homeScreen = "/homeScreen";
  static const String showTodoScreen = "/showTodoScreen";

  static Map<String, Widget Function(BuildContext)> routes = {
    splashScreen: (context) => const SplashScreen(),
    homeScreen: (context) => const HomeScreen(),
    showTodoScreen: (context) => const ShowTodoScreen()
  };
}
