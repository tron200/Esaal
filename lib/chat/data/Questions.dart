import 'Answers.dart';

class Questions {
  Questions({
      required this.owner,
      required this.question,
      required this.answers,
      required this.status,});

  Questions.fromJson(dynamic json) {
    owner = json['owner'];
    question = json['question'];
    if (json['answers'] != null) {
      answers = [];
      json['answers'].forEach((v) {
        answers.add(Answers.fromJson(v));
      });
    }
    status = json['status'];
  }
  String owner="";
  String question="";
  List<Answers> answers=[];
  int status=0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['owner'] = owner;
    map['question'] = question;
    if (answers != null) {
      map['answers'] = answers.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    return map;
  }

}