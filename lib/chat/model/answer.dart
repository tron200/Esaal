import 'package:uuid/uuid.dart';

class AnswerModel{
  int id = DateTime.now().millisecondsSinceEpoch;
  int questionId = 0;
  String ownerName="";
  String ownerId="";
  String answer="";
  bool checkBoxValue=false;
  AnswerModel(this.ownerName,this.ownerId,this.questionId,this.answer,this.checkBoxValue);

  AnswerModel.fromJson(dynamic json) {
    id = json['id'];
    questionId = json['questionId'];
    answer = json['answer'];
    ownerId = json['ownerId'];
    checkBoxValue = json['checkBoxValue'];
    ownerName = json['ownerName'];

  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['questionId'] = questionId;
    map['id'] = id;
    map['ownerName'] = ownerName;
    map['ownerId'] = ownerId;
    map['answer'] = answer;
    map['checkBoxValue'] = false;
    return map;
  }
}