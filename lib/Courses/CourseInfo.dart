 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../chat/data/Globals.dart';

class CourseInfo extends StatefulWidget {
  Function update;
  int studentNumbers;
  String courseName;
  String enrollCode;
  CourseInfo(this.update,this.studentNumbers,this.courseName, this.enrollCode);
  @override
  State<CourseInfo> createState() => _CourseInfoState();
}

class _CourseInfoState extends State<CourseInfo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          color: Colors.transparent,
          child: ListView(
            children:[
              Text("Welcome to ${widget.courseName} course", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              SizedBox(
                height: 110,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image(image: AssetImage("assets/images/course_info.png")),
                ),
              ),
              SizedBox(height: 20,),
              _CreateElement("Students enrolled", "${widget.studentNumbers}"),
              SizedBox(height: 20,),
              _CreateElement("course name", "${widget.courseName}"),
              SizedBox(height: 20,),
              _CreateElement("enroll code ", "${widget.enrollCode}"),
              SizedBox(height: 20,),
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration:  BoxDecoration(
                        gradient:const LinearGradient(
                          colors: [Color(0xffFFFFFF),Color(0xff537989)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35),
                            child: Text("   ${widget.courseName.substring(0,2).toUpperCase()}", style: TextStyle(color: Color(0xff49A078),fontWeight: FontWeight.bold, fontSize: 13),),
                          ),
                          SizedBox(height: 20,),
                          Row(

                            children: [
                              ElevatedButton(
                                  onPressed: (){
                                    Globals.admittedAnswer = true;
                                    Globals.currentScreen = Globals.routeToChat;
                                    Globals.currentScreenIndex = 1;
                                    widget.update();
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                    backgroundColor: const Color(0xff124559),
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(25))
                                    ),
                                  ),
                                  child:Text("Admitted Answers", style: TextStyle(color: Colors.white, fontSize: 12),)
                              ),
                              const SizedBox(width: 20,),
                              ElevatedButton(
                                  onPressed: (){
                                    Globals.admittedAnswer = false;
                                    Globals.currentScreen = Globals.routeToChat;
                                    Globals.currentScreenIndex = 1;
                                    widget.update();
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                    backgroundColor: const Color(0xff124559),
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(25))
                                    ),
                                  ),
                                  child:Text("Go to chat", style: TextStyle(color: Colors.white, fontSize: 12,fontWeight: FontWeight.bold),)
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff376274)
                      ),
                      child: Text("${Globals.choosedCourse.name.substring(0,2)}",style:TextStyle(color: Color(0xffFFA500),shadows: [

                      ],fontWeight: FontWeight.w900, fontSize: 20) ,
                    ),
                  )
                ],
              ),
              SizedBox(height: 25,),
              Center(
                child: ElevatedButton(
                    onPressed: (){},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                      backgroundColor: const Color(0xff124559),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25))
                      ),
                    ),
                    child:Text("delete", style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold),)
                ),
              ),
        ],
          ),
        ),
    );
  }

  Widget _CreateElement(String info, String data){
    return Container(
      padding: EdgeInsets.all(20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff124559),
            Color(0xff537989),
          ],
        ),
      ),
      child: Row(
          children: [
            Text(info, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),),
            SizedBox(width: 10,),
            Text(data, style: const TextStyle(color: Color(0xffFFA500), fontWeight: FontWeight.bold, fontSize: 15),),
          ],
      ),
    );
  }

}
