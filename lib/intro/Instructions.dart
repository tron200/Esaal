import 'package:es2al/auth/view/Profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../chat/data/Globals.dart';

class Instructions extends StatelessWidget {

  bool isTeacher = Globals.typeOfUsers == 1?true:false;
  @override
  Widget build(BuildContext context) {
    String teacherChat1 =
        "*  Es2al chat allows you to see students’ questions and answers and check all answers to choose the most correct ones fromall of them or answer the question by yourself.";
    String teacherChat2=
        "*  Bonus point will be added to the students who help their classmates with the correct answer.";
    String teacherBones =
        "Bonus degrees will be added when the student participate in the answers of questions that asked in the course chat if student's answer was correct and approved by teacher.";
    String studentChat1 =
        "*  EduScience chat allwos you to share your questions and It will be answered by one of your classmates or your teacher.";
    String studentChat2 =
        "*  EduScience chat also allwos you to share your answers and gets bonus points from your teacher in case your answer is right";
    String studentChat3=
    "*  approved answers will get saved in course’s admitted answers";
    String studentBouns =
        "Bonus degrees will be added when you participate in the answers of questions that asked in the course chat if your answer was correct and approved by your teacher... \nGood luck  ";
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white,
                  Color(0xff124559),
                ],
              )
          ),
        padding: EdgeInsets.only(top: 20),
          child: ListView(
            children: [

              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        icon: const  Icon(Icons.arrow_back_ios)),
                    const Text(
                        "Instructions",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Color(0xff537989)),
                      ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                padding: EdgeInsets.all(25),
                decoration:  BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage("assets/images/instrBackg.round.png"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    const Text(
                      "About chat",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Text(
                     isTeacher? teacherChat1: studentChat1,
                        style:const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          height: 2.5,
                        ),
                    ),
                    Text(
                       isTeacher? teacherChat2:studentChat2,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                          height: 2.5,
                        ),
                    ),
                    isTeacher? SizedBox():Text(
                   studentChat3,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                        height: 2.5,
                      ),
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Divider(color: Colors.black, thickness: 1.5),
              ),
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                padding: EdgeInsets.all(25),
                decoration:  BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage("assets/images/blackground.png"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    const Text(
                      "About bonus",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Text(
                      isTeacher? teacherBones: studentBouns,
                      style:const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        height: 2.5,
                      ),
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
