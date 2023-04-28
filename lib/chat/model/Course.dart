import 'package:es2al/chat/model/answer.dart';
import 'package:es2al/chat/model/question.dart';
import 'package:firebase_database/firebase_database.dart';

class Course{
  List<QuestionModel> questions=[];
  bool show=false;
  Course(this.questions);

  Course.fromJson(dynamic json, Iterable<DataSnapshot> questions,List<QuestionModel> qshow) {
    if (json != null) {
      int x = 0;
      questions.toList().forEach((v) {
        print(v.value);
        this.questions.add(QuestionModel.fromJson(v.value,qshow.length != 0? qshow[x++].show:false));
      });
    }
  }
}