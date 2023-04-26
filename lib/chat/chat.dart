import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:es2al/chat/model/question.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'model/answer.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _State();
}

class _State extends State<Chat> {
  int typeOfUser = 1; //0 : student  1 : Doctor
  var _currentIndex = 1; // navigator
  late List<QuestionModel> questions ;

  @override
  void initState() {
    _initializer();
    super.initState();
  }

  _initializer(){
    questions = [
      QuestionModel("omar", "How are you", [
        AnswerModel("abdo", "i'm good"),
        AnswerModel("abdo", "i'm good"),
        AnswerModel("abdo", "i'm good"),
        AnswerModel("abdo", "i'm good"),
      ],
          false),
      QuestionModel("omar", "How are you", [
        AnswerModel("abdo", "i'm good")
      ],
          false),
      QuestionModel("omar", "How are you", [
        AnswerModel("abdo", "i'm good")
      ],
          false),
      QuestionModel("omar", "How are you", [
        AnswerModel("abdo", "i'm good")
      ],
          false),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white,
                  Color(0xff124559),
                ],
              )
          ),
          child: Container(
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.arrow_back_ios),
                    Image.asset("assets/images/circularJava.png"),
                    SizedBox(width: 10,),
                    Text("Java Chat",style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
                Divider(
                  thickness: 1,
                ),
                Expanded(
                  child:
                  ListView.builder(
                      itemBuilder: (context, index) => Question(index, questions[index].ownerName, questions[index].question, questions[index].answers,questions[index].show),
                    itemCount: questions.length,
                  )
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: TextField(
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
                              onPressed: (){},
                                child: Center(child: Icon(Ionicons.md_send,size: 28,)),
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(Color(0xff125849)),
                              shape: MaterialStatePropertyAll(CircleBorder(

                              ))
                            ),
                          ),
                        )
                      ],
                  ),
                ),
                _buildFloatingBar()
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Widget Question(int index,String name,String Question,List<AnswerModel> answers,bool showAnswer) {
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
              borderRadius: BorderRadius.circular(18)
          ),
          color: Color(0xff124559),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //name
                Text("$name",style: TextStyle(color: Color(0xffFFA500)),),
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
                    ...answers.map((e) => Answer(e.ownerName, e.answer)).toList(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: TextField(
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
                              onPressed: (){},
                              child: Center(child: Icon(Ionicons.md_send,size: 28,)),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(Color(0xff125849)),
                                  shape: MaterialStatePropertyAll(CircleBorder(

                                  ))
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    typeOfUser == 1?Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)
                          )),
                          backgroundColor: MaterialStatePropertyAll(Color(0xffFFA500))
                        ),
                          onPressed: (){},
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

  Widget Answer(String name, String answer) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18)
        ),
        color: Color(0xff125849),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("$name",style: TextStyle(color: Color(0xffFFA500)),),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: Text("$answer",style: TextStyle(color: Colors.white),)),
                    typeOfUser == 1?Checkbox(value: true, onChanged: (value){},
                    ):Container(),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFloatingBar() {
    return CustomNavigationBar(
      iconSize: 30.0,
      selectedColor: Color(0xff49A078),
      strokeColor: Color(0xff49A078),
      unSelectedColor: Colors.grey[600],
      backgroundColor: Colors.white,
      borderRadius: Radius.circular(40.0),
      items: [
        CustomNavigationBarItem(
          icon: Icon(
            AntDesign.appstore_o,
          ),
        ),
        CustomNavigationBarItem(
          icon: Icon(
            Ionicons.ios_chatbubbles,

          ),
        ),
        CustomNavigationBarItem(
          icon: Icon(
            MaterialCommunityIcons.telescope,
          ),
        ),
        CustomNavigationBarItem(
          icon: Icon(
            AntDesign.user,
          ),
        ),
      ],
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      isFloating: true,
    );
  }
}
