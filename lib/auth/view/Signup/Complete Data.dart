import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:es2al/MainPage/MainPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../chat/data/Globals.dart';



class CompleteData extends StatefulWidget {
  int typeOfuser;
  int google;



  CompleteData(this.typeOfuser,this.google);

  @override
  State<CompleteData> createState() => _CompleteDataState();
}

class _CompleteDataState extends State<CompleteData> {
  late bool isdoctor;
  late bool google;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController levelController = TextEditingController();
  TextEditingController iDController = TextEditingController();
  TextEditingController masterController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    isdoctor = widget.typeOfuser == 1?true:false;
    google = widget.google == 1?true:false;
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Color(0xff124559),
      body: Container(
        margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
        child: Stack(
          children: [
            const Positioned(
              width: 336,
              height: 241,
              left: 50,
              child: Image(image: AssetImage("assets/images/SignUP.png")),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top:120,left: 30,right: 30),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(colors: [
                    Color.fromRGBO(217, 217, 217, 0.8),
                    Color.fromRGBO(217, 217, 217, 0.6),
                  ]),
                ),
                child: Form(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          controller: firstNameController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon:
                              const Icon(Icons.perm_identity_outlined),
                              hintText: "First Name",
                              hintStyle: const TextStyle(
                                  color: Color(0xff124559), fontSize: 15),
                              border: const OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                  const BorderSide(color: Color(0xff124559))),
                            ),
                          ),
                          SizedBox(height: 15,),
                          TextFormField(
                            controller: lastNameController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon:
                              const Icon(Icons.perm_identity_outlined),
                              hintText: "last Name",
                              hintStyle: const TextStyle(
                                  color: Color(0xff124559), fontSize: 15),
                              border: const OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                  const BorderSide(color: Color(0xff124559))),
                            ),
                          ),
                        SizedBox(height: 15,),
                        TextFormField(
                          controller: phoneController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon: const Icon(Icons.phone_enabled),
                              hintText: "Phone",
                              hintStyle: const TextStyle(
                                  color: Color(0xff124559), fontSize: 15),
                              border: const OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                  const BorderSide(color: Color(0xff124559))),
                            ),
                          ),
                        SizedBox(height: 15,),
                        isdoctor?Container():TextFormField(
                          controller: iDController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon:
                              const Icon(Icons.account_circle_outlined),
                              hintText: "ID",
                              hintStyle: const TextStyle(
                                  color: Color(0xff124559), fontSize: 15),
                              border: const OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                  const BorderSide(color: Color(0xff124559))),
                            ),
                          ),
                        isdoctor?Container():SizedBox(height: 15,),
                        isdoctor
                            ? TextFormField(
                          controller: masterController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon:
                              const Icon(Icons.account_circle_outlined),
                              hintText: "Master’s Specialization",
                              hintStyle: const TextStyle(
                                  color: Color(0xff124559), fontSize: 15),
                              border: const OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                      color: Color(0xff124559))),
                            ),
                          ) : TextFormField(
                          controller: levelController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon:
                              const Icon(Icons.stacked_bar_chart),
                              hintText: "Level",
                              hintStyle: const TextStyle(
                                  color: Color(0xff124559), fontSize: 15),
                              border: const OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                      color: Color(0xff124559))),
                            ),
                          ),
                        SizedBox(height: 15,),
                        google?Container():TextFormField(
                          controller: emailController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon:
                              const Icon(Icons.perm_identity_outlined),
                              hintText: "Email",
                              hintStyle: const TextStyle(
                                  color: Color(0xff124559), fontSize: 15),
                              border: const OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                  const BorderSide(color: Color(0xff124559))),
                            ),
                          ),
                        google?Container():SizedBox(height: 15,),
                        google?Container():TextFormField(
                          controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon:
                                  const Icon(Icons.remove_red_eye_outlined)),
                              hintText: "Password",
                              hintStyle: const TextStyle(
                                  color: Color(0xff124559), fontSize: 15),
                              border: const OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                  const BorderSide(color: Color(0xff124559))),
                            ),
                          ),
                        google?Container():SizedBox(height: 15,),
                        ElevatedButton(
                            style: TextButton.styleFrom(
                              backgroundColor: const Color(0xff124559),
                              fixedSize: const Size(174, 35),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                            ),
                            onPressed: () {
                              if(_validation()){
                                _saveDataAndNavigteToDashBoard();
                              }
                            },
                            child: const Text(
                              "Create account",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Positioned(
                left: 55,
                top: 40,
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

  bool _validation() {
    return true;
  }

  Future<void> _saveDataAndNavigteToDashBoard() async {
    //save to firebase and provider
    await _saveInformationToFireBase().then((value){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage(),));
    });
    //go to dashboard
  }

  Future<void> _saveInformationToFireBase() async {
    Map<String,dynamic> map = Map();
    
    map['firstName'] = firstNameController.text;
    map['lastName'] = lastNameController.text;
    map['phone'] = phoneController.text;
    if(google){
      map['id'] =  FirebaseAuth.instance.currentUser?.uid;
      map['email'] = FirebaseAuth.instance.currentUser?.email;
    }else{
      await _SignInWithEmailAndPassword(emailController.text,passwordController.text).then((value){
        map['id'] = FirebaseAuth.instance.currentUser?.uid;
        map['email'] = emailController.text;
      });
    }
    if(isdoctor){
      map['master'] = masterController.text;
    }else{
      map['studentId'] = iDController.text;
      map['level'] = levelController.text;
    }

    //save data

    await FirebaseFirestore.instance.collection("Users").doc("${map['id']}").set(map).then((value){
        Globals.user = map;
        if(isdoctor){
          Globals.typeOfUsers = 1;
        }else{
          Globals.typeOfUsers = 0;
        }
        Globals.currentScreen = 0;
        Globals.currentScreenIndex = 0;
    });
  }

  Future<void> _SignInWithEmailAndPassword(String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
