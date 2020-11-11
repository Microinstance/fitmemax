import 'package:fitmemax/src/module/signin_signup/SignupPage.dart';
import 'package:fitmemax/src/widgets/palette.dart';
import 'package:fitmemax/src/widgets/w_background.dart';
import 'package:fitmemax/src/widgets/w_signin_button.dart';
import 'package:fitmemax/src/widgets/w_textfield.dart';
import 'package:flutter/material.dart';

class Forgotpage extends StatefulWidget {
  @override
  _ForgotpageState createState() => _ForgotpageState();
}

class _ForgotpageState extends State<Forgotpage> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return w_background(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: _height * 0.06,
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
            SizedBox(height: 20,),
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
                    padding:  EdgeInsets.only(left:  _width * 0.05,right: _width *0.05),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Forgot Password?',style: TextStyle(fontSize: 30,color: Colors.black,letterSpacing: 0.2),),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Enter Your Email Id or Phone Number To Re-Create your Password',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                          fontSize: 18,
                          color: Colors.black45,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      w_textfield(
                        hint: 'User Id',
                        onChanged: (v){
                          print(v);
                        },
                      ),
                      SizedBox(
                        height: _height * 0.02,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          w_signin_button(
                            title: 'Verify',
                            onPressed: (){},
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't Have an Account?",style: TextStyle(fontSize: 18,color: Colors.black,),),
                SizedBox(width: 10,),
                GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SignupPage();
                          },
                        ),
                      );
                    },
                    child: Text("Sign Up!",style: TextStyle(fontSize: 18,color: Palette.primaryColor,fontWeight: FontWeight.bold),)),
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
