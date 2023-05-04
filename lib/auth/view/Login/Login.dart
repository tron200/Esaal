import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff124559),
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
              child: Image(image: AssetImage("images/SignUP.png")),
            ),
            Positioned(
              width: 348,
              height: 568,
              top: 120,
              left: 40,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(colors: [
                    Color.fromRGBO(217, 217, 217, 0.6),
                    Color.fromRGBO(217, 217, 217, 0.4),
                  ]),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
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
                      ],
                    ),
                    SizedBox(
                      height: 200,
                      child: Form(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 288,
                              height: 48,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon:
                                  const Icon(Icons.perm_identity_outlined),
                                  hintText: "Email",
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
                                  prefixIcon:
                                  const Icon(Icons.remove_red_eye_outlined),
                                  hintText: "Password",
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
                            ElevatedButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: const Color(0xff124559),
                                  fixedSize: const Size(146, 46),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                                ),
                                onPressed: () {},
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
                    InkWell(
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
                    const Text(
                      "Don’t have an account ? Sign up as",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 237,
                        height: 37,
                        padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                        decoration: BoxDecoration(
                            color:const  Color(0xff124559),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children:const  [
                            SizedBox(width: 20,),
                            Image(
                                image: AssetImage("images/Teacher.png")),
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
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 237,
                        height: 37,
                        padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                        decoration: BoxDecoration(
                            color:const  Color(0xff124559),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children:const  [
                            SizedBox(width: 20,),
                            Image(
                                image: AssetImage("images/Studend.png")),
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
}
