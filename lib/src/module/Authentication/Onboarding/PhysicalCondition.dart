import 'package:fitmemax/API/APIClient.dart';
import 'package:fitmemax/Objects/Backgrounds.dart';
import 'package:fitmemax/Objects/ButtonOne.dart';
import 'package:fitmemax/src/module/Authentication/Onboarding/MedicalCondition.dart';
import 'package:fitmemax/src/widgets/w_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:fitmemax/styles.dart';
import 'package:page_transition/page_transition.dart';

import '../../dashboard/Dashboard.dart';
import 'FitBookDetailsUpload.dart';
import 'GoalChoice.dart';

class PhysicalCondition extends StatefulWidget {
  @override
  _PhysicalConditionState createState() => _PhysicalConditionState();
}

class _PhysicalConditionState extends State<PhysicalCondition> {

  double _userAge = 15;
  double _userHeight = 2.5;
  double _userWeight = 25;
  List _gender = ['Male', 'Female', "Transgender"];
  List _bloodGroup = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];
  String _genderValue;
  String _bloodGroupValue;

  APIClient Client;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Client = new APIClient();
  }


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
                              'Physical Condition',
                              style: TextStyles.HeadingBlack,
                            ),
                          ],
                        ),
                      ),

                     Padding(
                       padding: const EdgeInsets.only(bottom: 10),
                       child: Column(
                         children: [
                           Padding(
                             padding: const EdgeInsets.only(left: 20,right: 20),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                                 Text(
                                     "Select your Age",
                                     style: TextStyles.RegulerBlack
                                 ),
                               ],
                             ),
                           ),
                           Stack(
                             overflow: Overflow.visible,
                             alignment: Alignment.bottomRight,
                             children: [
                               Padding(
                                 padding: const EdgeInsets.only(left: 2, right: 2),
                                 child: Slider(
                                   min: 15,
                                   max: 115,
                                   value: _userAge,
                                   onChanged: (age) {
                                     setState(() {
                                       _userAge = age;
                                     });
                                   },
                                   label: "${_userAge.toInt()}",
                                   divisions: 100,
                                   inactiveColor: ColorPalette.PrimaryColor.withOpacity(0.2),
                                   activeColor: ColorPalette.PrimaryColor,
                                 ),
                               ),
                               Positioned(
                                 bottom: -5,
                                 child: Padding(
                                   padding: const EdgeInsets.only(right: 25,top: 20),
                                   child: Text(
                                       "${_userAge.toInt()} years",
                                       style:TextStyles.BodyBlack
                                   ),
                                 ),
                               ),
                             ],
                           ),
                         ],
                       ),
                     ),

                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20,right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                      "Select your Height",
                                      style: TextStyles.RegulerBlack
                                  ),
                                ],
                              ),
                            ),
                            Stack(
                              overflow: Overflow.visible,
                              alignment: Alignment.bottomRight,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 2, right: 2),
                                  child: Slider(
                                    min: 2.5,
                                    max: 12.5,
                                    value: _userHeight,
                                    onChanged: (height) {
                                      setState(() {
                                        _userHeight = height;
                                      });
                                    },
                                    label: "${_userHeight}",
                                    divisions: 100,
                                    inactiveColor: ColorPalette.PrimaryColor.withOpacity(0.2),
                                    activeColor: ColorPalette.PrimaryColor,
                                  ),
                                ),
                                Positioned(
                                  bottom: -5,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 25,top: 20),
                                    child: Text(
                                        "${_userHeight} ft",
                                        style:TextStyles.BodyBlack
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20,right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                      "Select your Weight",
                                      style: TextStyles.RegulerBlack
                                  ),
                                ],
                              ),
                            ),
                            Stack(
                              overflow: Overflow.visible,
                              alignment: Alignment.bottomRight,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 2, right: 2),
                                  child: Slider(
                                    min: 25,
                                    max: 125,
                                    value: _userWeight,
                                    onChanged: (weight) {
                                      setState(() {
                                        _userWeight = weight;
                                      });
                                    },
                                    label: "${_userWeight}",
                                    divisions: 1000,
                                    inactiveColor: ColorPalette.PrimaryColor.withOpacity(0.2),
                                    activeColor: ColorPalette.PrimaryColor,
                                  ),
                                ),
                                Positioned(
                                  bottom: -5,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 25,top: 20),
                                    child: Text(
                                        "${_userWeight}",
                                        style:TextStyles.BodyBlack
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
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
                                onPressed: updatePhysicalCondition,
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
    );
  }

  updatePhysicalCondition() async {
    if(_bloodGroupValue == null){
      Client.error("Please select your blud group");
    } else if (_genderValue == null){
      Client.error("Please select your gender");
    } else {
      final currentUser = await Client.getLocal();
      print(currentUser);
      final request = await Client.storePhysicalCondition({
        'age' : _userAge.toString(),
        'height' : _userHeight.toString(),
        'weight' : _userHeight.toString(),
        'gender' : _genderValue.toString(),
        'blood_group' : _bloodGroupValue.toString(),
        'users_id' : currentUser['id'].toString()
      });
      if(request['status'] == "success"){

        final sendQuery = await Client.getProfileStatus(currentUser['id'].toString());
        final data = sendQuery['data'];

        final medical_condition = data['medical_condition'];
        final gole = data['gole'];
        final fitbookID = data['is_fitbook_id_set'];

        if(medical_condition == 0){
          Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: MedicalCondition()));
        } else if(gole == 0){
          Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: GoalChoice()));
        } else if(fitbookID == 0) {
          Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: FitBookDetailsUpload()));
        } else {
          Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: Dashboard()));
        }

      } else {
        Client.error(request['message']);
      }
    }

  }


}
