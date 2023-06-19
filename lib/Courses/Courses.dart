import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:es2al/Courses/CourseInfo.dart';
import 'package:es2al/Courses/CourseInfoSt.dart';
import 'package:es2al/chat/data/Globals.dart';
import 'package:es2al/chat/model/Course.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Courses extends StatefulWidget {
  Function update;
  Courses(this.update);


  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  List<Course> courses =[];
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    _getCourses().then((value){
      widget.update;
    });
    super.initState();
  }
  String searchName = "";
  @override
  Widget build(BuildContext context) {
    return Container(
              color: Colors.transparent,
              child: Container(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("  Courses",style: TextStyle(fontSize: 30,color: Color(0xff537989),fontWeight: FontWeight.bold),),
                    SizedBox(height: 5,),
                    Expanded(
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Color(0xff7594a1),
                            borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.white24,
                                spreadRadius: 1.5)
                              ]
                          ),
                          width: double.infinity,
                          child: Column(
                            children: [
                              TextField(
                                onChanged: (value) => setState(() {
                                  searchName = value;
                                }),
                                controller: controller,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xffd9d9d9),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)
                                  ),
                                  prefixIcon: Icon(Ionicons.ios_search)
                                ),
                              ),
                              SizedBox(height: 10,),
                              //course
                              Expanded(
                                  child: ListView.builder(
                                      itemBuilder: (context, index) {
                                          if(courses[index].name.toLowerCase().contains(searchName.toLowerCase())){
                                            return Coure(courses[index]);
                                          }else{
                                            return Container();
                                          }
                                        },
                                    itemCount: courses.length,
                                  )
                              )
                            ],
                          ),
                        )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15,top: 10),
                      child: Row(
                        children: [
                          Text(Globals.typeOfUsers == 1?"Create a new course":"Enroll a new course",style: TextStyle(color: Colors.white, fontSize: 15),),
                          Expanded(
                              child: Container()
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStatePropertyAll(CircleBorder()),
                              backgroundColor: MaterialStatePropertyAll(Color(0xffd6dfe3)),
                              foregroundColor: MaterialStatePropertyAll(Color(0xff90a2be))
                            ),
                              onPressed: (){
                                //addCourse(Course("course 1", "#123"));
                                Globals.currentScreen = Globals.routeToCreateCourse;
                                widget.update();
                              },
                              child: Icon(Icons.add)
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
        );
  }


  Future<void> _getCourses() async {
    await FirebaseFirestore.instance.collection("Users").doc(Globals.user['id']).get().then((value) async {
      Globals.user = value.data() as dynamic;

    final DatabaseReference coursesJson = FirebaseDatabase.instance.ref('subs');
     await coursesJson.get().then((v) {
       print(v.value);
       for(var x in v.children) {
         if (Globals.typeOfUsers == 1) {
           if ((x.value! as dynamic)['ownerId'] == Globals.user['id']) {
             courses.add(Course.fromJson(x.value, [], []));
           }
         } else {
           // student

           if ((Globals.user['courses'] as List).contains(
               (x.value! as dynamic)['id'])) {
             courses.add(Course.fromJson(x.value, [], []));
           }
         }
       }
       setState(() {

       });
      });

    });
  }

  Coure(Course course) {
    return GestureDetector(
      onTap: () {
        Globals.choosedCourse = course;
        if(Globals.typeOfUsers == 0){
          Navigator.push(context, MaterialPageRoute(builder: (context) =>   CourseInfoSt(course.name, course.ownerId) )).then((value){

            widget.update();
          });
        }else {
          Globals.currentScreen = Globals.routeToCourseInfo;
        }
        widget.update();
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        height: 120,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50)
          ),
          elevation: 3,
          child: Stack(
            fit: StackFit.expand,
            children: [
              FittedBox(
                fit: BoxFit.fill,
                child: Image.asset("assets/images/course3.png"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
                child: Text("${course.name}",style: TextStyle(color: Colors.white,fontSize: 25, fontWeight: FontWeight.w900),),
              )
            ],
          ),
        ),
      ),
    );
  }
}