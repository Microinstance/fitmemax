import 'package:fitmemax/src/data/data2.dart';
import 'package:fitmemax/src/module/dashboard/Dashboard.dart';
import 'package:fitmemax/src/widgets/w_background.dart';
import 'package:fitmemax/src/widgets/w_signin_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import 'MedicalCondition.dart';

class GoalChoice extends StatefulWidget {
  bool LoseWeight = false ;
  bool BuildMuscle = false ;
  bool BeMoreActive = false ;

  @override
  _GoalChoiceState createState() => _GoalChoiceState();
}

class _GoalChoiceState extends State<GoalChoice> {
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
                          Text('Goal',style: TextStyle(fontSize: 30,color: Colors.black,letterSpacing: 0.2),),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30,right: 15,top: 25,bottom: 25),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Lose Weight",style: GoogleFonts.lato(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w500),),
                                CustomSwitch(),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Build Muscle",style: GoogleFonts.lato(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w500),),
                                CustomSwitch(),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Be More Active",style: GoogleFonts.lato(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w500),),
                                CustomSwitch(),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          w_signin_button(
                            title: 'Continue',
                            onPressed: (){
                              Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: Dashboard()));
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
