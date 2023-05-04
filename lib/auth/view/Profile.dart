import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    bool isStudent = true;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(30, 15, 0, 0),
          alignment: Alignment.bottomLeft,
          child: const Text(
            "Profile",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Stack(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.red,
                  image: const DecorationImage(
                      image: AssetImage("assets/images/test.jpg"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(50)),
            ),
            Positioned(
                top: 75,
                left: 55,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit_note_outlined,
                    color: Colors.white,
                  ),
                )),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        Container(
          child:  Column(
            children:  [
              ListTile(
                leading: Image(image: AssetImage("assets/images/personalcard.png") ),
                title: Text("Name",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),),
                trailing:InkWell(
                  onTap: (){},
                  child: Ink.image(
                      width: 40,
                      height: 40,
                      image:AssetImage("assets/images/useredit.png",)),
                ),
              ),
              Row(
                children: [
                  SizedBox(width: 30,),
                  Text("Ahmed mohamed", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,),)
                ],
              ),
            ],
          ),
        ),
        Divider(color: Color.fromRGBO(0, 0, 0,1), height: 30,),
        Container(
          child: Column(
            children:  [
              ListTile(
                leading: Icon(Icons.account_circle_outlined,color: Colors.white,),
                title: Text("ID",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),),
                trailing:InkWell(
                  onTap: (){},
                  child: Ink.image(
                      width: 40,
                      height: 40,
                      image:AssetImage("assets/images/useredit.png",)),
                ),
              ),
              Row(
                children: [
                  SizedBox(width: 30,),
                  Text("1827237", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,),)
                ],
              ),
            ],
          ),
        ),
        Divider(color: Color.fromRGBO(0, 0, 0,1), height: 30,),
        Container(
          child: Column(
            children:  [
              ListTile(
                leading: Icon(Icons.phone_enabled, color: Colors.white,),
                title: Text("Phone",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),),
                trailing:InkWell(
                  onTap: (){},
                  child: Ink.image(
                      width: 40,
                      height: 40,
                      image:AssetImage("images/useredit.png",)),
                ),
              ),
              Row(
                children: [
                  SizedBox(width: 30,),
                  Text("01224573884", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,),)
                ],
              ),
            ],
          ),
        ),
        Divider(color: Colors.black, height: 30,),
        isStudent? Container(
          child: Column(
            children:  [
              ListTile(
                leading: Icon(Icons.stacked_bar_chart, color: Colors.white,),
                title: Text("Level",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),),
                trailing:InkWell(
                  onTap: (){},
                  child: Ink.image(
                      width: 40,
                      height: 40,
                      image:AssetImage("images/useredit.png",)),
                ),
              ),
              Row(
                children: [
                  SizedBox(width: 30,),
                  Text("level 4", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,),)
                ],
              ),
            ],
          ),
        ): Container(),
        isStudent?Divider(color: Color.fromRGBO(0, 0, 0,1), height: 30,):Divider(height:0,),
        Container(
          child: Column(
            children:  [
              ListTile(
                leading: Icon(Icons.person, color: Colors.white,),
                title: Text("Email",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),),
                trailing:InkWell(
                  onTap: (){},
                  child: Ink.image(
                      width: 40,
                      height: 40,
                      image:AssetImage("images/useredit.png",)),
                ),
              ),
              Row(
                children: [
                  SizedBox(width: 30,),
                  Text("Example@gmail.com", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,),)
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 70),
        ElevatedButton(
            onPressed: (){},
            style: TextButton.styleFrom(
              fixedSize:const Size(202, 60),
              backgroundColor: const Color(0xff124559),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25))
              ),
            ),
            child: const Text("Log out", style: TextStyle(color: Colors.white, fontSize: 20, ),)),
      ],
    );
  }
}
