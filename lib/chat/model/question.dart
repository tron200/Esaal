import 'package:es2al/chat/model/answer.dart';

class QuestionModel{
  String ownerName;
  String question;
  List<AnswerModel> answers;
  bool show;
  QuestionModel(this.ownerName, this.question, this.answers, this.show);
}