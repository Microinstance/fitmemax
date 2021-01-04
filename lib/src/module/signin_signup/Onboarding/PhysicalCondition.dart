import 'package:fitmemax/src/module/dashboard/Dashboard.dart';
import 'package:fitmemax/src/module/signin_signup/Onboarding/MedicalCondition.dart';
import 'package:fitmemax/src/widgets/palette.dart';
import 'package:fitmemax/src/widgets/w_background.dart';
import 'package:fitmemax/src/widgets/w_dropdown.dart';
import 'package:fitmemax/src/widgets/w_signin_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class PhysicalCondition extends StatefulWidget {
  @override
  _PhysicalConditionState createState() => _PhysicalConditionState();
}

class _PhysicalConditionState extends State<PhysicalCondition> {
  double _userAge = 15;
  double _userHeight = 2.5;
  double _userWeight = 25;
  List _gender = ['Male', 'Femail'];
  List _bloodGroup = ['A+','A-','B+','B-','O+','O-','AB+','AB-'];
  String _genderValue;
  String _bloodGroupValue;
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
                          Text('Physical Condition',style: TextStyle(fontSize: 30,color: Colors.black,letterSpacing: 0.2),),
                        ],
                      ),
                      SizedBox(
                        height: 25 ,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Select your Age",style: GoogleFonts.lato(fontSize: 22,color: Colors.black),),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5,right: 5),
                        child: Slider(
                          min: 15,
                          max: 115,
                          value: _userAge,
                          onChanged: (age){
                            setState(() {
                              _userAge = age;
                            });
                          },
                          label: "${_userAge.toInt()}",
                          divisions: 100,
                          activeColor: Palette.primaryColor,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${_userAge.toInt()} years",style: GoogleFonts.lato(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Select your Height",style: GoogleFonts.lato(fontSize: 22,color: Colors.black),),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5,right: 5),
                        child: Slider(
                          min: 2.5,
                          max: 12.5,
                          value: _userHeight,
                          onChanged: (Height){
                            setState(() {
                              _userHeight = Height;
                            });
                          },
                          label: "${_userHeight}",
                          divisions: 100,
                          activeColor: Palette.primaryColor,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${_userHeight} ft",style: GoogleFonts.lato(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Select your Weight",style: GoogleFonts.lato(fontSize: 22,color: Colors.black),),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5,right: 5),
                        child: Slider(
                          min: 25,
                          max: 125,
                          value: _userWeight,
                          onChanged: (Weight){
                            setState(() {
                              _userWeight = Weight;
                            });
                          },
                          label: "${_userWeight}",
                          divisions: 1000,
                          activeColor: Palette.primaryColor,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${_userWeight}",style: GoogleFonts.lato(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15,right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: w_dropdown(
                                hint: 'Gender',
                                onChanged: (value) {
                                  setState(() {
                                    _genderValue = value;
                                  });
                                },
                                list: _gender,
                                select: _genderValue,
                              ),
                            ),
                            Container(
                              child: w_dropdown(
                                hint: 'Blood Group',
                                onChanged: (value) {
                                  setState(() {
                                    _bloodGroupValue = value;
                                  });
                                },
                                list: _bloodGroup,
                                select: _bloodGroupValue,
                              ),
                            ),
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
                            title: 'Continue',
                            onPressed: (){
                              Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: MedicalCondition()));
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
