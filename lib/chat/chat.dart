import 'package:es2al/chat/model/question.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'data/Globals.dart';
import 'model/Course.dart';
import 'model/answer.dart';

class Chat extends StatefulWidget {
  Function update;
  Chat(this.update);

  @override
  State<Chat> createState() => _State();
}

class _State extends State<Chat> {
  late int courseId;
  int typeOfUser = Globals.typeOfUsers; //0 : student  1 : Doctor  2: Admitted Questions
  late String me;
  late List<QuestionModel> questions =[];
  late String courseName;
  late String courseFullName;
  TextEditingController questionController = TextEditingController();
  List<TextEditingController> answerControllers = [];

  @override
  void initState() {
    _initializer();
    super.initState();
  }

  _initializer() async {
    //get questons debend on type of user
    //me = await FirebaseAuth.instance.currentUser!.displayName!;
    courseName = Globals.choosedCourse.name.substring(0,2).toUpperCase();
    courseFullName = Globals.choosedCourse.name;
    courseId = Globals.choosedCourse.id;
    me = "${Globals.user['firstName']} ${Globals.user['lastName']}";
    questions = [];
    await _getQuestionsData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Globals.currentScreen = Globals.routeToIdle;
                        widget.update();
                      },
                        child: Icon(Icons.arrow_back_ios)),
                    Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.white,
                                Color(0xff124559)
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight
                            ),
                            shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: Offset(2, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Text("$courseName",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                      ),
                    SizedBox(width: 10,),
                    Text("$courseFullName Chat",style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
                Divider(
                  thickness: 1,
                ),
                Expanded(
                  child:
                  questions.length != 0?ListView.builder(
                      itemBuilder: (context, index) => Question(index, questions[index].ownerName,questions[index].id, questions[index].question, questions[index].answers,questions[index].show),
                    itemCount: questions.length,
                  )
                :
                Container(
                  child:Text("there is no question now ..!")
                )
                ),
                !Globals.admittedAnswer?Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: TextField(
                              controller: questionController,
                              keyboardType: TextInputType.multiline,
                              minLines: 1,
                              maxLines: 4,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Octicons.smiley),
                                hintText: "Add a question ...",
                                  filled: true, //<-- SEE HERE
                                  fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40)
                                )
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 55,
                          width: 55,
                          child: ElevatedButton(
                              onPressed: (){
                                AddNewQuestion();
                                disappearKeyboard();

                                setState(() {
                                });
                              },
                                child: Center(child: Icon(Ionicons.md_send,size: 28,)),
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(Color(0xff49A078)),
                              shape: MaterialStatePropertyAll(CircleBorder(

                              ))
                            ),
                          ),
                        )
                      ],
                  ),
                ):Container(),
              ],
            ),
          ),
    );
  }

  Widget Question(int index,String name, int QuestionId,String Question,List<AnswerModel> answers,bool showAnswer) {
    int answerIndex = 0;
    TextEditingController _Controller = TextEditingController();
    answerControllers.add(_Controller);
    if(Globals.admittedAnswer){ // admitted only
      if(questions[index].status == 0){ // not admitted
        return Container();
      }
    }else{ // not admitted
      if(questions[index].status == 1){ // admitted
        return Container();
      }
    }
    return GestureDetector(
      onTap: (){
        setState(() {
          //update question show status
          questions[index].show = !questions[index].show;
        });
      },
      child: Container(
        width: double.infinity,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: Globals.admittedAnswer?BorderRadius.only(topLeft: Radius.circular(18),topRight: Radius.circular(18),bottomRight: Radius.circular(18),bottomLeft: Radius.circular(18))
                  :BorderRadius.only(topLeft: Radius.circular(0),topRight: Radius.circular(18),bottomRight: Radius.circular(18),bottomLeft: Radius.circular(18))
          ),
          color: Color(0xff124559),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //name
                Text("$name",style: TextStyle(color: Color(0xffFFA500).withGreen(255),shadows: [
                  Shadow(blurRadius: 2,color: Colors.yellow)
                ]),),
                //row so2al
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(child: Text("$Question",style: TextStyle(color: Colors.white),)),
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: Icon(showAnswer?AntDesign.minuscircleo:AntDesign.pluscircleo,color: Colors.white,),
                      )
                    ],
                  ),
                ),
                // e5tyary el egaba w checkbox
                showAnswer?Column(
                  children: [
                    ...answers.map((e){
                            return Answer(index, answerIndex++,e.ownerName, e.answer, e.checkBoxValue);}).toList(),
                    !Globals.admittedAnswer?Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: TextField(
                                controller: answerControllers[index],
                                keyboardType: TextInputType.multiline,
                                minLines: 1,
                                maxLines: 4,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Octicons.smiley),
                                    hintText: "Add an answer ...",
                                    filled: true, //<-- SEE HERE
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(40)
                                    )
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 55,
                            width: 55,
                            child: ElevatedButton(
                              onPressed: (){
                                AddAnswer(index,questions[index].id);

                                setState(() {

                                });
                              },
                              child: Center(child: Icon(Ionicons.md_send,size: 28,)),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(Color(0xff49A078)),
                                  shape: MaterialStatePropertyAll(CircleBorder(

                                  ))
                              ),
                            ),
                          )
                        ],
                      ),
                    ):Container(),
                    (typeOfUser == 1 && !Globals.admittedAnswer && answers.length != 0)?Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)
                          )),
                          backgroundColor: MaterialStatePropertyAll(Color(0xff49A078),)
                        ),
                          onPressed: (){
                          bool admit = false;
                          for(int i = 0; i< answers.length; i++){
                            if(answers[i].checkBoxValue){
                              admit = true;
                              break;
                            }
                          }
                          if(admit) {
                            AdmitAnswers(QuestionId);
                          }else{
                            //no answers to add
                          }
                          },
                          child: Padding(
                            padding:  EdgeInsets.symmetric(vertical: 10.0),
                            child: Text("Admit"),
                          )
                      ),
                    ):Container()
                  ],
                ):Container()
                //write answer
                //admit
              ],
            ),

          ),
        ),
      ),
    );
  }

  Widget Answer(int questionIndex,int answerIndex,String name, String answer, bool checkBoxValue) {
    if(Globals.admittedAnswer){ // admitted only
      if(questions[questionIndex].answers[answerIndex].checkBoxValue == false){ // not admitted
        return Container();
      }
    }
    return GestureDetector(
      onTap: () {
        CheckAnswer(questions[questionIndex].id, questions[questionIndex].answers[answerIndex].id, !questions[questionIndex].answers[answerIndex].checkBoxValue);
        setState(() {

        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
          ),
          color: Color(0xff537989),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("$name",style: TextStyle(color: Color(0xffFFA500).withGreen(255)),),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(child: Text("$answer",style: TextStyle(color: Colors.white),)),
                      typeOfUser == 1 && !Globals.admittedAnswer?
                      Checkbox(
                        checkColor: Colors.black,
                        fillColor: MaterialStatePropertyAll(Colors.white),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        value: checkBoxValue,
                        onChanged: (value){
                          CheckAnswer(questions[questionIndex].id, questions[questionIndex].answers[answerIndex].id, value);
                          setState(() {

                          });
                      },
                      ):Container(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  AddNewQuestion() {
    // add question to db then refresh
    if(questionController.text.isNotEmpty) {
      setQuestion(QuestionModel(me, questionController.text, [], false));
      questionController.clear();
      print("done");
    }
  }

  AddAnswer(int index, int questionId){
    if(answerControllers[index].text.isNotEmpty) {
          setAnswerToQuestion(AnswerModel(me, questionId ,answerControllers[index].text, false));
      answerControllers[index].clear();
      disappearKeyboard();
    }
  }

  disappearKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
  late Course course;
  var listen;
  Future<void> _getQuestionsData() async {
    var questionJson = FirebaseDatabase.instance.ref('subs/$courseId');
    questionJson.keepSynced(true);
    listen = questionJson.onValue.listen((DatabaseEvent event) {
      var data = event.snapshot.value;
      print(data);
      course = Course.fromJson(data, event.snapshot.child("questions").children,questions);
      questions = course.questions;
      if(!mounted) return;
        setState(() {});
    });
  }
  setQuestion(QuestionModel question) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("subs/$courseId/questions/${question.id}");

    ref.keepSynced(true);
    await ref.set(question.toJson());
  }



  setAnswerToQuestion(AnswerModel answer) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("subs/$courseId/questions/${answer.questionId}/answers/${answer.id}");
    ref.keepSynced(true);
    await ref.set(answer.toJson());
  }

  CheckAnswer(int questionId, int answerId, value) async {
    // go to answer check or un checked it
    DatabaseReference ref = FirebaseDatabase.instance.ref("subs/$courseId/questions/$questionId/answers/$answerId");
    ref.keepSynced(true);
    await ref.update(
      {
        "checkBoxValue":value
      }
    );
  }

  AdmitAnswers(int questionId) async {
    //go to question change it is status to 1
    DatabaseReference ref = FirebaseDatabase.instance.ref("subs/$courseId/questions/$questionId");
    ref.keepSynced(true);
    await ref.update(
        {
          "status":1
        }
    );
    //remove all un cheacked answers
  }


  @override
  void dispose() {
    listen.cancel();
    super.dispose();
  }


}
