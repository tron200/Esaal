import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:es2al/auth/view/Signup/Sign%20Up.dart';
import 'package:es2al/chat/data/Globals.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../MainPage/MainPage.dart';

class Login extends StatefulWidget {

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailControoler = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xff124559),
      body: Container(
        margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: Stack(
          children: [
            const Positioned(
              width: 336,
              height: 241,
              left: 50,
              child: Image(image: AssetImage("assets/images/SignUP.png")),
            ),
             Container(
               margin: EdgeInsets.only(left: 30,right: 30,top: 100),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(colors: [
                    Color.fromRGBO(217, 217, 217, 0.6),
                    Color.fromRGBO(217, 217, 217, 0.4),
                  ]),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10 ,vertical: 10),
                        width: double.infinity,
                        child: SignInButton(
                          Buttons.Google,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 3,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          onPressed: () {
                            signInWithGoogle().then((value) => _manageUserRedirection());
                          },
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(thickness: 1,color: Colors.black,)
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
                          Expanded(
                            child: Divider(thickness: 1,color: Colors.black,)
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Form(
                          key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextFormField(
                                  controller: emailControoler,
                                    validator: (value){
                                      if(!value!.contains("@") || !value!.contains(".com")){
                                        return "Invalid Email..!";
                                      }
                                      return null;
                                      },
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      prefixIcon:
                                      const Icon(Icons.perm_identity_outlined),
                                      hintText: "Email",
                                      hintStyle: const TextStyle(
                                          color: Color(0xff124559), fontSize: 15),
                                      border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(15)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          borderSide: const BorderSide(
                                              color: Color(0xff124559))),
                                    ),
                                  ),
                                SizedBox(height: 10,),
                                TextFormField(
                                  controller: passwordController,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      prefixIcon:
                                      const Icon(Icons.remove_red_eye_outlined),
                                      hintText: "Password",
                                      hintStyle: const TextStyle(
                                          color: Color(0xff124559), fontSize: 15),
                                      border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(15)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          borderSide: const BorderSide(
                                              color: Color(0xff124559))),
                                    ),
                                ),
                                SizedBox(height: 10,),
                                ElevatedButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: const Color(0xff124559),
                                      fixedSize: const Size(146, 46),
                                      shape: const RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(12))),
                                    ),
                                    onPressed: () {
                                      _validate();
                                    },
                                    child: const Text(
                                      "Log In",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ),
                      ),
                      SizedBox(height: 30,),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          "Forgot your password?",
                          style: TextStyle(
                            color: Color(0xffFFA500),
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                      const Text(
                        "Don’t have an account ? Sign up as",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                      SizedBox(height: 10,),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(1),));
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              color:const  Color(0xff124559),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children:const  [
                              SizedBox(width: 20,),
                              Image(
                                  image: AssetImage("assets/images/Teacher.png")),
                              SizedBox(width: 20,),
                              Text(
                                "Teacher",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(0),));
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              color:const  Color(0xff124559),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children:const  [
                              SizedBox(width: 20,),
                              Image(
                                  image: AssetImage("assets/images/Studend.png")),
                              SizedBox(width: 20,),
                              Text(
                                "Student",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10,)
                    ],
                  ),
                ),
              ),
            const Positioned(
                left: 55,
                top: 40,
                child: Text(
                  "Log in",
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

   _validate() {
    if(_formKey.currentState!.validate()) {
      _loginWithEmail(emailControoler.text,passwordController.text);
    }
  }

  Future<void> _loginWithEmail(String email, String password) async {
    print("$email         $password");
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      ).then((value) async {
        await FirebaseFirestore.instance.collection("Users").doc(value.user?.uid).get().then((doc){
          if(doc != null) {
            Globals.user = doc.data()!;
            Globals.currentScreen = 0;
            Globals.currentScreenIndex = 0;
            Globals.typeOfUsers = Globals.user['type'];
            //save data then route
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage(),));
          }
        });

      });
      
      print(FirebaseAuth.instance.currentUser?.email);
    } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Incorrect Email Or Password"))
        );
    }
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

  _manageUserRedirection() async {
    try {
      // Get reference to Firestore collection
      CollectionReference users = FirebaseFirestore.instance.collection('Users');
      var doc = await users.doc(FirebaseAuth.instance.currentUser?.uid).get();
      //save his info
      if(doc.exists) {
        Globals.user = doc.data() as Map;
        Globals.currentScreen = 0;
        Globals.currentScreenIndex = 0;
        Globals.typeOfUsers = Globals.user['type'];
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MainPage(),));
      }else{
        FirebaseAuth.instance.signOut();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("You Don't Have Account, Sign up Insted..!"))
        );
      }
    } catch (e) {
      print("in2");

    }
  }
}
