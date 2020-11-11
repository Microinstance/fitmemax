import 'package:fitmemax/src/module/signin_signup/SigninPage.dart';
import 'package:fitmemax/src/module/signin_signup/VerifyPage.dart';
import 'package:fitmemax/src/widgets/palette.dart';
import 'package:fitmemax/src/widgets/w_background.dart';
import 'package:fitmemax/src/widgets/w_dropdown.dart';
import 'package:fitmemax/src/widgets/w_signin_button.dart';
import 'package:fitmemax/src/widgets/w_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  List _countryName = ['+91', '+1', '+11', '+33'];
  String _countryValue;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
    ));
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return w_background(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(left: _width * 0.02, right: _width * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              width: _width * 0.6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                      child: Image.asset(
                    'assets/logo/splashScreen.png',
                    fit: BoxFit.fitWidth,
                  )),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.all(_width*0.05),
              child: Container(
                width: _width,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5.0,
                    spreadRadius: 5.0
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      SizedBox(height: 25,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Create Account!',style: TextStyle(fontSize: 30,color: Colors.black,letterSpacing: 0.2),),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left:  _width * 0.05,right: _width *0.05),
                        child: w_textfield(
                          hint: 'Name',
                          onChanged: (v){
                            print(v);
                          },
                        ),
                      ),
                      SizedBox(
                        height: _height * 0.02,
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left:  _width * 0.05,right: _width *0.05),
                        child: w_textfield(
                          hint:'Email Id',
                          onChanged: (v){
                            print(v);
                          },
                        ),
                      ),
                      SizedBox(
                        height: _height * 0.02,
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left:  _width * 0.05,right: _width *0.05),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: _width * 0.005,left: _width * 0.025),
                              child: Container(
                                width: _width * 0.2,
                                child: w_dropdown(
                                  hint: '+91',
                                  onChanged: (value) {
                                    setState(() {
                                      _countryValue = value;
                                    });
                                  },
                                  list: _countryName,
                                  select: _countryValue,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                child: w_textfield(
                                  hint:'Phone Number',
                                  onChanged: (v){
                                    print(v);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: _height * 0.02,
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left:  _width * 0.05,right: _width *0.05),
                        child: w_textfield(
                          hint: 'Password',
                          onChanged: (v){
                            print(v);
                          },
                        ),
                      ),
                      SizedBox(
                        height: _height * 0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          w_signin_button(
                            title: 'Sign Up',
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return VerifyPage();
                                  },
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: _height * 0.02,
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left:  _width * 0.03,right: _width *0.03),
                        child: Row(
                          children: [
                          Checkbox(value: true,onChanged: (e){},),
                            Text('Agree with'),
                            Text(' T&C',style: TextStyle(color: Palette.primaryColor),),
                            Text(' and'),
                            Text(' Privacy Policy',style: TextStyle(color: Palette.primaryColor),),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: _height * 0.015,
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left:  _width * 0.05,right: _width *0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 1,
                              width: _width *0.33,
                              color: Colors.black.withOpacity(0.3),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: _width*0.01,right: _width*0.01),
                              child: Text('Or',style: TextStyle(color:Palette.primaryColor),),
                            ),
                            Container(
                              height: 1,
                              width: _width *0.33,
                              color: Colors.black.withOpacity(0.3),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5,bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.transparent,
                              child: Image.asset('assets/sign/facebook.png',fit: BoxFit.cover,),
                            ),
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.transparent,
                              child: Image.asset('assets/sign/google.png',fit: BoxFit.cover,),
                            ),
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.transparent,
                              child: Image.asset('assets/sign/apple.png',fit: BoxFit.cover,),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already Have an Account?",style: TextStyle(fontSize: 18,color: Colors.black,),),
                SizedBox(width: 10,),
                GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SigninPage();
                          },
                        ),
                      );
                    },
                    child: Text("Sign In!",style: TextStyle(fontSize: 18,color: Palette.primaryColor,fontWeight: FontWeight.bold),)),
              ],
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
