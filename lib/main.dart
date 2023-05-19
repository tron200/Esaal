import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:es2al/MainPage/MainPage.dart';
import 'package:es2al/auth/view/Signup/Sign%20Up.dart';
import 'package:es2al/chat/chat.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'auth/view/Forgot Password/ForgotPassword.dart';
import 'auth/view/Login/Login.dart';
import 'chat/data/Globals.dart';
import 'firebase_options.dart';
import 'intro/Instructions.dart';
import 'intro/intro.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  Widget x = Container();
  @override
  void initState() {
    _initializeFirebase();
    super.initState();
  }
  _initializeFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    //FirebaseFirestore.instance.useFirestoreEmulator("10.0.2.2", 8080);
    //await FirebaseAuth.instance.useAuthEmulator("10.0.2.2", 9099);
    //FirebaseDatabase.instance.useDatabaseEmulator("10.0.2.2",9000);
    if(FirebaseAuth.instance.currentUser != null){
      await RouteToMainPage();
      x = MainPage();
      }else{
      x = Login();
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: Intro(),
      home: x,
    );
  }

  Widget RouteToMainPage(){
    //save data
    _getDataFromFireBase();
    return MainPage();

  }

  Future<void> _getDataFromFireBase() async {
    var ref = FirebaseFirestore.instance.collection("Users");
    var doc = await ref.doc(FirebaseAuth.instance.currentUser?.uid).get().then((value){
      Globals.user = value.data() as Map;
      setState(() {

      });
    });

  }


}


