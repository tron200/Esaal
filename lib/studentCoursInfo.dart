import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' ;
import '../../chat/data/Globals.dart';

import '../../../MainPage/MainPage.dart';

class StudentCourseInfo extends StatefulWidget{

    List students;
    StudentCourseInfo(this.students);
    // TODO: implement createState
    @override
    State<StudentCourseInfo> createState() => _StudentCourseInfo();



}
class _StudentCourseInfo extends State<StudentCourseInfo> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.white, Color(0xff124559)],
              )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(icon: const  Icon(Icons.arrow_back_ios), onPressed: (){
                Navigator.pop(context);
              },alignment: Alignment.centerLeft),
              const Text("Java Students", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),),
              const SizedBox(height: 5,),
              const Text(
                "You can know who enrolled , see their bonus and delete any student",
                style:TextStyle(fontSize: 15, fontWeight: FontWeight.bold) ,),
              SizedBox(height: 10,),
              SizedBox(height: 5,),
              Expanded(
                child: ListView.builder(itemBuilder: (context, index) => _createElement(index),
                itemCount: widget.students.length,),
              )


            ],
          ),
        ),
      ),
    );
  }

  Widget _createElement (index){
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
                      Text("${widget.students[index]['firstName']} ${widget.students[index]['lastName']}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                      Text(widget.students[index]['studentId'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                    ],
                  ),
                  SizedBox(width: 30,),
                  Text("+${widget.students[index]['${Globals.choosedCourse.id}']}", style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                  SizedBox(width: 10,),
                ],
              ),
            ),
            Expanded(child: SizedBox()),
            IconButton(onPressed: (){deleteStudent(index);}, icon: const Icon(Icons.dangerous_outlined)),
          ],
        ),
        const Divider(color: Colors.black,thickness: 1, height: 10),
        SizedBox(height: 5,),
      ],
    );
  }

  deleteStudent(index) async {
    final ref1 = FirebaseDatabase.instance.ref("subs/${Globals.choosedCourse.id}/students");
    await ref1.get().then((value){
      print(value.value);
      int x = 0;
      value.children.forEach((element) async {
        x++;
        print(element);
        if(element.value == widget.students[index]["id"]){
          print(x);
          final temp =  FirebaseDatabase.instance.ref("subs/${Globals.choosedCourse.id}/students/${x-1}");
          await temp.remove();
        }
      });
    });
    final ref = FirebaseFirestore.instance.collection("Users").doc(widget.students[index]['id']);
    await ref.get().then((value) async {
      List courses = (value.data() as dynamic)['courses'];
      courses.remove(Globals.choosedCourse.id);
      await ref.update({
        'courses': courses
      }).then((value) {
        widget.students.removeAt(index);
        setState(() {

        });
      });

    });
  }

}