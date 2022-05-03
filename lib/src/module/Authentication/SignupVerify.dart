import 'dart:async';

import 'package:fitmemax/API/APIClient.dart';
import 'package:fitmemax/Objects/ButtonOne.dart';
import 'package:fitmemax/src/module/Authentication/Onboarding/PhysicalCondition.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pinput/pin_put/pin_put.dart';

class SignupVerify extends StatefulWidget {

  final String name;
  final String email;
  final String phone;
  final String password;

  SignupVerify({this.name, this.email, this.password, this.phone});

  @override
  _SignupVerifyState createState() => _SignupVerifyState();
}

class _SignupVerifyState extends State<SignupVerify> {

  APIClient client;
  String user_otp = "";
  String error_msg = "";
  String oneTimePassword;

  int _counter = 60;
  Timer _timer;
  void _startTimer() {
    _counter = 60;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_counter > 0) {
        setState(() {
          _counter--;
        });
      } else {
        _timer.cancel();
      }
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    client = new APIClient();
    sendOTP();
    _startTimer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController _pinPutController = TextEditingController();
    final FocusNode _pinPutFocusNode = FocusNode();
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    Widget animatingBorders() {
      BoxDecoration pinPutDecoration = BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: ColorPalette.Grey,
        ),
        borderRadius: BorderRadius.circular(5),
      );
      return PinPut(
        onChanged: (v){
          setState(() {
            user_otp = v;
          });
        },
        textStyle: TextStyles.TitleBlack,
        fieldsCount: 6,
        eachFieldHeight: 40,
        eachFieldWidth: 40,
        submittedFieldDecoration:
        pinPutDecoration.copyWith(borderRadius: BorderRadius.circular(20)),
        pinAnimationType: PinAnimationType.slide,
        selectedFieldDecoration: pinPutDecoration,
        followingFieldDecoration: pinPutDecoration.copyWith(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1.0,
            color: ColorPalette.Grey,
          ),
        ),
      );
    }

    return Padding(
      padding:EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListView(
          padding: EdgeInsets.only(left: 20,right: 20,bottom: 40),
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15,bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 7,
                    width: 50,
                    decoration: BoxDecoration(
                      color: ColorPalette.Grey.withOpacity(0.3),
                      borderRadius: borderRadious.primeryRadious,
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Enter OTP",style: TextStyles.HeadingBlack,),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(error_msg,style: TextStyle(color: Colors.red),),
                  ],
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: animatingBorders(),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("$_counter",style: TextStyles.BodyGrey,),
                      GestureDetector(
                        onTap: () async {
                          await reSendOTP();
                        },
                          child: Text("Resend OTP",style: TextStyles.BodyGrey,)
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: _width-40,
                      child: ButtonOne(
                        title: 'Varify',
                        colors: ColorPalette.PrimaryColor,
                        onPressed:verify,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  reSendOTP() async {
    if(_counter == 0){
      final otpService = await client.sendOTP({ 'phone' : widget.phone});
      client.success("Otp is sent to your phone number");
      setState(() {
        oneTimePassword = otpService['data']['otp'].toString();
      });
      _startTimer();
    } else {
      client.error("Please weight sometime");
    }
  }

  sendOTP() async {
    final otpService = await client.sendOTP({ 'phone' : widget.phone});
    client.success("Otp is sent to your phone number");
    setState(() {
      oneTimePassword = otpService['data']['otp'].toString();
    });
  }

  verify() async {
    if(user_otp == ""){
      client.error("Please enter otp");
    } else {
      if(user_otp == oneTimePassword){
        final result = await client.signUp({
          'name' : widget.name,
          'email' : widget.email,
          'phone' : widget.phone,
          'password' : widget.password
        });
        if(result['status'] == "success"){
          client.storeLocal(widget.phone, result['data']['id'], result['data']['email'], result['data']['api_token'], widget.name);
          Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: PhysicalCondition()));
        } else {
          client.error(result['data'].toString());
        }
      } else {
        client.error("Please enter correct otp");
      }
    }
  }

}
