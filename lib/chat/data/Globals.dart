import 'package:es2al/intro/intro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/Course.dart';

class Globals{
  static int typeOfUsers = 1; // 0 student    1: teacher
  static int currentScreenIndex = 1;
  static int currentScreen = 0;
  static Map user = Map();
  static const int routeToIdle = 0;
  static const int routeToCreateCourse = 1;
  static const int routeToChat = 1;
  static const int routeToCourseInfo = 2;
  static Course choosedCourse = Course("", "");

  static Widget globalroute = Scaffold();
  //temps
static String courseName = "",courseFullName = "";
  static int courseId = 0;
  static bool admittedAnswer = false;
}