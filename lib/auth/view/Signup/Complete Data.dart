import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class CompleteData extends StatefulWidget {
  const CompleteData({Key? key}) : super(key: key);

  @override
  State<CompleteData> createState() => _CompleteDataState();
}

class _CompleteDataState extends State<CompleteData> {
  @override
  Widget build(BuildContext context) {
    bool isdoctor = false;
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Color(0xff124559),
      body: Container(
        margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
        child: Stack(
          children: [
            const Positioned(
              width: 336,
              height: 241,
              left: 50,
              child: Image(image: AssetImage("images/SignUP.png")),
            ),
            Center(
              child: Container(
                width: 348,
                height: 601,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(colors: [
                    Color.fromRGBO(217, 217, 217, 0.8),
                    Color.fromRGBO(217, 217, 217, 0.6),
                  ]),
                ),
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 288,
                        height: 48,
                        child: TextFormField(
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
                      ),
                      SizedBox(
                        width: 288,
                        height: 48,
                        child: TextFormField(
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
                                borderRadius: BorderRadius.circular(150),
                                borderSide:
                                const BorderSide(color: Color(0xff124559))),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 288,
                        height: 48,
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            suffixIcon: const Icon(Icons.phone_enabled),
                            hintText: "Phone",
                            hintStyle: const TextStyle(
                                color: Color(0xff124559), fontSize: 15),
                            border: const OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(150),
                                borderSide:
                                const BorderSide(color: Color(0xff124559))),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 288,
                        height: 48,
                        child: TextFormField(
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
                                borderRadius: BorderRadius.circular(150),
                                borderSide:
                                const BorderSide(color: Color(0xff124559))),
                          ),
                        ),
                      ),
                      isdoctor
                          ? SizedBox(
                        width: 288,
                        height: 48,
                        child: TextFormField(
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
                                borderRadius: BorderRadius.circular(150),
                                borderSide: const BorderSide(
                                    color: Color(0xff124559))),
                          ),
                        ),
                      )
                          : SizedBox(
                        width: 288,
                        height: 48,
                        child: TextFormField(
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
                                borderRadius: BorderRadius.circular(150),
                                borderSide: const BorderSide(
                                    color: Color(0xff124559))),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 288,
                        height: 48,
                        child: TextFormField(
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
                                borderRadius: BorderRadius.circular(150),
                                borderSide:
                                const BorderSide(color: Color(0xff124559))),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 288,
                        height: 48,
                        child: TextFormField(
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
                                borderRadius: BorderRadius.circular(150),
                                borderSide:
                                const BorderSide(color: Color(0xff124559))),
                          ),
                        ),
                      ),
                      ElevatedButton(
                          style: TextButton.styleFrom(
                            backgroundColor: const Color(0xff124559),
                            fixedSize: const Size(174, 35),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                          ),
                          onPressed: () {},
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
}
