import 'dart:convert';
import 'dart:io';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fitmemax/ApiProvider/apiProvider.dart';
import 'package:fitmemax/shared/shared.dart';

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

  String userId = "";
  String password = "";

  // bool isLoad = false;

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null) {
        _handleGetContact();
      }
    });
    _googleSignIn.signInSilently();
  }

  Future<void> _handleGetContact() async {
    setState(() {
      _contactText = "Loading contact info...";
    });
    final http.Response response = await http.get(
      'https://people.googleapis.com/v1/people/me/connections'
      '?requestMask.includeField=person.names',
      headers: await _currentUser.authHeaders,
    );
    if (response.statusCode != 200) {
      setState(() {
        _contactText = "People API gave a ${response.statusCode} "
            "response. Check logs for details.";
      });
      print('People API ${response.statusCode} response: ${response.body}');
      return;
    }
    final Map<String, dynamic> data = json.decode(response.body);
    final String namedContact = _pickFirstNamedContact(data);
    setState(() {
      if (namedContact != null) {
        _contactText = "I see you know $namedContact!";
      } else {
        _contactText = "No contacts to display.";
      }
    });
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
    setState(() {
      isLoginProsses = true;
    });
    try {
      await _googleSignIn.signIn();
      setState(() {
        isLoginProsses = false;
      });
    } catch (error) {
      print(error);
    } finally {
      setState(() {
        isLoginProsses = false;
      });
    }
  }

  Future<void> _appleSignIn() async {
    setState(() {
      isLoginProsses = true;
    });
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        webAuthenticationOptions: WebAuthenticationOptions(
          clientId: 'com.aboutyou.dart_packages.sign_in_with_apple.example',
          redirectUri: Uri.parse(
            'https://flutter-sign-in-with-apple-example.glitch.me/callbacks/sign_in_with_apple',
          ),
        ),
        nonce: 'example-nonce',
        state: 'example-state',
      );

      print(credential);

      final signInWithAppleEndpoint = Uri(
        scheme: 'https',
        host: 'flutter-sign-in-with-apple-example.glitch.me',
        path: '/sign_in_with_apple',
        queryParameters: <String, String>{
          'code': credential.authorizationCode,
          'firstName': credential.givenName,
          'lastName': credential.familyName,
          'useBundleId': Platform.isIOS || Platform.isMacOS ? 'true' : 'false',
          if (credential.state != null) 'state': credential.state,
        },
      );

      final session = await http.Client().post(
        signInWithAppleEndpoint,
      );
      print(session);
      setState(() {
        isLoginProsses = false;
      });
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isLoginProsses = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
    ));
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return ModalProgressHUD(
      inAsyncCall: isLoginProsses,
      progressIndicator: SpinKitCircle(
        itemBuilder: (BuildContext context, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: Palette.x1Color,
            ),
          );
        },
      ),
      child: w_background(
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
                      ),
                    ),
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
                              setState(() {
                                userId = v;
                              });
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
                              setState(() {
                                password = v;
                              });
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
                              onPressed: () async {
                                if (checkValidation()) {
                                  try {
                                    setState(() {
                                      isLoginProsses = true;
                                    });
                                    var data = await ApiProvider().userLogin(userId, password);
                                    if (data["status"] == "success") {
                                      print(data["data"]["otp"]);
                                      await MySharedPreferences()
                                          .setUserData(data["data"]["otp"].toString(), data["data"]["api_token"], data["data"]["id"].toString());
                                      Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.fade,
                                          child: Dashboard(),
                                        ),
                                      );
                                    } else {
                                      Fluttertoast.showToast(
                                        msg: data["message"],
                                      );
                                    }
                                    setState(() {
                                      isLoginProsses = false;
                                    });
                                  } catch (e) {
                                    setState(() {
                                      isLoginProsses = false;
                                    });
                                  } finally {
                                    setState(() {
                                      isLoginProsses = false;
                                    });
                                  }
                                }
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
                              InkWell(
                                onTap: () {
                                  _appleSignIn();
                                },
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.transparent,
                                  child: Image.asset(
                                    'assets/sign/apple.png',
                                    fit: BoxFit.cover,
                                  ),
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
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: _height * 0.06,
              ),
            ],
          ),
        ),
        value: 0.0,
      ),
    );
  }

  bool checkValidation() {
    if (userId == null || userId == "") {
      Fluttertoast.showToast(msg: "pleas enter Id");
      return false;
    } else if (password == null || password == "") {
      Fluttertoast.showToast(msg: "pleas enter password");
      return false;
    }
    return true;
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
