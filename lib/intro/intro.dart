import 'package:flutter/material.dart';

class Intro extends StatelessWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const  Color.fromRGBO(83, 121, 137,.9),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25.0, bottom: 5, left: 50, right: 15),
            child: Image(image: AssetImage("assets/images/Esa2alLogo.png"),),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
                child: Stack(
                  fit: StackFit.expand,
                  children: const [
                    Positioned(
                        top:10,
                        left:0,
                        child: Image(image: AssetImage('assets/images/Es2al.png',), width: 164, height: 80,)
                    ),
                    Positioned(
                        bottom:-10,
                        right: 0,
                        child: Image(image: AssetImage('assets/images/Es2al.png',), width: 164, height: 80,)
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Image(image: AssetImage('assets/images/welcome.png')),
                    ),
                  ],
                ),
            ),
          ),
          SizedBox(height: 15,),
          Center(
            child:  Text(
                "E-Learning App for",
                style: TextStyle(
                    fontSize: 25, color: Color(0xffD9D9D9),
                    fontWeight: FontWeight.bold, fontFamily: 'Poppins')
            ),
          ),
          SizedBox(height: 10,),
          Center(
            child:  Text(
                "easier experience of study",
                style: TextStyle(
                    fontSize: 25, color: Color(0xffD9D9D9),
                    fontWeight: FontWeight.bold, fontFamily: 'Poppins')
            ),
          ),
          SizedBox(height: 15,)
          ,
          ElevatedButton(
              onPressed: (){},
              style: TextButton.styleFrom(
                fixedSize:const Size(202, 60),
                backgroundColor: const Color(0xffD9D9D9),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
              ),
              child: const Text("Get Started", style: TextStyle(color: Color(0xff537989), fontSize: 20, ),)
          ),
          SizedBox(height: 10,)
        ],
      ),
    );
  }
}
