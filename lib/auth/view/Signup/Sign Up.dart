import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'Complete Data.dart';

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
        margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
        child: Stack(
          children: [
            const Positioned(
              left: 50,
              child: Image(image: AssetImage("assets/images/SignUP.png")),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 120, left: 30, right: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(colors: [
                      Color.fromRGBO(217, 217, 217, 0.8),
                      Color.fromRGBO(217, 217, 217, 0.6),
                    ]),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Container(
                        padding:const EdgeInsets.only(left: 30),
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
                                GestureDetector(
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
                      SizedBox(height: 20,),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30 ,vertical: 10),
                        width: double.infinity,
                        child: SignInButton(
                          Buttons.Google,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 3,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          onPressed: () {
                            signInWithGoogle().then((value){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CompleteData(widget.typeOfuser,1),));
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children:const [
                          //  start (or) create
                          Expanded(
                            child:Divider(color: Colors.black, thickness: 1.5,),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "or",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child:Divider(color: Colors.black, thickness: 1.5,),
                          ),
                          //  end (or) create
                        ],
                      ),
                      SizedBox(height: 20,),
                      ElevatedButton(
                          style: TextButton.styleFrom(
                            backgroundColor: const Color(0xff124559),
                            fixedSize: Size(230,40),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CompleteData(widget.typeOfuser,0),));
                          },
                          child: const Text(
                            "sign up with email",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.bold),
                          )),
                      SizedBox(height: 30,)
                    ],
                  ),
                ),
                Expanded(child: SizedBox())
              ],
            ),
            const Positioned(
                left: 50,
                top: 50,
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

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    // save user infro in provider

    //route to Main page
    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage(),));

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
