import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitmemax/src/module/HealthLog/HealthLogDetails.dart';
import 'package:fitmemax/src/module/dashboard/Dashboard.dart';
import 'package:fitmemax/src/module/dashboard/plan/PlanDetails.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class HealthLog extends StatefulWidget {
  @override
  _HealthLogState createState() => _HealthLogState();
}

class _HealthLogState extends State<HealthLog> {
  int _current = 0;
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
        centerTitle: true,
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
        title: RichText(
          text: TextSpan(
              children: [
                TextSpan(
                  text:  "Health ",
                  style: TextStyles.TitleWhite,
                ),
                TextSpan(
                  text:    "Log",
                  style: TextStyles.TitlePink,
                ),
              ]
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 42,
                        backgroundColor: ColorPalette.Pink,
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage("images/userImage2.jpeg"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Shivay Gorai",style: TextStyles.TitleWhite,),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text("BMI  ",style: TextStyles.ParaWhite,),
                                Icon(CupertinoIcons.arrow_up_right_circle,size: 20,color: ColorPalette.Red,),
                                Text("   ( 85 )",style: TextStyles.BodyWhite,),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  IconButton(icon: Icon(Icons.camera,color: ColorPalette.FluracentGreen,size: 25,), onPressed: (){})
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 25,bottom: 0),
              child: Container(
                child: GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    childAspectRatio: 1/0.6,
                    mainAxisSpacing: 15.0,
                    crossAxisSpacing: 30.0,
                    children:[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.whatshot_rounded,size: 20,color: ColorPalette.Pink,),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Calories Tracker",style: TextStyles.BodyGrey,),
                          SizedBox(
                            height: 3,
                          ),
                          RichText(text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "785",
                                  style: TextStyles.TitleWhite,
                                ),
                                TextSpan(
                                  text: "  cal",
                                  style: TextStyles.BodyGrey,
                                ),
                              ]
                          ))
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.whatshot_rounded,size: 20,color: Colors.blue,),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Watter Tracker",style: TextStyles.BodyGrey,),
                          SizedBox(
                            height: 3,
                          ),
                          RichText(text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "40",
                                  style: TextStyles.TitleWhite,
                                ),
                                TextSpan(
                                  text: "  oz",
                                  style: TextStyles.BodyGrey,
                                ),
                              ]
                          ))
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.whatshot_rounded,size: 20,color: Colors.orange,),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Workout Tracker",style: TextStyles.BodyGrey,),
                          SizedBox(
                            height: 3,
                          ),
                          RichText(text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "157",
                                  style: TextStyles.TitleWhite,
                                ),
                                TextSpan(
                                  text: "  min",
                                  style: TextStyles.BodyGrey,
                                ),
                              ]
                          ))
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.whatshot_rounded,size: 20,color: ColorPalette.Red,),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Heart Tracker",style: TextStyles.BodyGrey,),
                          SizedBox(
                            height: 3,
                          ),
                          RichText(text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "150",
                                  style: TextStyles.TitleWhite,
                                ),
                                TextSpan(
                                  text: "  bpm",
                                  style: TextStyles.BodyGrey,
                                ),
                              ]
                          ))
                        ],
                      ),
                    ]
                ),
              ),
            ),

            MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: Container(
                height: 230,
                child: ListView.builder(
                  itemCount: 3,
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index){
                    if(index == 0){
                      return Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: HealthLogDetails()));
                          },
                          child: Container(
                            height: 230,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: borderRadious.primeryRadious,
                                color: Colors.blue,
                                gradient: LinearGradient(
                                  colors: [
                                    ColorPalette.GrediantRed2,
                                    ColorPalette.GrediantRed1,
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                )
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                      radius: 22,
                                      backgroundColor: Colors.white.withOpacity(0.1),
                                      child: Center(child: Image.asset("assets/icon/watter.png",height: 25))),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Text("Blood Presure",style: TextStyles.TitleWhite,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text("30%",style: TextStyles.BodyWhite,),
                                  ),
                                  Spacer(),
                                  Text("141/91 mmhg",style: TextStyles.BodyWhite,),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    } else return Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        height: 230,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: borderRadious.primeryRadious,
                            color: Colors.white.withOpacity(0.05),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                  radius: 22,
                                  backgroundColor: Colors.white.withOpacity(0.1),
                                  child: Center(child: Image.asset("assets/icon/watter.png",height: 25))),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text("Blood Presure",style: TextStyles.TitleWhite,),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text("30%",style: TextStyles.BodyWhite,),
                              ),
                              Spacer(),
                              Text("141/91 mmhg",style: TextStyles.BodyWhite,),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Text("Recomended Plans For you",style: TextStyles.TitleWhite,),
            ),

            Column(
              children: List.generate(3, (index) => GestureDetector(
                onTap: (){
                  Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: PlanDetails()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,top: 25),
                  child: Container(
                      height: 160,
                      width: _width -40,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: <Color>[
                            ColorPalette.Grediantblue1,
                            ColorPalette.Grediantblue2,
                          ],
                        ),
                        borderRadius: borderRadious.primeryRadious,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 25, left: 15, right: 20, bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hypertension Plan",
                              style: TextStyle(
                                  fontSize: 23,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                  fontFamily: 'Roboto'),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "USD80/m",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1,
                                  fontFamily: 'Roboto'),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Flexible(
                                child: Text(
                                  "2 Premiere Hypertension Coaches, Unlimited Consultation Calls, Unlimited On-on-one Chat",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 1,
                                      fontFamily: 'Roboto'),
                                )),
                          ],
                        ),
                      )),
                ),
              ),),
            ),

            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
