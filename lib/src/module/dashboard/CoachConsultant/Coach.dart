import 'dart:ui';
import 'package:fitmemax/Objects/ButtonOne.dart';
import 'package:fitmemax/src/module/dashboard/CoachConsultant/CoachChange.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'CoachChangeTime.dart';
import 'CoachCurrent.dart';

class Coach extends StatefulWidget {
  @override
  _CoachState createState() => _CoachState();
}

class _CoachState extends State<Coach> {
  bool _isActive = false;
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
                Stack(
                  alignment: Alignment.topRight,
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
                    SafeArea(
                      child: Padding(
                        padding: EdgeInsets.only(right: 20.0, top: 5),
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (BuildContext context) {
                                return CoachChange();
                              },
                              isScrollControlled: true,
                            );
                          },
                          child: Container(
                            height: 35,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: borderRadious.primeryRadious,
                              border: Border.all(
                                  width: 1, color: ColorPalette.PrimaryColor),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.face,
                                    size: 18,
                                  ),
                                  Text("Change",
                                      style: TextStyles.RegulerPrimary),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
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
                      padding: const EdgeInsets.only(top: 15),
                      child: Container(
                        child: MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: ListView(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15),
                                child: Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: ColorPalette.GreyLightest,
                                    borderRadius: borderRadious.primeryRadious,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.calendar_today,
                                          size: 25,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Your Coach will call you on",
                                              style: TextStyles.BodyBlack,
                                            ),
                                            Text(
                                              "09:30 am, 6 Dec",
                                              style: TextStyles.RegulerBlack,
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                            onTap: () {
                                              showModalBottomSheet(
                                                backgroundColor:
                                                    Colors.transparent,
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return CoachChangeTime();
                                                },
                                                isScrollControlled: true,
                                              );
                                            },
                                            child: Icon(
                                              Icons.edit_outlined,
                                              size: 25,
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15, top: 15),
                                child: Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: ColorPalette.GreyLightest,
                                    borderRadius: borderRadious.primeryRadious,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15.0, right: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.call,
                                          size: 25,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text("Your Number",
                                                style: TextStyles.BodyBlack),
                                            Text("8250414042",
                                                style: TextStyles.RegulerBlack),
                                          ],
                                        ),
                                        Icon(
                                          Icons.edit_outlined,
                                          size: 25,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    right: 15, left: 15, top: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Get Reminder On Whatsapp",
                                        style: TextStyles.BodyBlack),
                                    Transform.scale(
                                      scale: 0.7,
                                      child: CupertinoSwitch(
                                        activeColor: ColorPalette.PrimaryColor,
                                        trackColor: ColorPalette.PrimaryColor
                                            .withOpacity(0.2),
                                        value: _isActive,
                                        onChanged: (bool value) {
                                          setState(() {
                                            _isActive = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 15, left: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.card_giftcard_outlined,
                                      color: ColorPalette.PrimaryColor,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text("What you Get Free For Free",
                                        style: TextStyles.RegulerBlack),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 240,
                                child: ListView(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 15),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 180,
                                            width: 300,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/Coach/coacvector3.png"),
                                                  fit: BoxFit.fitHeight,
                                                ),
                                                color: Colors.grey[100],
                                                borderRadius: borderRadious
                                                    .primeryRadious),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text("1 Consultation Coach Call",
                                              style: TextStyles.RegulerBlack),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text("Personalize Coach Call",
                                              style: TextStyles.BodyBlack),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 25),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 180,
                                            width: 300,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/Coach/coacvector2.png"),
                                                  fit: BoxFit.fitHeight,
                                                ),
                                                color: Colors.grey[100],
                                                borderRadius: borderRadious
                                                    .primeryRadious),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text("Diet Plan",
                                              style: TextStyles.RegulerBlack),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "To get a Healthy Version You",
                                            style: TextStyles.BodyBlack,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 25, right: 20),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 180,
                                            width: 300,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/Coach/coacvector1.png"),
                                                  fit: BoxFit.fitHeight,
                                                ),
                                                color: Colors.grey[100],
                                                borderRadius: borderRadious
                                                    .primeryRadious),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text("Workout Plan",
                                              style: TextStyles.RegulerBlack),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text("To meet your Fitness Goal",
                                              style: TextStyles.BodyBlack),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 100,
                              ),
                            ],
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
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: ButtonOne(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: CoachCurrent()));
                  },
                  colors: ColorPalette.PrimaryColor,
                  title: "Activate Free Trial",
                ),
              ),
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
        ],
      ),
    );
  }
}
