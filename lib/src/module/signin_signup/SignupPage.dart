import 'package:fitmemax/ApiProvider/apiProvider.dart';
import 'package:fitmemax/shared/shared.dart';
import 'package:fitmemax/src/module/signin_signup/SigninPage.dart';
import 'package:fitmemax/src/module/signin_signup/VerifyPage.dart';
import 'package:fitmemax/src/widgets/palette.dart';
import 'package:fitmemax/src/widgets/w_background.dart';
import 'package:fitmemax/src/widgets/w_dropdown.dart';
import 'package:fitmemax/src/widgets/w_signin_button.dart';
import 'package:fitmemax/src/widgets/w_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:page_transition/page_transition.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  List _countryName = ['+91', '+1', '+11', '+33'];
  String _countryValue;

  String name = "";
  String email = "";
  String phone = "";
  String password = "";

  bool isLoad = false;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
    ));
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return w_background(
      child: ModalProgressHUD(
        inAsyncCall: isLoad,
       progressIndicator: SpinKitCircle(
        itemBuilder: (BuildContext context, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: Palette.x1Color,
            ),
          );
        },
      ),
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
                              'Create Account!',
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
                            textInputType: TextInputType.text,
                            hint: 'Name',
                            onChanged: (v) {
                              print(v);
                              setState(() {
                                name = v;
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
                            textInputType: TextInputType.emailAddress,
                            hint: 'Email Id',
                            onChanged: (v) {
                              print(v);
                              setState(() {
                                email = v;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: _height * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: _width * 0.05, right: _width * 0.05),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: _width * 0.005, left: _width * 0.025),
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
                                    textInputType: TextInputType.number,
                                    hint: 'Phone Number',
                                    onChanged: (v) {
                                      print(v);
                                      setState(() {
                                        phone = _countryValue == null || _countryValue == "" ? "+91" + v : _countryValue + v;
                                      });
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
                          padding: EdgeInsets.only(left: _width * 0.05, right: _width * 0.05),
                          child: w_textfield(
                            textInputType: TextInputType.visiblePassword,
                            hint: 'Password',
                            onChanged: (v) {
                              setState(() {
                                password = v;
                              });
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
                              onPressed: () async {
                                // Call Register Api
                                if (checkValidation()) {
                                  try {
                                    setState(() {
                                      isLoad = true;
                                    });
                                    var data = await ApiProvider().userRegistration(email, name, password, phone);
                                    if (data["status"] == "success") {
                                      print(data["data"]["otp"]);
                                      await MySharedPreferences()
                                          .setUserData(data["data"]["otp"].toString(), data["data"]["api_token"], data["data"]["id"].toString());
                                      Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.fade,
                                          child: VerifyPage(),
                                        ),
                                      );
                                    } else {
                                      Fluttertoast.showToast(
                                        msg: data["data"][0],
                                      );
                                    }
                                    setState(() {
                                      isLoad = false;
                                    });
                                  } catch (e) {
                                    setState(() {
                                      isLoad = false;
                                    });
                                  } finally {
                                    setState(() {
                                      isLoad = false;
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
                          padding: EdgeInsets.only(left: _width * 0.03, right: _width * 0.03),
                          child: Row(
                            children: [
                              Checkbox(
                                value: true,
                                onChanged: (e) {},
                              ),
                              Text('Agree with'),
                              Text(
                                ' T&C',
                                style: TextStyle(color: Palette.primaryColor),
                              ),
                              Text(' and'),
                              Text(
                                ' Privacy Policy',
                                style: TextStyle(color: Palette.primaryColor),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: _height * 0.015,
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
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.transparent,
                                child: Image.asset(
                                  'assets/sign/facebook.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.transparent,
                                child: Image.asset(
                                  'assets/sign/google.png',
                                  fit: BoxFit.cover,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already Have an Account?",
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
                        Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: SigninPage()));
                      },
                      child: Text(
                        "Sign In!",
                        style: TextStyle(fontSize: 18, color: Palette.primaryColor, fontWeight: FontWeight.bold),
                      )),
                ],
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
      value: 0.0,
    );
  }

  bool checkValidation() {
    if (email == null || email == "") {
      Fluttertoast.showToast(msg: "pleas enter email");
      return false;
    } else if (password == null || password == "") {
      Fluttertoast.showToast(msg: "pleas enter password");
      return false;
    } else if (name.trim() == null || name.trim() == "") {
      Fluttertoast.showToast(msg: "enter name.");
      return false;
    } else if (phone.trim() == null || phone.trim() == "") {
      Fluttertoast.showToast(msg: "enter valid phone number");
      return false;
    }
    return true;
  }
}
