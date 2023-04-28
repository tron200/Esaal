import 'package:uuid/uuid.dart';

class AnswerModel{
  String id = Uuid().v1();
  String questionId = "";
  String ownerName="";
  String answer="";
  bool checkBoxValue=false;
  AnswerModel(this.ownerName,this.questionId,this.answer,this.checkBoxValue);

  AnswerModel.fromJson(dynamic json) {
    id = json['id'];
    questionId = json['questionId'];
    answer = json['answer'];
    checkBoxValue = json['checkBoxValue'];
    ownerName = json['ownerName'];

  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['questionId'] = questionId;
    map['id'] = id;
    map['ownerName'] = ownerName;
    map['answer'] = answer;
    map['checkBoxValue'] = false;
    return map;
  }
}