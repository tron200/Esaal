 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CourseInfo extends StatefulWidget {
  const CourseInfo({Key? key}) : super(key: key);

  @override
  State<CourseInfo> createState() => _CourseInfoState();
}

class _CourseInfoState extends State<CourseInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white,
                  Color(0xff124559),
                ],
              ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Text("Welcome to", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              SizedBox(height: 5,),
              Text("Java course", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              Image(image: AssetImage("assets/images/course_info.png")),
              SizedBox(height: 20,),
              _CreateElement("Students enrolled", "35"),
              SizedBox(height: 20,),
              _CreateElement("course name", "Java"),
              SizedBox(height: 20,),
              _CreateElement("enroll code ", "5247"),
              SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15,),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
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
                      const Text("JS", style: TextStyle(color: Color(0xff49A078),fontWeight: FontWeight.bold, fontSize: 13),),
                      SizedBox(height: 5,),
                      const Text("You have 2 new questions", style: TextStyle( fontSize: 12),),
                      Row(
                        children: [
                          ElevatedButton(
                              onPressed: (){},
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                backgroundColor: const Color(0xff124559),
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(25))
                                ),
                              ),
                              child:Text("Top Answers", style: TextStyle(color: Colors.white, fontSize: 12),)
                          ),
                          const SizedBox(width: 20,),
                          ElevatedButton(
                              onPressed: (){},
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
      )
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
