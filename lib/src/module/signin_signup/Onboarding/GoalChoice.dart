import 'package:fitmemax/src/widgets/w_background.dart';
import 'package:fitmemax/src/widgets/w_signin_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:fitmemax/ApiProvider/apiProvider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter_spinkit/src/circle.dart';
import 'package:fitmemax/src/widgets/palette.dart';
import 'package:fitmemax/shared/shared.dart';
import 'package:fitmemax/src/module/signin_signup/Onboarding/FitBookDetailsUpload.dart';

class GoalData {
  int id;
  String title;
  String status;
  bool isSelect;

  GoalData({
    this.id,
    this.status,
    this.title,
    this.isSelect = false,
  });
}

class GoalChoice extends StatefulWidget {
  bool LoseWeight = false;
  bool BuildMuscle = false;
  bool BeMoreActive = false;

  @override
  _GoalChoiceState createState() => _GoalChoiceState();
}

class _GoalChoiceState extends State<GoalChoice> {
  bool isLoading = false;
  List<GoalData> lstGoalData = [];

  var data;

  @override
  void initState() {
    super.initState();
    getGoalList();
  }

  getGoalList() async {
    try {
      setState(() {
        isLoading = true;
      });
      lstGoalData.clear();
      data = await ApiProvider().getUserMedicalCondition();
      if (data["success"] == true) {
        for (var i = 0; i < data["data"]["condition_data"].length; i++) {
          GoalData objGoalData = new GoalData();
          objGoalData.id = data["data"]["condition_data"][i]["id"];
          objGoalData.status = data["data"]["condition_data"][i]["status"];
          objGoalData.title = data["data"]["condition_data"][i]["title"];
          objGoalData.isSelect = false;
          lstGoalData.add(objGoalData);
        }
      } else {
        // Tost Api Error
        Fluttertoast.showToast(msg: data["message"]);
      }
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      progressIndicator: SpinKitCircle(
        itemBuilder: (BuildContext context, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: Palette.x1Color,
            ),
          );
        },
      ),
      child: w_background(
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
                      ),
                    ),
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
                              'Goal',
                              style: TextStyle(fontSize: 30, color: Colors.black, letterSpacing: 0.2),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 15, top: 25, bottom: 25),
                          child: Column(
                            children: [
                              lstGoalData != null && lstGoalData.length > 0
                                  ? ListView.builder(
                                      itemCount: lstGoalData.length,
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (BuildContext context, int index) {
                                        return Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              lstGoalData[index].title,
                                              style: GoogleFonts.lato(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            swith(lstGoalData[index].isSelect, index),
                                          ],
                                        );
                                      },
                                    )
                                  : SizedBox(),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            w_signin_button(
                              title: 'Continue',
                              onPressed: () {
                                sendData();
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        value: 0.0,
      ),
    );
  }

  sendData() async {
    setState(() {
      isLoading = true;
    });
    String medicalConditionId = '';
    lstGoalData.forEach((element) {
      if (element.isSelect) {
        setState(() {
          medicalConditionId = element.id.toString();
        });
      }
    });
    if (medicalConditionId != null && medicalConditionId != "") {
      try {
        String token = await MySharedPreferences().gettoken();
        var data = await ApiProvider().userMedicalCondition(medicalConditionId, token);
        if (data != null && data["success"] == true) {
          Fluttertoast.showToast(msg: data["message"]);
          Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: FitBookDetailsUpload()));
        }
      } catch (e) {
        print(e);
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    } else {
      Fluttertoast.showToast(msg: "Select goal");
    }
  }

  Widget swith(bool _value, int id) {
    return Switch(
      value: _value,
      onChanged: (value) {
        setState(() {
          lstGoalData.forEach((element) {
            element.isSelect = false;
            if (element.id == id + 1) {
              element.isSelect = true;
            }
          });
        });
      },
      activeColor: Palette.primaryColor,
    );
  }
}
