import 'package:es2al/intro/Instructions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../chat/data/Globals.dart';
import 'Login/Login.dart';

class Profile extends StatefulWidget {

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context)  {
    print(Globals.typeOfUsers);
    bool isStudent = Globals.typeOfUsers == 0?true:false;
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Profile", style: TextStyle(color: Color(0xff537989), fontWeight: FontWeight.bold, fontSize: 30, fontFamily: "Times New Roman"),),
                ),
                const Expanded(child: SizedBox()),
                GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Instructions(),)),
                  child: Text("Go to instructions",style: TextStyle(
                        color: Color(0xff49A078), fontWeight: FontWeight.bold, fontSize: 17)),
                )
              ],
          ),
            const SizedBox(height: 10),
            Stack(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.red,
                    image: const DecorationImage(
                        image: AssetImage("assets/images/userProfile.jpg"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(50)),
              ),

            ],
          ),
            const SizedBox(
            height: 10,
          ),
            _buildElement(Image(image: AssetImage("assets/images/personalcard.png"), color: Color(0xff124559)), "Name", "${Globals.user['firstName']} ${Globals.user['lastName']}", AssetImage("assets/images/useredit.png"), false),
            Globals.typeOfUsers == 0?_buildElement(Icon(Icons.account_circle_outlined,color: Color(0xff124559),), "ID", "${Globals.user['studentId']}", AssetImage("assets/images/useredit.png",), false):Container(),
            _buildElement(Icon(Icons.phone_enabled, color: Color(0xff124559)), "Phone", "${Globals.user['phone']}", AssetImage("assets/images/useredit.png",), false),
            isStudent?
            _buildElement(Icon(Icons.stacked_bar_chart, color: Color(0xff124559),), "Level", "level ${Globals.user['level']}", AssetImage("assets/images/useredit.png",), false):
            _buildElement(Icon(Icons.stacked_bar_chart, color: Color(0xff124559)), "Master’s Specialization", "Master’s : ${Globals.user['master']}", AssetImage("assets/images/useredit.png",), false),
            _buildElement(Icon(Icons.person, color: Color(0xff124559)), "Email", "${Globals.user['email']}", AssetImage("assets/images/useredit.png",), true),
            SizedBox(height: 30,),
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut().then((value){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login(),));
                });
              },
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xff124559),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25))
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: const Text("Log out", style: TextStyle(color: Colors.white, fontSize: 16, ),),
              )),
            SizedBox(height:15,)
          ],
        ),
      );
  }

  Widget _buildElement(Widget leading,String title, String content, AssetImage img, bool isLast){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Row(
            children: [
              leading,
              SizedBox(width: 10,),
              Text(title, style: TextStyle(color: Color(0xff124559),fontWeight: FontWeight.bold,fontSize: 15),)
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text("$content",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),),
              ),
              Expanded(child: SizedBox()),
              GestureDetector(
                  onTap: (){
                    print("done");
                  },
                  child: title == "Email"?Container():Image(image: img, color: const Color(0xff124559),)
              ),
            ],
          ),
          isLast? SizedBox(): Divider(height: 30, thickness: 2, color: Color(0xff4F4F4F)),

        ],
      ),
    );
  }
}
