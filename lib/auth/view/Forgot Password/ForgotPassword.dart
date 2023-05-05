import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff124559),
      body: Container(
        margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Stack(
          children: [
            const Positioned(
              width: 336,
              height: 150,
              left: 50,
              child: Image(
                  image: AssetImage("assets/images/forgetPasswordImage.png")),
            ),
            Column(
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 130, left: 20, right: 20),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(colors: [
                        Color.fromRGBO(217, 217, 217, 0.8),
                        Color.fromRGBO(217, 217, 217, 0.6),
                      ]),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Forgot Password?",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 15,),
                        Text(
                          "Don’t worry It happens,\nplease "
                          "enter address associated with your account",
                          style: TextStyle(color: Colors.white,height: 1.5),
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xffD9D9D9),
                            prefixIcon:
                                const Icon(Icons.perm_identity_outlined),
                            hintText: "Email ID / Mobile number",
                            hintStyle: const TextStyle(
                                color: Color(0xff124559), fontSize: 15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        const Text(
                          "Code will be sent to you in moments",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 10,),
                        Center(
                          child: ElevatedButton(
                              style: TextButton.styleFrom(
                                backgroundColor: const Color(0xff124559),
                                fixedSize: const Size(164, 45),
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))),
                              ),
                              onPressed: () {},
                              child: const Text(
                                "Submit",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            Text(
                              "Back to ",
                              style: TextStyle(
                                  fontSize: 15, color: Color(0xff17202A)),
                            ),
                            GestureDetector(
                              child: Text("Log In",
                                  style: TextStyle(
                                      fontSize: 15, color: Color(0xffFFA500))),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                      ],
                    ),
                  ),
                ),
                Expanded(child: SizedBox())
              ],
            ),
          ],
        ),
      ),
    );
  }
}
