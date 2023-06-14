import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' ;
import '../../chat/data/Globals.dart';

import '../../../MainPage/MainPage.dart';
class StudentCourseInfo extends StatelessWidget {
  const StudentCourseInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white, Color(0xff124559)],
            )
        ),
        child: ListView(
          children: [
            IconButton(icon: const  Icon(Icons.arrow_back_ios), onPressed: (){},),
            const Text("Java Students", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),),
            const SizedBox(height: 5,),
            const Text(
              "You can know who enrolled , see their bonus and delete any student",
              style:TextStyle(fontSize: 15, fontWeight: FontWeight.bold) ,),
            SizedBox(height: 10,),
            SizedBox(height: 5,),
            _createElement("Ahmed Mohamed", "1827245", 50),
            SizedBox(height: 5,),
            _createElement("Omar Mohamed", "1827237", 0),

          ],
        ),
      ),
    );
  }

  Widget _createElement (String studentName, String studentID, int bonus){
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                color: Color(0xff49A078),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20)
                )
              ),
              child: Row(
                children: [
                  Column(
                    children:[
                      Text(studentName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                      Text(studentID, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                    ],
                  ),
                  SizedBox(width: 30,),
                  Text(bonus==0? "" : "+$bonus", style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                  SizedBox(width: 10,),
                ],
              ),
            ),
            Expanded(child: SizedBox()),
            IconButton(onPressed: (){}, icon: const Icon(Icons.dangerous_outlined)),
          ],
        ),
        const Divider(color: Colors.black,thickness: 1, height: 10)
      ],
    );
  }
}
