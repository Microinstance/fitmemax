import 'package:fitmemax/Objects/Backgrounds.dart';
import 'package:fitmemax/Objects/ButtonOne.dart';
import 'package:fitmemax/Objects/PasswordFieldOne.dart';
import 'package:fitmemax/Objects/SocialButton.dart';
import 'package:fitmemax/Objects/TextFieldOne.dart';
import 'package:fitmemax/src/module/Authentication/SigninPage.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';

import 'SignupVerify.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

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
                        child: TextFieldOne(
                          hint: 'Name',
                          onChanged: (v) {
                            print(v);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20,top: 10),
                        child: TextFieldOne(
                          hint: 'Email Id',
                          onChanged: (v) {
                            print(v);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20,top: 10),
                        child: TextFieldOne(
                          hint: 'Phone Number',
                          onChanged: (v) {
                            print(v);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20,top: 10),
                        child: PasswordFieldOne(
                          hint: 'Password',
                          onChanged: (v) {
                            print(v);
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
                                onPressed: ()  {
                                  showModalBottomSheet(
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    isDismissible: true,
                                    builder: (BuildContext context) {
                                      return SignupVerify();
                                    },
                                    isScrollControlled: true,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20,top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 1,
                              width: (_width/2)-80,
                              color: Colors.black.withOpacity(0.3),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5, right: 5),
                              child: Text(
                                'Or',
                                style: TextStyles.BodyMediumPrimary,
                              ),
                            ),
                            Container(
                              height: 1,
                              width: (_width/2)-80,
                              color: Colors.black.withOpacity(0.3),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20,top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SocialButton(
                              colors: Colors.black,
                              onPressed: ()  {

                              },
                              image:  'assets/sign/apple.png',
                            ),
                            SocialButton(
                              colors: Colors.blue[900],
                              onPressed: ()  {

                              },
                              image: 'assets/sign/facebook.png',
                            ),
                            SocialButton(
                              colors: ColorPalette.GreyLightest,
                              onPressed: ()  {

                              },
                              image:  'assets/sign/google.png',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Already Have an Account?",
                    style: TextStyles.RegulerBlack,),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: SigninPage()));
                    },
                    child: Text(
                      "Sign In!",
                      style: TextStyles.BodyMediumPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
