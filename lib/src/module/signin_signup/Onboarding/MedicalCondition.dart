import 'package:fitmemax/src/data/data2.dart';
import 'package:fitmemax/src/module/signin_signup/Onboarding/GoalChoice.dart';
import 'package:fitmemax/src/widgets/palette.dart';
import 'package:fitmemax/src/widgets/w_background.dart';
import 'package:fitmemax/src/widgets/w_signin_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class MedicalCondition extends StatefulWidget {
  @override
  _MedicalConditionState createState() => _MedicalConditionState();
}

class _MedicalConditionState extends State<MedicalCondition> {
  @override
  Widget build(BuildContext context) {
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
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      SizedBox(height: 25,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Medical Condition',style: TextStyle(fontSize: 30,color: Colors.black,letterSpacing: 0.2),),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30,right: 15,top: 25,bottom: 25),
                        child: Column(
                          children: [
                          Container(
                            child: ListView.builder(
                              itemCount: Data().MedicalCC.length,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index){
                                return  Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("${Data().MedicalCC[index]['disease']}",style: GoogleFonts.lato(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w500),),
                                    CustomSwitch(),
                                  ],
                                );
                              },
                            ),
                          )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          w_signin_button(
                            title: 'Continue',
                            onPressed: (){
                              Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: GoalChoice()));
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 25,),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      value: 0.0,
    );
  }
}
class CustomSwitch extends StatefulWidget {
  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _value,
      onChanged: (value){
        setState(() {
          _value ? _value = false : _value = true;
        });
      },
      activeColor: Palette.primaryColor,
      // activeTrackColor: Palette.primaryColor,
    );
  }
}
