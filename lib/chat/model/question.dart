import 'package:es2al/chat/model/answer.dart';
import 'package:uuid/uuid.dart';

class QuestionModel{
  String id = "${DateTime.now().millisecondsSinceEpoch}";
  String ownerName="";
  String question="";
  int status = 0;
  List<AnswerModel> answers=[];
  bool show=false;
  QuestionModel(this.ownerName, this.question, this.answers, this.show);

  QuestionModel.fromJson(dynamic json,bool qshow) {
    id = json['id'];
    ownerName = json['ownerName'];
    question = json['question'];
    show = qshow;
    status = json['status'];
    if (json['answers'] != null) {
      json['answers'].forEach((k,v) {
        answers.add(AnswerModel.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['ownerName'] = ownerName;
    map['question'] = question;
    map['show'] = false;
    map['status'] = 0; // nka4
    return map;
  }
}