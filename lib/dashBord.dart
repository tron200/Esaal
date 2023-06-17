import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' ;
import '../../chat/data/Globals.dart';

import '../../../MainPage/MainPage.dart';
class DashBoard extends StatefulWidget {
  Function update;
  DashBoard(this.update);
  @override
  State<DashBoard> createState() => _DashBordState();
}

class _DashBordState extends State<DashBoard> {

  @override
  Widget build(BuildContext context) {
    bool isStudent = Globals.typeOfUsers == 0?true:false;
    return Scaffold(
      body: Container(
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
        child: ListView(
          children: [
            const Text("Dashboard", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            isStudent? SizedBox():Image(image: AssetImage("assets/images/teacherDashbord.png")),
            const SizedBox(height: 10,),
            Padding(
             padding: const EdgeInsets.symmetric(horizontal: 30),
             child:  Container(
               padding: const EdgeInsets.symmetric(vertical: 15),
               decoration: BoxDecoration(
                   image:const DecorationImage(image: AssetImage("assets/images/dashboard.png"), fit: BoxFit.cover),
                   borderRadius: BorderRadius.circular(10)
               ),
               child:Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   const SizedBox(width: 5,),
                   Container(
                     height: 50,
                     width: 50,
                     decoration:BoxDecoration(
                         image: const DecorationImage(image: AssetImage("assets/images/blackground.png"), fit: BoxFit.cover),
                         borderRadius: BorderRadius.circular(25)
                     ),
                   ),
                   const SizedBox(width:5,),
                   Expanded(
                     child: Column(
                       children: [
                         Text(
                             "${Globals.user['firstName']} ${Globals.user['lastName']}",
                             style: const TextStyle(color: Color(0xff124559), fontWeight: FontWeight.bold, fontSize: 20)),
                         Text(
                             "${Globals.user['email']}",
                             style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                         Globals.typeOfUsers==0? Text(
                             "${Globals.user['studentId']}",
                             style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)):const Text(""),
                       ],
                     ),
                   ),
                   const SizedBox(width:5,),
                 ],
               ),
             ),
           ),
            const SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                Globals.currentScreenIndex = 2;
                Globals.currentScreen = Globals.routeToIdle;
                widget.update();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  padding: const EdgeInsets.only(top: 30, left: 25,bottom: 30),
                  decoration: BoxDecoration(
                      color: const Color(0xff537989),
                      borderRadius: BorderRadius.circular(25)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("My Courses", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      Text("press on a course button to get course chat", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        // child: Row(
                        //   children: [
                        //     // Text(Globals.user["courses"].toString(), style: TextStyle(fontSize: 20),)
                        //   ],
                        // ),
                      )

                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            isStudent? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10,),
                const Text("Bonus", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),
                _createElement("Java", 5),
              ],
            ): Container(),
          ],
        ),
      ),
    );
  }

  Widget _createElement (String courseName, int  bonus,  ){
    return Padding(
      padding:EdgeInsets.symmetric(horizontal: 20),
      child:  Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
        decoration:  const BoxDecoration(
            color: Color(0xff124559),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(20),
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(courseName, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
            Expanded(child: SizedBox(),),
            Text(bonus==0? "-":"+$bonus", style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }


}
