import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:es2al/chat/model/question.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CourseInfoSt extends StatefulWidget {
  String courseName = "";
  String courseTeacher = "";
  CourseInfoSt(this.courseName, this.courseTeacher);

  @override
  State<CourseInfoSt> createState() => _CourseInfoStState();
}

class _CourseInfoStState extends State<CourseInfoSt> {

  @override
  void initState() {
    _getName();
    super.initState();
  }

  _getName() async {
    await FirebaseFirestore.instance.collection("Users").doc(widget.courseTeacher).get().then((value){
      widget.courseTeacher = (value.data() as dynamic)['firstName'] + (value.data() as dynamic)['firstName'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            width: double.infinity,
            decoration: const BoxDecoration(gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                Color(0xff124559),
              ],
            )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios), alignment: Alignment.bottomLeft,),
                const SizedBox(height: 5,),
                const Text("Welcome to ", style: TextStyle(color: Color(0xff537989), fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Times New Roman"),),
                Text("${widget.courseName}  Course", style: const TextStyle(color: Color(0xff537989), fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Times New Roman")),
                SizedBox(height: 50,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        image: AssetImage("assets/images/dashboard.png"),
                        fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children:  [
                      Row(
                        children:const [
                           Text("Course’s teacher", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, ),),
                            Expanded(child: SizedBox()),
                        ],
                      ),
                      const Image(image: AssetImage("assets/images/teacherImage.png")),
                      Text(widget.courseTeacher, style: const TextStyle(fontWeight: FontWeight.bold),),],
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),

                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Colors.white,
                                      Color(0xff537989)
                                    ]
                                )
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 22,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 80.0),
                                  child: Text(widget.courseName, style: TextStyle(fontWeight: FontWeight.w500,fontSize: 25),),
                                ),
                                SizedBox(height: 20,),
                                ],
                            ),
                          ),
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 2),
                        padding: EdgeInsets.all(25),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff376274)
                        ),
                        child: Text(widget.courseName.toUpperCase().substring(0,2),style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 20) ,),
                      ),
                      Positioned(
                          right: 30,
                          top: 15,
                          child: ElevatedButton(
                            onPressed: (){
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => );
                            },
                            child: const Text("Go to Chat"),
                            style: ButtonStyle(
                                backgroundColor:
                                MaterialStatePropertyAll(Color(0xff124559)),
                                elevation: MaterialStatePropertyAll(7),
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(10)))),
                          ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          )
      ),
    );
  }
}
