import 'package:fitmemax/src/widgets/palette.dart';
import 'package:fitmemax/src/widgets/w_background.dart';
import 'package:fitmemax/src/widgets/w_signin_button.dart';
import 'package:fitmemax/src/widgets/w_textfield.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';

class VerifyPage extends StatefulWidget {
  @override
  _VerifyPageState createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _pinPutController = TextEditingController();
    final FocusNode _pinPutFocusNode = FocusNode();
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
        textStyle: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.w400,
        ),
        fieldsCount: 4,
        eachFieldHeight: 60,
        eachFieldWidth: 60,
        // focusNode: _pinPutFocusNode,
        // controller: _pinPutController,
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
                        Text('Verify Account!',style: TextStyle(fontSize: 30,color: Colors.black,letterSpacing: 0.2),),
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
              Text(
                'Resend Code',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  fontSize: 18,
                  color: Palette.primaryColor,
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
    );
  }
}
