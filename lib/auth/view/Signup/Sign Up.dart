import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  int typeOfuser;  //0:student   1:teacher
  SignUp(this.typeOfuser);
  @override
  State<SignUp> createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff124559),
      body: Container(
        width: 440,
        height: 800,
        margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
        child: Stack(
          children: [
            const Positioned(
              width: 336,
              height: 241,
              left: 50,
              top: 140,
              child: Image(image: AssetImage("images/SignUP.png")),
            ),
            Center(
              child: Container(
                width: 348,
                height: 260,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(colors: [
                    Color.fromRGBO(217, 217, 217, 0.8),
                    Color.fromRGBO(217, 217, 217, 0.6),
                  ]),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 50,
                      padding:const EdgeInsets.fromLTRB(30, 0, 0, 0),
                      child:  Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Create a new account",
                            textAlign:TextAlign.end,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Row(
                            children:  [
                              const Text(
                                "Already have one?",
                                textAlign:TextAlign.end,
                                style: TextStyle(
                                  color:Colors.white ,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: const Text(
                                  " Log In",
                                  textAlign:TextAlign.end,
                                  style: TextStyle(
                                    color: Color(0xffFFA500),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 288,
                      height: 57,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blue,
                      ),
                    ),
                    Row(
                      children: [
                        //  start (or) create
                        Container(
                          width: 160,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom:
                              BorderSide(color: Colors.black, width: 1.0),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "or",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 160,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom:
                              BorderSide(color: Colors.black, width: 1.0),
                            ),
                          ),
                        ),
                        //  end (or) create
                      ],
                    ),
                    ElevatedButton(
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xff124559),
                          fixedSize: const Size(281, 45),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(12))),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "sign up with email",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ),
            ),
            const Positioned(
                left: 50,
                top: 190,
                child: Text(
                  "Sign up",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}
