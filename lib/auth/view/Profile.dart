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
    return SingleChildScrollView(
      child: Column(
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
            height: 10,
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
                  top: 65,
                  left: 55,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit_note_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                  )),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ////////////////////
          _buildElement(
            Image(image: AssetImage("assets/images/personalcard.png") ),
            "Name",
            "Ahmed Mohmed",
          AssetImage("assets/images/useredit.png")),

          _buildElement(Icon(Icons.account_circle_outlined,color: Colors.white,), "ID", "1827237", AssetImage("assets/images/useredit.png",)),
          _buildElement(Icon(Icons.phone_enabled, color: Colors.white,), "Phone", "01224573884", AssetImage("assets/images/useredit.png",)),

          isStudent?
          _buildElement(Icon(Icons.stacked_bar_chart, color: Colors.white,), "Level", "level 4", AssetImage("assets/images/useredit.png",))
          : Container(),
          _buildElement(Icon(Icons.person, color: Colors.white,), "Email", "Example@gmail.com", AssetImage("assets/images/useredit.png",)),
          ElevatedButton(
              onPressed: (){},
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

  Widget _buildElement(Widget leading,String title, String content, AssetImage img){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Row(
            children: [
              leading,
              SizedBox(width: 10,),
              Text("$title",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),)
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
                  child: Image(image: img,)
              ),
            ],
          ),
          Divider(color: Color.fromRGBO(0, 0, 0,1), thickness: 1,height: 30,),
        ],
      ),
    );
  }
}
