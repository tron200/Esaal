import 'package:es2al/chat/model/question.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:uuid/uuid.dart';

class Course{
  List<QuestionModel> questions=[];
  String name="";
  int id= DateTime.now().millisecondsSinceEpoch;
  String ownerId="";
  String code ="";
  List students = [""];
  Course(this.name,this.ownerId){
   code = Uuid().v1().substring(0,7);
  }

  Course.fromJson(dynamic json, Iterable<DataSnapshot> questions,List<QuestionModel> qshow) {
    if(json == null) return;
    name = json['name'];
    id = json['id'];
    ownerId = json['ownerId'];
    code = json['code'];
    students = json['students'];
    if (json['questions'] != null) {
      int x = 0;
      questions.toList().forEach((v) {
        print(v.value);
        this.questions.add(QuestionModel.fromJson(v.value,qshow.length != 0 && x < qshow.length? qshow[x++].show:false));
      });
      this.questions.sort((a, b) {
        if(a.id > b.id){
          return 1;
        }else{
          return -1;
        }
      },);
    }
  }

  Map<String,dynamic> toJson(){
    Map<String,dynamic> course = Map();
    course['name'] = name;
    course['id'] = id;
    course['ownerId'] = ownerId;
    course['code'] = code;
    course['students'] = students;
    return course;
  }
}