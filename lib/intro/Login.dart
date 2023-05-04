import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../chat/chat.dart';
import '../chat/data/Globals.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(15),
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: TextButton.styleFrom(
                  fixedSize:const Size(202, 60),
                  backgroundColor: const Color(0xffD9D9D9),
                  foregroundColor: Colors.black,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                ),
                onPressed: (){
                  Globals.typeOfUsers = 0;
                  if(FirebaseAuth.instance.currentUser == null){
                    signInWithGoogle().then((value){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Chat(),));
                    });
                  }else{
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Chat(),));
                  }

            }, child: Text("Sign up As student ..!")),
            SizedBox(height: 10,),
            ElevatedButton(
                style: TextButton.styleFrom(
                  fixedSize:const Size(202, 60),
                  backgroundColor: const Color(0xffD9D9D9),
                  foregroundColor: Colors.black,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                ),
                onPressed: (){
                  Globals.typeOfUsers = 1;
                  if(FirebaseAuth.instance.currentUser == null){
                    signInWithGoogle().then((value){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Chat(),));
                    });
                  }else{
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Chat(),));
                  }

                }, child: Text("Sign up As Doctor ..!")),
            SizedBox(height: 10,),
            ElevatedButton(
                style: TextButton.styleFrom(
                  fixedSize:const Size(202, 60),
                  backgroundColor: const Color(0xffD9D9D9),
                  foregroundColor: Colors.black,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                ),
                onPressed: (){
                  Globals.typeOfUsers = 2;
                  if(FirebaseAuth.instance.currentUser == null){
                    signInWithGoogle().then((value){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Chat(),));
                    });
                  }else{
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Chat(),));
                  }

                }, child: Text("Admitted questions"))
          ],
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

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
