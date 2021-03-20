import 'package:fitmemax/Objects/Backgrounds.dart';
import 'package:fitmemax/Objects/ButtonOne.dart';
import 'package:fitmemax/src/module/Authentication/Onboarding/GoalChoice.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    return Backgrounds(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Container(
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 5.0,
                      spreadRadius: 5.0,
                    ),
                  ],
                  borderRadius: borderRadious.primeryRadious,
                ),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  removeBottom: true,
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15,bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Medical Condition',
                              style: TextStyles.HeadingBlack,
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 20,right: 12),
                        child: Column(
                          children: List.generate(7, (index) => SwitchList(titel: 'Thyroid',))
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: _width-90,
                              child: ButtonOne(
                                title: 'Continue',
                                colors: ColorPalette.PrimaryColor,
                                onPressed: ()  {
                                  Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: GoalChoice()));
                                },
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
          ],
        ),
      ),
    );;
  }
}
class SwitchList extends StatefulWidget {
  final String titel;
  SwitchList({this.titel});
  @override
  _SwitchListState createState() => _SwitchListState();
}

class _SwitchListState extends State<SwitchList> {
  bool _isOnline =  false;
  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
            widget.titel,
            style: TextStyles.RegulerBlack
        ),
        Transform.scale(
          scale: 0.7,
          child: CupertinoSwitch(
            activeColor: ColorPalette.PrimaryColor,
            trackColor: ColorPalette.PrimaryColor.withOpacity(0.2),
            value: _isOnline,
            onChanged: (bool value) { setState(() { _isOnline = value; }); },
          ),
        ),
      ],
    );
  }
}
