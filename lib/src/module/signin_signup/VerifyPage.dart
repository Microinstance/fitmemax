import 'package:fitmemax/ApiProvider/apiProvider.dart';
import 'package:fitmemax/shared/shared.dart';
import 'package:fitmemax/src/module/signin_signup/Onboarding/PhysicalCondition.dart';
import 'package:fitmemax/src/widgets/palette.dart';
import 'package:fitmemax/src/widgets/w_background.dart';
import 'package:fitmemax/src/widgets/w_signin_button.dart';
import 'package:fitmemax/src/widgets/w_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pinput/pin_put/pin_put.dart';

class VerifyPage extends StatefulWidget {
  @override
  _VerifyPageState createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  bool isLoad = false;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    Widget animatingBorders() {
      BoxDecoration pinPutDecoration = BoxDecoration(
        border: Border.all(
          width: 2.0,
          color: Colors.black45,
        ),
        borderRadius: BorderRadius.circular(30),
      );
      return PinPut(
        onChanged: (val) {
          setState(() {
            _pinPutController.text = val;
          });
        },
        textStyle: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.w400,
        ),
        fieldsCount: 6,
        // eachFieldHeight: 60,
        // eachFieldWidth: 60,
        // focusNode: _pinPutFocusNode,
        submittedFieldDecoration:
            pinPutDecoration.copyWith(borderRadius: BorderRadius.circular(20)),
        pinAnimationType: PinAnimationType.slide,
        selectedFieldDecoration: pinPutDecoration,
        followingFieldDecoration: pinPutDecoration.copyWith(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2.0,
            color: Colors.black45,
          ),
        ),
      );
    }

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
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.all(_width * 0.05),
                child: Container(
                  width: _width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 5.0,
                          spreadRadius: 5.0),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView(
                      padding: EdgeInsets.only(
                          left: _width * 0.05, right: _width * 0.05),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Verify Account!',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black,
                                  letterSpacing: 0.2),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Check your Phone, we have sent you the Verification Code',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                            fontSize: 18,
                            color: Colors.black45,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        animatingBorders(),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            w_signin_button(
                              title: 'Verify',
                              onPressed: () async {
                                String token =
                                    await MySharedPreferences().gettoken();
                                String otp =
                                    await MySharedPreferences().getotp();
                                try {
                                  setState(() {
                                    isLoad = true;
                                  });
                                  var data = await ApiProvider().usersVerify(
                                      token, _pinPutController.text);
                                  if (data["success"] == true) {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType.fade,
                                            child: PhysicalCondition()));
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: data["message"]);
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
                              },
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Didn't receive Code?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      fontSize: 18,
                      color: Colors.black45,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      String token = await MySharedPreferences().gettoken();

                      try {
                        setState(() {
                          isLoad = true;
                        });
                        var data = await ApiProvider().usersResendOtp(token);
                        if (data["success"] == true) {
                           print(data["data"]["otp"]);
                          Fluttertoast.showToast(msg: data["message"]);
                        } else {
                          Fluttertoast.showToast(
                              msg: "Something went to wrong");
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
                    },
                    child: Text(
                      'Resend Code',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 18,
                        color: Palette.primaryColor,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
