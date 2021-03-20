import 'package:fitmemax/Objects/ButtonOne.dart';
import 'package:fitmemax/src/module/Authentication/Onboarding/PhysicalCondition.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pinput/pin_put/pin_put.dart';

class SignupVerify extends StatefulWidget {
  @override
  _SignupVerifyState createState() => _SignupVerifyState();
}

class _SignupVerifyState extends State<SignupVerify> {
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
                      Text("90:00",style: TextStyles.BodyGrey,),
                      Text("Resend OTP",style: TextStyles.BodyGrey,),
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
                        onPressed: ()  {
                          Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: PhysicalCondition()));
                        },
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
}
