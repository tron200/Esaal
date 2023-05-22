import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:es2al/Courses/CourseInfo.dart';
import 'package:es2al/Courses/CreateCourse.dart';
import 'package:es2al/chat/Choose%20Chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../Courses/Courses.dart';
import '../auth/view/Profile.dart';
import '../chat/chat.dart';
import '../chat/data/Globals.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    Globals.currentScreenIndex = 0;
    Globals.currentScreen = 0;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBack,
      child: Scaffold(
          body: SafeArea(
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white,
                        Color(0xff124559),
                      ],
                    )
                ),
                child: Container(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Expanded(child:
                      _ChoosePage()
                      ),
                      _buildFloatingBar()
                    ],
                  ),
                ),
              ),
            ),
          ),
    );
  }
  Widget _buildFloatingBar() {
    return CustomNavigationBar(
      iconSize: 30.0,
      selectedColor: Color(0xff49A078),
      strokeColor: Color(0xff49A078),
      unSelectedColor: Colors.grey[600],
      backgroundColor: Colors.white,
      borderRadius: Radius.circular(40.0),
      items: [
        CustomNavigationBarItem(
          icon: Icon(
            AntDesign.appstore_o,
          ),
        ),
        CustomNavigationBarItem(
          icon: Icon(
            Ionicons.ios_chatbubbles,

          ),
        ),
        CustomNavigationBarItem(
          icon: Icon(
            MaterialCommunityIcons.telescope,
          ),
        ),
        CustomNavigationBarItem(
          icon: Icon(
            AntDesign.user,
          ),
        ),
      ],
      currentIndex: Globals.currentScreenIndex,
      onTap: (index) {
        Globals.currentScreenIndex = index;
        Globals.currentScreen = Globals.routeToIdle;
        setState(() {

        });
      },
      isFloating: true,
    );
  }
  disappearKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void update() {
    setState((){});
  }

  _ChoosePage(){
    switch(Globals.currentScreenIndex){
      case 1:
        switch(Globals.currentScreen){
          case Globals.routeToIdle:
            return ChooseChat(update);

          case Globals.routeToChat:
            return Chat(update);

        }
        break;

      case 2:
        switch(Globals.currentScreen){
          case Globals.routeToIdle:

            return Courses(update);

          case Globals.routeToCreateCourse:
            return CreateCourse(update);

          case Globals.routeToCourseInfo:
            return CourseInfo(update,Globals.choosedCourse.students.length - 1, Globals.choosedCourse.name, Globals.choosedCourse.code);
        }
        break;
      case 3:
        return Profile();
        break;
    }
    print("${Globals.currentScreenIndex}         ${Globals.currentScreen}");
    return Container(
      child: Text("error"),
    );
  }

  Future<bool> _onBack() {
    if(Globals.currentScreen != Globals.routeToIdle){
      Globals.currentScreen = Globals.routeToIdle;
      setState(() {

      });
      return Future.value(false);
    }else if(Globals.currentScreenIndex != 0){
      Globals.currentScreenIndex = 0;
      setState(() {

      });
      return Future.value(false);
    }
    return Future.value(true);
  }


}

// Scaffold(
// body: SafeArea(
// child: Container(
// decoration: const BoxDecoration(
// gradient: LinearGradient(
// begin: Alignment.topLeft,
// end: Alignment.bottomRight,
// colors: [
// Colors.white,
// Color(0xff124559),
// ],
// )
// ),
// child: Container(
// padding: EdgeInsets.all(12),
// child: Column(
// children: [
// Expanded(child:
// _ChoosePage()
// ),
// _buildFloatingBar()
// ],
// ),
// ),
// ),
// ),
// ),
