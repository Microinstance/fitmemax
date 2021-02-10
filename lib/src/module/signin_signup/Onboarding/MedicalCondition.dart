import 'package:fitmemax/ApiProvider/apiProvider.dart';
import 'package:fitmemax/shared/shared.dart';
import 'package:fitmemax/src/data/data2.dart';
import 'package:fitmemax/src/module/signin_signup/Onboarding/GoalChoice.dart';
import 'package:fitmemax/src/widgets/palette.dart';
import 'package:fitmemax/src/widgets/w_background.dart';
import 'package:fitmemax/src/widgets/w_signin_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter_spinkit/src/circle.dart';

class ConditionData {
  int id;
  String title;
  String status;
  bool isSelect;

  ConditionData({
    this.id,
    this.status,
    this.title,
    this.isSelect = false,
  });
}

class MedicalCondition extends StatefulWidget {
  @override
  _MedicalConditionState createState() => _MedicalConditionState();
}

class _MedicalConditionState extends State<MedicalCondition> {
  bool isLoading = false;

  List<ConditionData> lstConditionData = [];

  @override
  void initState() {
    super.initState();
    getMedicalConditionList();
  }

  var data;

  getMedicalConditionList() async {
    String token = await MySharedPreferences().gettoken();

    if (token != null && token != "") {
      // Calling Api
      try {
        setState(() {
          isLoading = true;
        });
        lstConditionData.clear();
        data = await ApiProvider().getUserMedicalCondition();
        if (data["success"] == true) {
          for (var i = 0; i < data["data"]["condition_data"].length; i++) {
            ConditionData objConditionData = new ConditionData();
            objConditionData.id = data["data"]["condition_data"][i]["id"];
            objConditionData.status = data["data"]["condition_data"][i]["status"];
            objConditionData.title = data["data"]["condition_data"][i]["title"];
            objConditionData.isSelect = false;

            lstConditionData.add(objConditionData);
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
    } else {
      Fluttertoast.showToast(msg: "Something went to wrong");
    }
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return w_background(
      child: ModalProgressHUD(
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
                              'Medical Condition',
                              style: TextStyle(fontSize: 30, color: Colors.black, letterSpacing: 0.2),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 15, top: 25, bottom: 25),
                          child: Column(
                            children: [
                              lstConditionData != null && lstConditionData.length > 0
                                  ? ListView.builder(
                                      itemCount: lstConditionData.length,
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (BuildContext context, int index) {
                                        return Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              lstConditionData[index].title,
                                              style: GoogleFonts.lato(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            swith(lstConditionData[index].isSelect, index),
                                          ],
                                        );
                                      },
                                    )
                                  : SizedBox(),
                              Row(
                                children: [
                                  Text(
                                    "None of this",
                                    style: GoogleFonts.lato(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(),
                                  ),
                                  Switch(
                                    value: noneOfThis,
                                    onChanged: (value) {
                                      setState(() {
                                        noneOfThis = !noneOfThis;
                                      });
                                      if (value)
                                        setState(() {
                                          lstConditionData.forEach((element) {
                                            element.isSelect = false;
                                          });
                                        });
                                    },
                                    activeColor: Palette.primaryColor,
                                  ),
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
      ),
      value: 0.0,
    );
  }

  bool noneOfThis = false;

  sendData() async {
    setState(() {
      isLoading = true;
    });
    if (!noneOfThis) {
      Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.fade,
          child: GoalChoice(),
        ),
      );
    } else {
      String medicalConditionId = '';

      lstConditionData.forEach((element) {
        if (element.isSelect) {
          setState(() {
            medicalConditionId = element.id.toString();
          });
        }
      });
      try {
        String token = await MySharedPreferences().gettoken();
        var data = await ApiProvider().userMedicalCondition(medicalConditionId, token);
        if (data != null && data["success"] == true) {
          Fluttertoast.showToast(msg: data["message"]);
          Navigator.pushReplacement(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: GoalChoice(),
            ),
          );
        }
      } catch (e) {
        print(e);
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  Widget swith(bool _value, int id) {
    return Switch(
      value: _value,
      onChanged: (value) {
        setState(() {
          lstConditionData.forEach((element) {
            if (element.id == id + 1) {
              element.isSelect = !element.isSelect;
            }
          });
          if (value) {
            noneOfThis = false;
          }
        });
      },
      activeColor: Palette.primaryColor,
    );
  }
}

class CustomSwitch extends StatefulWidget {
  final void Function(bool) callback;

  const CustomSwitch({Key key, this.callback}) : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _value,
      onChanged: (value) {
        setState(() {
          _value ? _value = false : _value = true;
        });
      },
      activeColor: Palette.primaryColor,
    );
  }
}
