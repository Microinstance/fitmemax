import 'dart:convert';
import 'dart:io';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import "package:http/http.dart" as http;
import 'package:fitmemax/src/module/dashboard/Dashboard.dart';
import 'package:fitmemax/src/module/signin_signup/Forgotpage.dart';
import 'package:fitmemax/src/module/signin_signup/SignupPage.dart';
import 'package:fitmemax/src/widgets/palette.dart';
import 'package:fitmemax/src/widgets/w_background.dart';
import 'package:fitmemax/src/widgets/w_signin_button.dart';
import 'package:fitmemax/src/widgets/w_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:page_transition/page_transition.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  GoogleSignInAccount _currentUser;
  String _contactText;
  bool isLoginProsses = false;
  @override
  void initState() {
    super.initState();
    _googleSignIn.disconnect();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
  }

  String _pickFirstNamedContact(Map<String, dynamic> data) {
    final List<dynamic> connections = data['connections'];
    final Map<String, dynamic> contact = connections?.firstWhere(
      (dynamic contact) => contact['names'] != null,
      orElse: () => null,
    );
    if (contact != null) {
      final Map<String, dynamic> name = contact['names'].firstWhere(
        (dynamic name) => name['displayName'] != null,
        orElse: () => null,
      );
      if (name != null) {
        return name['displayName'];
      }
    }
    return null;
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

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
              height: _height * 0.06,
            ),
            Container(
              width: _width * 0.6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                      child: Image.asset(
                    'assets/logo/splash-Screen.png',
                    fit: BoxFit.fitWidth,
                  )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(_width * 0.05),
              child: Container(
                width: _width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 5.0, spreadRadius: 5.0),
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
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Welcome Back!',
                            style: TextStyle(fontSize: 30, color: Colors.black, letterSpacing: 0.2),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: _width * 0.05, right: _width * 0.05),
                        child: w_textfield(
                          hint: 'User Id',
                          lable: 'User Id',
                          onChanged: (v) {
                            print(v);
                          },
                        ),
                      ),
                      SizedBox(
                        height: _height * 0.02,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: _width * 0.05, right: _width * 0.05),
                        child: w_textfield(
                          hint: 'Password',
                          onChanged: (v) {
                            print(v);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: _width * 0.07, right: _width * 0.05),
                        child: Row(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: Forgotpage()));
                                },
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(color: Palette.primaryColor, fontSize: 18, fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          w_signin_button(
                            title: 'Sign In',
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  child: Dashboard(),
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
                        padding: EdgeInsets.only(left: _width * 0.05, right: _width * 0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 1,
                              width: _width * 0.33,
                              color: Colors.black.withOpacity(0.3),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: _width * 0.01, right: _width * 0.01),
                              child: Text(
                                'Or',
                                style: TextStyle(color: Palette.primaryColor),
                              ),
                            ),
                            Container(
                              height: 1,
                              width: _width * 0.33,
                              color: Colors.black.withOpacity(0.3),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                _handleFBSignIn();
                              },
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.transparent,
                                child: Image.asset(
                                  'assets/sign/facebook.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                _handleSignIn();
                              },
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.transparent,
                                child: Image.asset(
                                  'assets/sign/google.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.transparent,
                              child: Image.asset(
                                'assets/sign/apple.png',
                                fit: BoxFit.cover,
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
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't Have an Account?",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: SignupPage()));
                    },
                    child: Text(
                      "Sign Up!",
                      style: TextStyle(fontSize: 18, color: Palette.primaryColor, fontWeight: FontWeight.bold),
                    )),
              ],
            ),
            SizedBox(
              height: _height * 0.06,
            ),
          ],
        ),
      ),
      value: 0.0,
    );
  }

  void _handleFBSignIn() async {
    try {
      setState(() {
        isLoginProsses = true;
      });
      final facebookLogin = FacebookLogin();
      facebookLogin.logOut();
      if (Platform.isAndroid) {
        facebookLogin.loginBehavior = FacebookLoginBehavior.webViewOnly;
      }
      final result = await facebookLogin.logIn(['email']);
      print(result.status);
      switch (result.status) {
        case FacebookLoginStatus.loggedIn:
          final token = result.accessToken.token;
          final graphResponse =
              await http.get('https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture.height(512)&access_token=$token');
          //final profile = json.decode(graphResponse.body);
          print("Login SuccsessFull");

          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: Dashboard(),
            ),
          );

          break;
        case FacebookLoginStatus.cancelledByUser:
          break;
        case FacebookLoginStatus.error:
          break;
      }
      setState(() {
        isLoginProsses = false;
      });
    } catch (e) {
      print(e);
      if (mounted)
        setState(() {
          isLoginProsses = false;
        });
    }
  }
}
