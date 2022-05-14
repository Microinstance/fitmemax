import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:fitmemax/src/widgets/loginButtonTwo.dart';
import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';

class AccountInformation extends StatefulWidget {
  @override
  _AccountInformationState createState() => _AccountInformationState();
}

class _AccountInformationState extends State<AccountInformation> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        centerTitle: true,
        title:  Text("Account Information",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black,fontSize: 20),),
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
              padding: const EdgeInsets.only(top: 20,bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    overflow: Overflow.visible,
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(7.5),
                        ),
                      ),
                      Positioned(
                          top: -15,
                          right: -15,
                          child: GestureDetector(
                            onTap: (){},
                            child: CircleAvatar(
                              radius: 16,
                              backgroundColor: Colors.black,
                              child: CircleAvatar(
                                radius: 14,
                                  backgroundColor: Colors.white,
                                  child: Center(child:  Icon(Icons.edit,size: 18,color: Colors.black,),)),
                            ),
                          ))
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20,left: 30,right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Full Name",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15,left: 30,right: 30),
              child: TextField(
                controller: TextEditingController(text: "Hashim Sheikh"),
                onChanged: (x){},
                autofocus: false,
                style: TextStyle(color: Colors.black,fontSize: 18),
                cursorColor: Palette.primaryColor,
                decoration: InputDecoration(
                    isDense: false,
                    hintText: "Enter Your Name",
                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.7),fontSize: 18),
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(7.5),
                      ),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                    contentPadding: EdgeInsets.only(top: 7,right: 10,left: 10,bottom: 7)
                ),
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
                  Text("Email Address",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15,left: 30,right: 30),
              child: TextField(
                controller: TextEditingController(text: "hashimsheikh@dropbuy.org"),
                onChanged: (x){},
                autofocus: false,
                style: TextStyle(color: Colors.black,fontSize: 18),
                cursorColor: Palette.primaryColor,
                decoration: InputDecoration(
                    suffixIcon: IconButton(icon: Icon(Icons.info_outline,size: 20,color: Colors.red,), onPressed: ()async{
                      final result = await showOkCancelAlertDialog(
                        context: context,
                        title: 'Alert!',
                        message: 'Your Email is not verified yet, Please verify it',
                        defaultType: OkCancelAlertDefaultType.cancel,
                      );
                      if(result.index == 0){
                        final result1 = await showOkAlertDialog(
                          context: context,
                          title: 'Verification Request Successful!',
                          message: 'Check your email for the verification link',
                        );
                      }
                    }),
                    isDense: false,
                    hintText: "Enter Your Email Address",
                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.7),fontSize: 18),
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(7.5),
                      ),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                    contentPadding: EdgeInsets.only(top: 7,right: 10,left: 10,bottom: 7)
                ),
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
                  Text("Phone Number",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15,left: 30,right: 30),
              child: TextField(
                controller: TextEditingController(text: "+17581268126"),
                onChanged: (x){},
                autofocus: false,
                style: TextStyle(color: Colors.black,fontSize: 18),
                cursorColor: Palette.primaryColor,
                decoration: InputDecoration(
                    suffixIcon: IconButton(icon: Icon(Icons.check_circle,size: 20,color: Colors.green[700],), onPressed: (){}),
                    isDense: false,
                    hintText: "Enter Your Phone Number",
                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.7),fontSize: 18),
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(7.5),
                      ),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                    contentPadding: EdgeInsets.only(top: 7,right: 10,left: 10,bottom: 7)
                ),
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
                  Text("Age",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15,left: 30,right: 30),
              child: TextField(
                controller: TextEditingController(text: "39"),
                onChanged: (x){},
                autofocus: false,
                style: TextStyle(color: Colors.black,fontSize: 18),
                cursorColor: Palette.primaryColor,
                decoration: InputDecoration(
                    isDense: false,
                    hintText: "Enter Your Age",
                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.7),fontSize: 18),
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(7.5),
                      ),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                    contentPadding: EdgeInsets.only(top: 7,right: 10,left: 10,bottom: 7)
                ),
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
                  Text("Gender",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15,left: 30,right: 30),
              child: TextField(
                controller: TextEditingController(text: "Male"),
                onChanged: (x){},
                autofocus: false,
                style: TextStyle(color: Colors.black,fontSize: 18),
                cursorColor: Palette.primaryColor,
                decoration: InputDecoration(
                    isDense: false,
                    hintText: "Gender",
                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.7),fontSize: 18),
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(7.5),
                      ),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                    contentPadding: EdgeInsets.only(top: 7,right: 10,left: 10,bottom: 7)
                ),
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
                  Text("Height",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20)),
                  Container(
                    padding: const EdgeInsets.only(bottom: 0,left: 10,right: 3),
                    height: 30,
                    width: 80,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: FlatButton(child:Text("CM",style:TextStyle(color: Colors.white,)) ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 0,left: 10,right: 3),
                    height: 30,
                    width: 80,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        border: Border.all(
                          color: Colors.green,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: FlatButton(child:Text("FT",style:TextStyle(color: Colors.white,)) ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15,left: 30,right: 30),
              child: TextField(
                controller: TextEditingController(text: "5.4"),
                onChanged: (x){},
                autofocus: false,
                style: TextStyle(color: Colors.black,fontSize: 18),
                cursorColor: Palette.primaryColor,
                decoration: InputDecoration(
                    isDense: false,
                    hintText: "in CM",
                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.7),fontSize: 18),
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(7.5),
                      ),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                    contentPadding: EdgeInsets.only(top: 7,right: 10,left: 10,bottom: 7)
                ),
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
                  Text("Weight",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20)),
                  Container(
                    padding: const EdgeInsets.only(bottom: 0,left: 10,right: 3),
                    height: 30,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: FlatButton(child:Text("LBS",style:TextStyle(color: Colors.white,)) ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 0,left: 10,right: 3),
                    height: 30,
                    width: 80,
                    decoration: BoxDecoration(
                        color: Colors.green ,
                        border: Border.all(
                          color: Colors.green,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: FlatButton(child:Text("KG",style:TextStyle(color: Colors.white,)) ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15,left: 30,right: 30),
              child: TextField(
                controller: TextEditingController(text: "60"),
                onChanged: (x){},
                autofocus: false,
                style: TextStyle(color: Colors.black,fontSize: 18),
                cursorColor: Palette.primaryColor,
                decoration: InputDecoration(
                    isDense: false,
                    hintText: "in KG",
                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.7),fontSize: 18),
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(7.5),
                      ),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                    contentPadding: EdgeInsets.only(top: 7,right: 10,left: 10,bottom: 7)
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            loginButtonTwo(
              colors: Palette.primaryColor,
              title: "Update",
               onPressed: (){},
            )
          ],
        ),
      ),
    );
  }
}
