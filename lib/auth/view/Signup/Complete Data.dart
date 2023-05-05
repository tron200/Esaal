import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



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
    return false;
  }

  void _saveDataAndNavigteToDashBoard() {
    //save to firebase and provider

    //go to dashboard
  }
}
