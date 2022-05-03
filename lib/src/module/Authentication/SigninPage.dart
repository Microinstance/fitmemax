import 'package:fitmemax/API/APIClient.dart';
import 'package:fitmemax/Objects/Backgrounds.dart';
import 'package:fitmemax/Objects/ButtonOne.dart';
import 'package:fitmemax/Objects/PasswordFieldOne.dart';
import 'package:fitmemax/Objects/SocialButton.dart';
import 'package:fitmemax/Objects/TextFieldOne.dart';
import 'package:fitmemax/src/module/Authentication/Onboarding/GoalChoice.dart';
import 'package:fitmemax/src/module/Authentication/Onboarding/MedicalCondition.dart';
import 'package:fitmemax/src/module/Authentication/Onboarding/PhysicalCondition.dart';
import 'package:fitmemax/src/module/dashboard/Dashboard.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'ForgotPassword.dart';
import 'SignupPage.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';

import 'SocialSignUP.dart';

class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {

  APIClient Client;

  String email = "";
  String password = "";

  // Facebook
  final plugin = FacebookLogin(debug: true);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Client = new APIClient();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top, SystemUiOverlay.bottom]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
    ));
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Backgrounds(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(left: 15, right: 15,),
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
                              'Welcome Back!',
                              style: TextStyles.HeadingBlack,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20,top: 15),
                        child: TextFieldOne(
                          hint: 'Email Or Phone Number',
                          onChanged: (v) {
                            setState(() {
                              email = v;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20,top: 15),
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
                        padding: EdgeInsets.only(left:20, right: 15,top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    isDismissible: true,
                                    builder: (BuildContext context) {
                                      return ForgotPassword();
                                    },
                                    isScrollControlled: true,
                                  );
                                },
                                child: Text('Forgot Password?', style: TextStyles.BodyMediumPrimary,),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15,left: 20,right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: _width-90,
                              child: ButtonOne(
                                title: 'Sign In',
                                colors: ColorPalette.PrimaryColor,
                                onPressed: checkLogin,
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
                              onPressed: _onPressedLogInButton,
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
                    "Don't Have an Account?",
                    style: TextStyles.RegulerBlack,),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: SignupPage()));
                    },
                    child: Text(
                      "Sign Up!",
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

  checkLogin() async {
    if(email == ""){
      Client.error("Please enter email id");
    } else if(password == ""){
      Client.error("Please enter password");
    } else {
      var result = await Client.authRequest(email, password);
      print(result);
      if(result['status'] == "success"){

          final data = result['data'];
          // Store In Local Storage
          Client.storeLocal(data['mobile'], data['id'], data['email'], data['api_token'], data['name']);

          final physical_condition = data['profile']['physical_condition'];
          final medical_condition = data['profile']['medical_condition'];
          final gole = data['profile']['gole'];

          if(physical_condition == 0){
            Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: PhysicalCondition()));
          } else if(medical_condition == 0){
            Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: MedicalCondition()));
          } else if(gole == 0){
            Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: GoalChoice()));
          } else {
            Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: Dashboard()));
          }

      } else {
        Client.error(result['message']);
      }
    }
  }

  Future<void> _onPressedLogInButton() async {

    await plugin.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);

    final token = await plugin.accessToken;
    FacebookUserProfile profile;
    String email;
    String imageUrl;

    if (token != null) {
      profile = await plugin.getUserProfile();
      if (token.permissions.contains(FacebookPermission.email.name)) {
        email = await plugin.getUserEmail();
      }
      imageUrl = await plugin.getProfileImageUrl(width: 100);
    }

    print("Email ID");
    print(profile);

    final result = await Client.socialLogin({
      'email' : email.toString()
    });

    if(result['status'] == "success"){
      final physical_condition = result['data']['profile']['physical_condition'];
      final medical_condition = result['data']['profile']['medical_condition'];
      final gole = result['data']['profile']['gole'];

      if(physical_condition == 0){
        Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: PhysicalCondition()));
      } else if(medical_condition == 0){
        Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: MedicalCondition()));
      } else if(gole == 0){
        Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: GoalChoice()));
      } else {
        Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: Dashboard()));
      }
    } else {
      Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: SocialSignUp(email: email, name: profile.name,)));
    }

  }

}
