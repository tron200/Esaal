import 'package:custom_navigation_bar/custom_navigation_bar.dart';
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
    _getCourses();
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
                          Text("Create a new course",style: TextStyle(color: Colors.white),),
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


  void _getCourses() {
    final DatabaseReference coursesJson = FirebaseDatabase.instance.ref('subs');
    coursesJson.keepSynced(true);
    coursesJson.onValue.listen((DatabaseEvent event) {
      var data = event.snapshot.value;
      print(data);
      event.snapshot.children.toList().forEach((v) {
        this.courses.add(Course.fromJson(v.value,[],[]));
      });
      this.courses = courses;
      if(!mounted) return;
      setState(() {});
    });
  }

  Coure(Course course) {
    return Container(
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
              child: Image.asset('assets/images/course.png'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
              child: Text("${course.name}",style: TextStyle(color: Colors.white,fontSize: 25, fontWeight: FontWeight.w900),),
            )
          ],
        ),
      ),
    );
  }

}
