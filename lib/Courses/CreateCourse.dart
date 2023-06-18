import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../chat/data/Globals.dart';
import '../chat/model/Course.dart';

class CreateCourse extends StatefulWidget {
  Function update;

  CreateCourse(this.update);

  @override
  State<CreateCourse> createState() => _CreateCourseState();
}

class _CreateCourseState extends State<CreateCourse> {
  late String title;
  late String hint;
  late String button;
  late bool isStudent;
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    switch (Globals.typeOfUsers) {
      case 0: //student
        title = "Enroll Course";
        hint = "Course Code";
        button = "Enroll";
        isStudent = true;
        break;
      case 1: //Doctor
        title = "Create Course";
        hint = "Course Name";
        button = "Create";
        isStudent = false;
    }

    super.initState();
  }

  Future<void> addCourse(Course course) async {
    print(course.id);
    DatabaseReference ref = FirebaseDatabase.instance.ref("subs/${course.id}");
    ref.keepSynced(true);
    print(course.toJson());
    await ref.set(course.toJson()).then((value){
      print("Done");
    });
    print(course.toJson());
  }

  @override
  Widget build(BuildContext context) {
    print(Globals.typeOfUsers);
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Row(children: [
            //back button
            GestureDetector(
                onTap: () {
                  Globals.currentScreen = Globals.routeToIdle;
                  widget.update();
                },
                child: Icon(Icons.arrow_back_ios)),
            SizedBox(width: 10),
            //create Course
            Text(title, style: TextStyle( fontSize: 16))
          ]),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(child: Container()),
                      Image.asset("assets/images/person.png")
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        // gradient: const LinearGradient(colors: [
                        //   Color.fromRGBO(217, 217, 217, 0.6),
                        //   Color.fromRGBO(217, 217, 217, 0.4),
                        // ]),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(color: Colors.white24, spreadRadius: 1.5)
                        ]),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //course
                        Text("    You’re currently signed in as  ", textAlign: TextAlign.start ,style: TextStyle( fontSize: 17, fontWeight: FontWeight.w500),),
                       SizedBox(height: 5,),
                        ListTile(
                          leading: Image(image: AssetImage(isStudent? "assets/images/studentImage.png":"assets/images/teacherImage.png")),
                          title: Text("${Globals.user['firstName']} ${Globals.user['lastName']}"),
                          subtitle: Text(Globals.user['email']),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          width: double.infinity,
                          child: TextField(
                            controller: _controller,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(width: 1.5,color: Color(0xff124559)),
                                ) ,
                                hintText: hint,
                                hintStyle: TextStyle(color: Color(0xff124559), fontFamily: "Poppins")  ,
                                filled: true,
                                fillColor: Color(0xffD9D9D9)),
                          ),
                        ),
                        Center(
                          child: ElevatedButton(
                              onPressed: () async {
                                if (_controller.text.isNotEmpty) {
                                  if (Globals.typeOfUsers == 1) {
                                    await addCourse(Course(
                                        _controller.text, Globals.user['id']))
                                        .then((value) {
                                      //inform user

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content:
                                        Text("${_controller.text} Added !"),
                                      ));
                                      //return to idle
                                      Globals.currentScreen = Globals.routeToIdle;
                                      widget.update();
                                    });
                                  } else {
                                    await enrollCourse(_controller.text).then((value){
                                      Globals.currentScreen = Globals.routeToIdle;
                                      widget.update();
                                      setState(() {

                                      });
                                    });
                                  }
                                }
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStatePropertyAll(Color(0xff124559)),
                                  elevation: MaterialStatePropertyAll(7),
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(10)))),
                              child: Text("  $button  ")),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> enrollCourse(String courseCode) async {
    int CourseId = 0;
    bool courseFound = false;

    //check if course found
    final coursesJson = FirebaseDatabase.instance.ref('subs');
    await coursesJson.get().then((value) async {
        for(var v in value.children) {
          print((v.value! as dynamic)['code']);
          if ((v.value! as dynamic)['code'] == courseCode) {
            courseFound = true;
            CourseId = (v.value! as dynamic)['id'];
            print("done  $courseFound");
          }
          if (courseFound) {
            courseFound = false;
            print("hi");
            // add student id to course
            var course = FirebaseDatabase.instance.ref('subs/$CourseId');
            await course.get().then((value) async {
              if(!((value.value! as dynamic)['students']as List).contains(Globals.user['id'].toString())){
                  List students = <String>[...(value.value! as dynamic)['students'],
                    Globals.user['id'].toString()
                  ];
                  await course.update({
                    'students': students,
                    '${Globals.user['id']}':0,
                  });
                  // add course Id to Student
                  var ref = FirebaseFirestore.instance.collection("Users").doc(
                      Globals.user['id']);
                  await ref.get().then((value) async {
                    List courses = value.data()!['courses'];
                    courses.add(CourseId);
                    await ref.update({
                      'courses': courses,
                      '$CourseId':0,
                    });
                  });

                  var user = FirebaseFirestore.instance.collection("Users").doc(Globals.user['id']);
                  await user.get().then((value){
                    Globals.user = value.data() as Map;
                    print(Globals.user);
                  });
                  return;
            }else{
                // you are already in
              }
              });

          }
        }
      });

  }
}
