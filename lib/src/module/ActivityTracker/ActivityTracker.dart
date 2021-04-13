import 'package:fitmemax/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                  padding: const EdgeInsets.only(top: 20,bottom: 25),
                  child: Container(
                    width: _width-40,
                    decoration: BoxDecoration(
                      color: ColorPalette.ActivityTrackerCard,
                      borderRadius: borderRadious.primeryRadious
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
                Padding(
                  padding: const EdgeInsets.only(left: 0,right: 0,top: 0),
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
                                  color: ColorPalette.ActivityTrackerCard,
                                  borderRadius: borderRadious.primeryRadious
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
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Image.asset("assets/icon/graph.png",width: ((_width-40)/2)-10,),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              width: ((_width-40)/2)-10,
                              decoration: BoxDecoration(
                                  color: ColorPalette.ActivityTrackerCard,
                                  borderRadius: borderRadious.primeryRadious
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
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Image.asset("assets/icon/graph.png",width: ((_width-40)/2)-10,),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,bottom: 50),
                  child: Row(
                    children: [
                      Container(
                        width: ((_width-40)/2)-10,
                        decoration: BoxDecoration(
                            color: ColorPalette.ActivityTrackerCard,
                            borderRadius: borderRadious.primeryRadious
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
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Container(
                            height: 185/2-10,
                            width: ((_width-40)/2)-10,
                            decoration: BoxDecoration(
                                color: ColorPalette.ActivityTrackerCard,
                                borderRadius: borderRadious.primeryRadious
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
                          SizedBox(height: 20,),
                          Container(
                            height: 185/2-10,
                            width: ((_width-40)/2)-10,
                            decoration: BoxDecoration(
                                color: ColorPalette.ActivityTrackerCard,
                                borderRadius: borderRadious.primeryRadious
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
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 15,top: 5),
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white.withOpacity(0.2),
                  child: Icon(Icons.arrow_back,
                    color: Colors.white,size: 20,),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
