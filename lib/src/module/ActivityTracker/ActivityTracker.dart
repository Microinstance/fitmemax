import 'package:fitmemax/src/module/ActivityTracker/Activity.dart';
import 'package:fitmemax/src/module/ActivityTracker/ActivityHeartRate.dart';
import 'package:fitmemax/src/module/ActivityTracker/ActivitySleep.dart';
import 'package:fitmemax/src/module/ActivityTracker/ActivityWalkingRecord.dart';
import 'package:fitmemax/src/module/ActivityTracker/ActivityWeight.dart';
import 'package:fitmemax/src/module/CalTracker/CalTrackerDashboard.dart';
import 'package:fitmemax/src/module/Workout/Workout.dart';
import 'package:fitmemax/src/module/dashboard/Dashboard.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

class ActivityTracker extends StatefulWidget {
  @override
  _ActivityTrackerState createState() => _ActivityTrackerState();
}

class _ActivityTrackerState extends State<ActivityTracker> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorPalette.ActivityTrackerBlackBack,
      body: Stack(
        children: [
          Image.asset("assets/background/signin_up.png",width: _width,color: Colors.black,fit: BoxFit.fitWidth,height: 400,),
          SingleChildScrollView(
            padding: EdgeInsets.only(left: 20,right: 20),
            physics: ClampingScrollPhysics(),
            child: Column(
              children: [
                SafeArea(child: SizedBox()),
                Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   RichText(text: TextSpan(
                     children: [
                       TextSpan(
                         text: "Good Morning",
                         style: TextStyles.ParaWhite,
                       ),
                       TextSpan(
                         text: "  ",
                         style: TextStyles.TitleWhite,
                       ),
                       TextSpan(
                         text: "Shivay",
                         style: TextStyles.TitleWhite,
                       ),
                     ]
                   )),
                 ],
               ),
                Padding(
                 padding: const EdgeInsets.only(top: 8),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     RichText(text: TextSpan(
                       children: [
                         TextSpan(
                           text: "26 march, 2021",
                           style: TextStyles.BodyWhite,
                         ),
                       ]
                     )),
                   ],
                 ),
               ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          PageTransition(
                              type:
                              PageTransitionType
                                  .fade,
                              child:
                              ActivityWalkingRecord()));
                    },
                    child: Container(
                      width: _width-40,
                      decoration: BoxDecoration(
                        color: ColorPalette.ActivityTrackerCard,
                        borderRadius: borderRadious.secendaryRadious
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom:25),
                        child: Column(
                          children: [
                            Text("Walking Record",style: TextStyles.RegulerBIGWhite,),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: CircularProgressIndicator(
                                        value: 0.75,
                                        strokeWidth: 8,
                                        backgroundColor: Colors.white.withOpacity(0.2),
                                        valueColor: AlwaysStoppedAnimation<Color>(ColorPalette.Grediantblue1),
                                      ),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: "720",
                                            style: TextStyles.TitleWhite,
                                          ),
                                          TextSpan(
                                            text: "\nSteps",
                                            style: TextStyles.BodySmallWhite,
                                          ),
                                        ],
                                      ),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontFamily: 'Karla'
                                      ),
                                    ),
                                  ],
                                ),
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: CircularProgressIndicator(
                                        value: 0.75,
                                        strokeWidth: 8,
                                        backgroundColor: Colors.white.withOpacity(0.2),
                                        valueColor: AlwaysStoppedAnimation<Color>(ColorPalette.Grediantblue2),
                                      ),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: "120",
                                            style: TextStyles.TitleWhite,
                                          ),
                                          TextSpan(
                                            text: "\nMins",
                                            style: TextStyles.BodySmallWhite,
                                          ),
                                        ],
                                      ),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontFamily: 'Karla'
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20,top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type:
                                          PageTransitionType
                                              .fade,
                                          child:
                                          ActivityHeartRate()));
                                },
                                child: Container(
                                  height: 185,
                                  width: ((_width-40)/2)-10,
                                  decoration: BoxDecoration(
                                      color: ColorPalette.ActivityTrackerCard,
                                      borderRadius: borderRadious.secendaryRadious
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20,top: 20,right: 20),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Heart Rate",style: TextStyles.ParaWhite,),
                                            Icon(Icons.favorite_border,color: ColorPalette.Red,size: 20,),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 15),
                                          child: Row(
                                            children: [
                                              Text("88",style: TextStyles.TitleWhite,),
                                              Text("  bpm",style: TextStyles.BodySmallWhite,),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Image.asset("assets/icon/graph.png",width: ((_width-40)/2)-10,),
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type:
                                      PageTransitionType
                                          .fade,
                                      child:
                                      CalTrackerDashboard()));
                            },
                            child: Container(
                              width: ((_width-40)/2)-10,
                              decoration: BoxDecoration(
                                  color: ColorPalette.ActivityTrackerCard,
                                  borderRadius: borderRadious.secendaryRadious
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20,top: 20,right: 20,bottom: 25),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Calorie",style: TextStyles.ParaWhite,),
                                        Icon(Icons.whatshot,color: ColorPalette.GrediantRed2,size: 20,),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            SizedBox(
                                              height: ((_width-40)/2)-10 - 65,
                                              width: ((_width-40)/2)-10 - 65,
                                              child: CircularProgressIndicator(
                                                value: 0.6,
                                                strokeWidth: 8,
                                                backgroundColor: Colors.white.withOpacity(0.2),
                                                valueColor: AlwaysStoppedAnimation<Color>(ColorPalette.GrediantRed2),
                                              ),
                                            ),
                                            Text.rich(
                                              TextSpan(
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: "560",
                                                    style: TextStyles.TitleWhite,
                                                  ),
                                                  TextSpan(
                                                    text: "\nkCal",
                                                    style: TextStyles.BodySmallWhite,
                                                  ),
                                                ],
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Container(
                            height: 185/2-10,
                            width: ((_width-40)/2)-10,
                            decoration: BoxDecoration(
                                color: ColorPalette.ActivityTrackerCard,
                                borderRadius: borderRadious.secendaryRadious
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: "720",
                                          style: TextStyles.TitleWhite,
                                        ),
                                        TextSpan(
                                          text: "  ",
                                          style: TextStyles.BodySmallWhite,
                                        ),
                                        TextSpan(
                                          text: "kCal",
                                          style: TextStyles.BodySmallWhite,
                                        ),
                                        TextSpan(
                                          text: "\nBurnt",
                                          style: TextStyles.BodySmallWhite,
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: CircularProgressIndicator(
                                      value: 0.50,
                                      strokeWidth: 3,
                                      backgroundColor: Colors.white.withOpacity(0.2),
                                      valueColor: AlwaysStoppedAnimation<Color>(ColorPalette.GrediantRed1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Container(
                            height: 185/2-10,
                            width: ((_width-40)/2)-10,
                            decoration: BoxDecoration(
                                color: ColorPalette.ActivityTrackerCard,
                                borderRadius: borderRadious.secendaryRadious
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: "1256",
                                          style: TextStyles.TitleWhite,
                                        ),
                                        TextSpan(
                                          text: "  ",
                                          style: TextStyles.BodySmallWhite,
                                        ),
                                        TextSpan(
                                          text: "ml",
                                          style: TextStyles.BodySmallWhite,
                                        ),
                                        TextSpan(
                                          text: "\nWater Drink",
                                          style: TextStyles.BodySmallWhite,
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  Image.asset("assets/icon/watter.png",height: 25,color: Colors.blue,),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: ((_width-40)/2)-10,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: DigitalClock(
                                digitAnimationStyle: Curves.elasticOut,
                                is24HourTimeFormat: false,
                                areaDecoration: BoxDecoration(
                                  border: Border.all(color: Colors.transparent),
                                  color: Colors.transparent,
                                ),
                                hourMinuteDigitDecoration: BoxDecoration(
                                    border: Border.all(color: Colors.transparent),
                                ),
                                secondDigitDecoration: BoxDecoration(
                                  border: Border.all(color: Colors.transparent),
                                ),
                                hourMinuteDigitTextStyle: TextStyles.TitleWhite,
                                amPmDigitTextStyle: TextStyles.BodySmallWhite,
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(height: 20,),
                          Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type:
                                          PageTransitionType
                                              .fade,
                                          child:
                                          ActivityWeight()));
                                },
                                child: Container(
                                  height: 185,
                                  width: ((_width-40)/2)-10,
                                  decoration: BoxDecoration(
                                      color: ColorPalette.ActivityTrackerCard,
                                      borderRadius: borderRadious.secendaryRadious
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20,top: 20,right: 20,),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Weight",style: TextStyles.ParaWhite,),
                                            Icon(Icons.accessibility_new_rounded,color: ColorPalette.Grediantblue1,size: 20,),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 15),
                                          child: Row(
                                            children: [
                                              Text("71",style: TextStyles.TitleWhite,),
                                              Text("  kg",style: TextStyles.BodySmallWhite,),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Image.asset("assets/icon/graph.png",width: ((_width-40)/2)-10,),
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type:
                                      PageTransitionType
                                          .fade,
                                      child:
                                      Workout()));
                            },
                            child: Container(
                              height: 185/2-10,
                              width: ((_width-40)/2)-10,
                              decoration: BoxDecoration(
                                  color: ColorPalette.ActivityTrackerCard,
                                  borderRadius: borderRadious.secendaryRadious
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: "720",
                                            style: TextStyles.TitleWhite,
                                          ),
                                          TextSpan(
                                            text: "  ",
                                            style: TextStyles.BodySmallWhite,
                                          ),
                                          TextSpan(
                                            text: "min",
                                            style: TextStyles.BodySmallWhite,
                                          ),
                                          TextSpan(
                                            text: "\nWorkout",
                                            style: TextStyles.BodySmallWhite,
                                          ),
                                        ],
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    Icon(CupertinoIcons.chart_bar,size: 30,color: ColorPalette.Grediantblue1,),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type:
                                      PageTransitionType
                                          .fade,
                                      child:
                                      ActivitySleep()));
                            },
                            child: Container(
                              height: 185/2-10,
                              width: ((_width-40)/2)-10,
                              decoration: BoxDecoration(
                                  color: ColorPalette.ActivityTrackerCard,
                                  borderRadius: borderRadious.secendaryRadious
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: "8.2",
                                            style: TextStyles.TitleWhite,
                                          ),
                                          TextSpan(
                                            text: "  ",
                                            style: TextStyles.BodySmallWhite,
                                          ),
                                          TextSpan(
                                            text: "Hours",
                                            style: TextStyles.BodySmallWhite,
                                          ),
                                          TextSpan(
                                            text: "\nSleep",
                                            style: TextStyles.BodySmallWhite,
                                          ),
                                        ],
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    Icon(CupertinoIcons.moon,size: 30,color: ColorPalette.GreyLightest,),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type:
                                      PageTransitionType
                                          .fade,
                                      child:
                                      Activity()));
                            },
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Container(
                                  height: 185,
                                  width: ((_width-40)/2)-10,
                                  decoration: BoxDecoration(
                                      color: ColorPalette.ActivityTrackerCard,
                                      borderRadius: borderRadious.secendaryRadious
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20,top: 20,right: 20),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Activity",style: TextStyles.ParaWhite,),
                                            Icon(Icons.access_alarm,color: ColorPalette.PrimaryColor,size: 20,),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 15),
                                          child: Row(
                                            children: [
                                              Text("76",style: TextStyles.TitleWhite,),
                                              Text("  min",style: TextStyles.BodySmallWhite,),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Image.asset("assets/icon/graph.png",width: ((_width-40)/2)-10,),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Container(
                    width: _width-40,
                    decoration: BoxDecoration(
                        color: ColorPalette.ActivityTrackerCard,
                        borderRadius: borderRadious.secendaryRadious
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                           children: [
                             Text("Level",style: TextStyles.FluracentGreenMedium,),
                             SizedBox(height: 5,),
                             Text("3",style: TextStyles.TitleWhite,),
                           ],
                         ),
                          Column(
                            children: [
                              Text("Match wins",style: TextStyles.FluracentGreenMedium,),
                              SizedBox(height: 5,),
                              Text("15",style: TextStyles.TitleWhite,),
                            ],
                          ),
                          Column(
                            children: [
                              Text("Points Earned",style: TextStyles.FluracentGreenMedium,),
                              SizedBox(height: 5,),
                              Text("47",style: TextStyles.TitleWhite,),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 15,top: 5),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type:
                            PageTransitionType
                                .fade,
                            child:
                            Dashboard()));
                  },
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.white.withOpacity(0.2),
                    child: Icon(Icons.arrow_back,
                      color: Colors.white,size: 20,),
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
class _clock extends StatefulWidget {
  @override
  __clockState createState() => __clockState();
}

class __clockState extends State<_clock> {
  DateTime now ;
  @override
  void initState() {
    setState(() {
      now = DateTime.now();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Text("${now.hour.toString() + ":" + now.minute.toString() + ":" + now.second.toString()}",style: TextStyles.TitleWhite,textAlign: TextAlign.center,);
  }
}
