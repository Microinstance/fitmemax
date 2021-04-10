import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:fitmemax/src/module/dashboard/Dashboard.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:slider_button/slider_button.dart';

class Run extends StatefulWidget {
  @override
  _RunState createState() => _RunState();
}

class _RunState extends State<Run> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        brightness: Brightness.dark,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              PageTransition(
                type: PageTransitionType.topToBottom,
                child: Dashboard(),
              ),
            );
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 20,
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text( "Run  ", style: TextStyles.TitleWhite,),
              Icon(Icons.directions_run_rounded,size: 25,color: ColorPalette.Grediantblue2,),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: CalendarTimeline(
                initialDate: DateTime.now(),
                firstDate: DateTime(2021, 1, 1),
                lastDate: DateTime(2022, 12, 31),
                onDateSelected: (date) => print(date),
                leftMargin: 20,
                monthColor:  Colors.white,
                dayColor: ColorPalette.Grediantblue1,
                activeDayColor: Colors.white,
                activeBackgroundDayColor: ColorPalette.Grediantblue1,
                dotsColor: Colors.white,
                locale: 'en_IN',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
              child: Center(
                child: SliderButton(
                  vibrationFlag: false,
                  radius: 7.5,
                  buttonSize: 40,
                  height: 50,
                  width: _width-40,
                  baseColor: ColorPalette.Grediantblue1,
                  alignLabel:  Alignment(0, 0),
                  action: () {

                  },
                  label: Text(
                    "Slide Start Runing",
                    style: TextStyles.TitleWhite
                  ),
                  icon: Center(
                      child: Icon(
                        Icons.directions_run,
                        color: Colors.white,
                        size: 25.0,
                      )),

                  // radius: 10,
                  buttonColor: ColorPalette.Grediantblue2,
                  // borderRadius: borderRadious.primeryRadious,
                  backgroundColor: ColorPalette.Grediantblue2.withOpacity(0.2),
                  // backgroundColor: Color(0xff534bae),
                  // highlightedColor: Colors.white,
                  // baseColor: Colors.red,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 25),
              child: Row(
                children: [
                  Text("Running",style: TextStyles.ParaWhite,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
              child: Container(
                width: _width-40,
                decoration: BoxDecoration(
                  borderRadius: borderRadious.primeryRadious,
                  color: ColorPalette.Grediantblue2.withOpacity(0.2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.pin_drop_outlined,size: 20,color: ColorPalette.Grediantblue1,),
                          SizedBox(height: 7,),
                          Text("8.2",style: TextStyles.TitleWhite,),
                          SizedBox(height: 3,),
                          Text("Kilometers",style: TextStyles.BodySmallWhite,),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.lock_clock,size: 20,color: ColorPalette.Teal,),
                          SizedBox(height: 7,),
                          Text("2.6",style: TextStyles.TitleWhite,),
                          SizedBox(height: 3,),
                          Text("Hours",style: TextStyles.BodySmallWhite,),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.speed_rounded,size: 20,color: ColorPalette.Red,),
                          SizedBox(height: 7,),
                          Text("5.25",style: TextStyles.TitleWhite,),
                          SizedBox(height: 3,),
                          Text("Speed",style: TextStyles.BodySmallWhite,),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 25),
              child: Row(
                children: [
                  Text("Gym",style: TextStyles.ParaWhite,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
              child: Container(
                width: _width-40,
                height: 185,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          width: ((_width-40)/2)-10,
                          decoration: BoxDecoration(
                            borderRadius: borderRadious.primeryRadious,
                            color: ColorPalette.Grediantblue2.withOpacity(0.2),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20,top: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.favorite_border,color: ColorPalette.Red,size: 20,),
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
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Image.asset("assets/icon/graph.png",width: ((_width-40)/2)-10,),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 185/2-10,
                          width: ((_width-40)/2)-10,
                          decoration: BoxDecoration(
                            borderRadius: borderRadious.primeryRadious,
                            color: ColorPalette.Grediantblue2.withOpacity(0.2),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text("480",style: TextStyles.TitleWhite,),
                                    SizedBox(height: 3,),
                                    Text("Steps",style: TextStyles.BodySmallWhite,),
                                  ],
                                ),
                                Icon(CupertinoIcons.chart_bar,size: 30,color: ColorPalette.Grediantblue1,),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          height: 185/2-10,
                          width: ((_width-40)/2)-10,
                          decoration: BoxDecoration(
                            borderRadius: borderRadious.primeryRadious,
                            color: ColorPalette.Grediantblue2.withOpacity(0.2),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text("325",style: TextStyles.TitleWhite,),
                                    SizedBox(height: 3,),
                                    Text("Calories",style: TextStyles.BodySmallWhite,),
                                  ],
                                ),
                                Icon(Icons.accessibility_new_rounded,size: 30,color: ColorPalette.Teal,),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
