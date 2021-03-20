import 'package:fitmemax/Objects/PasswordFieldOne.dart';
import 'package:fitmemax/src/widgets/loginButtonTwo.dart';
import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        centerTitle: true,
        title:  Text("Change Password",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black,fontSize: 20),),
        elevation: 0.5,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,size: 20,color: Colors.black,),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20,left: 30,right: 30,top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Current Password", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15,left: 15,right: 15),
              child: PasswordFieldOne(
                onChanged: (value){
                  print(value);
                },
                hint: "*********",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20,left: 30,right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("New Password",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15,left: 15,right: 15),
              child: PasswordFieldOne(
                onChanged: (value){
                  print(value);
                },
                hint: "*********",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20,left: 30,right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Confirm Password",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15,left: 15,right: 15),
              child: PasswordFieldOne(
                onChanged: (value){
                  print(value);
                },
                hint: "*********",
              ),
            ),
            SizedBox(
              height: 35,
            ),
            loginButtonTwo(
              colors: Palette.primaryColor,
              title: "Change Settings",
              onPressed: (){},
            )
          ],
        ),
      ),
    );
  }
}
