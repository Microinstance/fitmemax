import 'package:fitmemax/API/APIClient.dart';
import 'package:fitmemax/Objects/Backgrounds.dart';
import 'package:fitmemax/Objects/ButtonOne.dart';
import 'package:fitmemax/Objects/PasswordFieldOne.dart';
import 'package:fitmemax/Objects/SocialButton.dart';
import 'package:fitmemax/Objects/TextFieldOne.dart';
import 'package:fitmemax/src/ListData/ListData.dart';
import 'package:fitmemax/src/module/Authentication/SigninPage.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import '../dashboard/Dashboard.dart';
import 'Onboarding/GoalChoice.dart';
import 'Onboarding/MedicalCondition.dart';
import 'Onboarding/PhysicalCondition.dart';
import 'SignupVerify.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_login_facebook/flutter_login_facebook.dart';

class SocialSignUp extends StatefulWidget {

  final String name;
  final String email;

  SocialSignUp({this.email, this.name});

  @override
  _SocialSignUpState createState() => _SocialSignUpState();
}

class _SocialSignUpState extends State<SocialSignUp> {

  String _CountryValue = "+91";

  String phone = "";
  String password = "";

  APIClient client;

  GoogleSignInAccount _currentUser;
  String _contactText = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    client = new APIClient();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
    ));
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Backgrounds(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Container(
                  width: _width * 0.6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Image.asset(
                          'assets/logo/splash-Screen.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 3.0, spreadRadius: 3.0),
                  ],
                  borderRadius: borderRadious.primeryRadious,
                ),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  removeBottom: true,
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding:  EdgeInsets.only(bottom: 20),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Create Account!',
                              style: TextStyles.HeadingBlack,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20,top: 10),
                        child: SizedBox(
                          width: _width-80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 75,
                                child: Container(
                                  padding: EdgeInsets.only(
                                    top: 8,
                                    bottom: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                    borderRadius: borderRadious.primeryRadious,
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: ButtonTheme(
                                      alignedDropdown: true,
                                      child: DropdownButton(
                                        isDense: true,
                                        hint: Text("+91",style: TextStyles.BodyBlack,
                                        ),
                                        value: _CountryValue,
                                        items: Data().countryCode.map((value) {
                                          return DropdownMenuItem(
                                            value: value,
                                            child: Text(value,style: TextStyles.BodyBlack,
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            _CountryValue = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: _width-80-95,
                                child: TextFieldOne(
                                  hint: 'Phone Number',
                                  onChanged: (v) {
                                    setState(() {
                                      phone = v;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20,top: 10),
                        child: PasswordFieldOne(
                          hint: 'Password',
                          onChanged: (v) {
                            setState(() {
                              password = v;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25,left: 20,right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: _width-90,
                              child: ButtonOne(
                                title: 'Sign Up',
                                colors: ColorPalette.PrimaryColor,
                                onPressed: signUP,
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  signUP() async {
    if (phone == ""){
      client.error("Please enter your phone");
    } else if(password == ""){
      client.error("Please enter your password");
    } else {
      showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isDismissible: false,
        builder: (BuildContext context) {
          return SignupVerify(name: widget.name, email: widget.email, password: password, phone: phone,);
        },
        isScrollControlled: true,
      );
    }
  }

}


