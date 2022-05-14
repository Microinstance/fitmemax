import 'package:fitmemax/src/module/dashboard/CoachConsultant/Coach.dart';
import 'package:fitmemax/src/module/dashboard/CoachConsultant/CoachPick.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:fitmemax/src/module/dashboard/profile/Chat/page/ProfileChatPage.dart';
import 'package:fitmemax/src/module/dashboard/CoachConsultant/DietPlan.dart';


class CoachCurrent extends StatefulWidget {
  @override
  _CoachCurrentState createState() => _CoachCurrentState();
}

class _CoachCurrentState extends State<CoachCurrent> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/coachs/coach1.png"),
                        fit: BoxFit.fitHeight,
                      ),
                      color: ColorPalette.GreyLightest,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(7.5),
                          bottomLeft: Radius.circular(7.5))),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              "Shweta Dube",
                              style: TextStyles.TitleBlack,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              "Your Fitness Coach For 7 Days",
                              style: TextStyles.RegulerPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15,top: 15),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color:ColorPalette.GreyLightest,
                          borderRadius: borderRadious.primeryRadious
                        ),
                        child: Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.chat,
                                  size: 25,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Massage Shweta Dube",
                                        style: TextStyles.RegulerBlack
                                      ),
                                      Text(
                                        "Balance Plan - Redefine yourself",
                                        style:  TextStyles.BodyBlack
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15,top: 15),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: ColorPalette.GreyLightest,
                          borderRadius: borderRadious.primeryRadious
                        ),
                        child: Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.call,
                                  size: 25,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "No Upcoming Consultation Call",
                                      style: TextStyles.RegulerBlack
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15,top: 15),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: ColorPalette.GreyLightest,
                          borderRadius: borderRadious.primeryRadious,
                        ),
                        child: Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.fastfood_sharp,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                GestureDetector(
                                  onTap: (){Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => DietPlan()),
                                  );},
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Diet Plan",
                                        style: TextStyles.RegulerBlack
                                      ),
                                      Text(
                                        "Click Here to access Diet plan ",
                                        style: TextStyles.BodyBlack
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, top: 5),
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    backgroundColor: Colors.white,
                    elevation: 1,
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15,left: 20,right: 20),
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: borderRadious.primeryRadious,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 3,
                          spreadRadius: 3,
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 5, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: _width * 0.85 * 0.7,
                          child: Row(
                            children: [
                              Flexible(
                                  child: Text(
                                    "3 Days Remaining on your Free Trial, Go Premium Now",
                                    style: TextStyles.RegulerBlack,
                                  )),
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      child: CoachPick()));
                            },
                            icon: Icon(
                              Icons.arrow_forward_rounded,
                              size: 20,
                            )),
                      ],
                    ),
                  ),
                ),
              )
            ),
          ),
        ],
      ),
    );
  }
}
