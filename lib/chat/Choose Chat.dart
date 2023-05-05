import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'data/Globals.dart';

class ChooseChat extends StatefulWidget {

  @override
  State<ChooseChat> createState() => _ChooseChatState();
}

class _ChooseChatState extends State<ChooseChat> {
  String searchName = "";
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Container(
        color: Colors.transparent,
        child: Container(
          color: Colors.transparent,
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("  Esaal Chat",style: TextStyle(fontSize: 30,color: Color(0xff537989),fontWeight: FontWeight.bold),),
              Expanded(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.white10,
                              spreadRadius: 1.5)
                        ]
                    ),
                    width: double.infinity,
                    child: Column(
                      children: [
                        TextField(
                          onChanged: (value) => setState(() {
                            searchName = value;
                          }),
                          controller: controller,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xffd9d9d9),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)
                              ),
                              prefixIcon: Icon(Ionicons.ios_search)
                          ),
                        ),
                        //course
                        Expanded(
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                  return _Coure();
                              },
                              itemCount: 7  ,
                            )
                        )
                      ],
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _Coure() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20)
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),

              ),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white,
                      Color(0xff15475b)
                    ]
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 22,),
                    Padding(
                      padding: const EdgeInsets.only(left: 80.0),
                      child: Text("Java", style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 25),),
                    ),
                    SizedBox(height: 20,)
                    ,
                    true?Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12)
                                    )),
                                    backgroundColor: MaterialStatePropertyAll(Color(0xff124559))
                                ),
                                onPressed: (){

                                },
                                child:Text("Admitted Answers")),
                            ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12)
                                    )),
                                    backgroundColor: MaterialStatePropertyAll(Color(0xff124559))
                                ),
                                onPressed: (){

                                }, child: Text("Discussion")),
                          ],
                        ),
                        SizedBox(height: 10,)
                      ],
                    ):Container()
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 3),
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xff376274)
            ),
            child: Text("JA",style:TextStyle(color: Colors.greenAccent,shadows: [
    Shadow(color: Colors.yellow,blurRadius: 3)
    ],fontWeight: FontWeight.w900, fontSize: 20) ,),
          )
        ],
      ),
    );
  }
}
