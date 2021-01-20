import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitmemax/src/module/dashboard/CoachConsultant/CoachPick.dart';
import 'package:fitmemax/src/module/dashboard/plan/PlanDetails.dart';
import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:page_transition/page_transition.dart';

class Plan extends StatefulWidget {
  @override
  _PlanState createState() => _PlanState();
}

class _PlanState extends State<Plan> {
  final PageController _pageController = PageController(initialPage: 0);
  int _current = 0;
  int page = 0;
  LiquidController liquidController;
  UpdateType updateType;
  pageChangeCallback(int lpage) {
    setState(() {
      page = lpage;
    });
  }

  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (BuildContext context) {
              return _ChatWithUs();
            },
            isScrollControlled: false,
          );
        },
        backgroundColor: Colors.red[800],
        child: Icon(Icons.chat),
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              overflow: Overflow.visible,
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 200,
                  child: LiquidSwipe(
                    enableLoop: true,
                    pages: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: <Color>[Colors.red[700], Colors.red[300]],
                          ),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              color: Colors.transparent,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 15.0, top: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Set Goal. Crush it.\nRepeat',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Roboto',
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      'Get up to 50% OFF + extra FLAT 20% OFF\non Premium Plan',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontFamily: 'Roboto'),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    MaterialButton(
                                        height: 28,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        color: Colors.white,
                                        child: Text(
                                          'AVAIL OFFER',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Roboto',
                                              color: Colors.purple),
                                        ),
                                        onPressed: () {}
                                        ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: Container(
                                  height: 25,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.red[800],
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10)),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "20% OFF",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontFamily: 'Roboto'),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 60,
                              right: 30,
                              child: Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: AssetImage("assets/plans/slide1.png"),
                                  fit: BoxFit.cover,
                                )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: <Color>[
                              Colors.purple[700],
                              Colors.purpleAccent,
                            ],
                          ),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              color: Colors.transparent,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 15.0, top: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'My ailments were a\nwake-up call for me',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Roboto'),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "Thanks to my coaches I'm free of\nhypertension",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontFamily: 'Roboto'),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    MaterialButton(
                                        height: 28,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        color: Colors.white,
                                        child: Text(
                                          'Get To Know How',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Roboto',
                                              color: Colors.purple),
                                        ),
                                        onPressed: () {}),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                height: 200,
                                width: 130,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.elliptical(300, 500),
                                        bottomLeft:
                                            Radius.elliptical(300, 500)),
                                    image: DecorationImage(
                                      image: AssetImage("assets/plans/p1.png"),
                                      fit: BoxFit.cover,
                                    )),
                                child: Center(
                                    // child: Text("20% OFF",style: TextStyle(color: Colors.white,fontSize: 13,fontFamily:'Roboto' ),),
                                    ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: <Color>[
                              Colors.orange[700],
                              Colors.orangeAccent[200],
                            ],
                          ),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              color: Colors.transparent,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 15.0, top: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                       Text(
                                      'Chooser the right plan',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Roboto'),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "Get help to find the plan that's\nright for you!",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontFamily: 'Roboto'),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    MaterialButton(
                                        height: 28,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        color: Colors.white,
                                        child: Text(
                                          'Tap To Chat',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Roboto',
                                              color: Colors.purple),
                                        ),
                                        onPressed: () {}),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 30, right: 15),
                                child: Container(
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image:
                                        AssetImage("assets/plans/slide2.png"),
                                    fit: BoxFit.cover,
                                  )),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                    onPageChangeCallback: pageChangeCallback,
                    waveType: WaveType.liquidReveal,
                    liquidController: liquidController,
                    // ignoreUserGestureWhileAnimating: true,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      for (int i = 0; i < 3; i++)
                        if (i == page)
                          OnboardingDots2(true)
                        else
                          OnboardingDots2(false)
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "Recomended Plans For You",
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            SizedBox(
              height: 20,
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                initialPage: 0,
                enlargeCenterPage: true,
                autoPlay: true,
                reverse: false,
                enableInfiniteScroll: true,
                autoPlayInterval: Duration(seconds: 2),
                autoPlayAnimationDuration: Duration(milliseconds: 2000),
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
              items: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: PlanDetails()));
                  },
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Container(
                            height: 200,
                            width: _width - (_width * 0.05) * 2,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    blurRadius: 3,
                                    spreadRadius: 1)
                              ],
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: <Color>[
                                  Colors.blue[700],
                                  Colors.blue[300],
                                ],
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(15)),
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
                      // Image.asset("assets/plans/plan1.png"),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: PlanDetails()));
                  },
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                          height: 200,
                          width: _width - (_width * 0.05) * 2,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 3,
                                  spreadRadius: 1)
                            ],
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: <Color>[
                                Colors.red[700],
                                Colors.red[300],
                              ],
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
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
                      // Image.asset("assets/plans/plan1.png"),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: PlanDetails()));
                  },
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                          height: 200,
                          width: _width - (_width * 0.05) * 2,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 3,
                                  spreadRadius: 1)
                            ],
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: <Color>[
                                Colors.orange[700],
                                Colors.orange[300],
                              ],
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
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
                      // Image.asset("assets/plans/plan1.png"),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              height: 20,
              color: Colors.grey.withOpacity(0.1),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "Best Selling Plans",
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 420.0,
                viewportFraction: 0.65,
                initialPage: 0,
                enlargeCenterPage: true,
                autoPlay: false,
                reverse: false,
                enableInfiniteScroll: true,
                autoPlayInterval: Duration(seconds: 2),
                autoPlayAnimationDuration: Duration(milliseconds: 2000),
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  setState(
                    () {
                      _current = index;
                    },
                  );
                },
              ),
              items: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      overflow: Overflow.visible,
                      children: [
                        Container(
                          height: 360,
                          width: 260,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 3,
                                  spreadRadius: 1)
                            ],
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Container(
                                  height: 100,
                                  width: 230,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF00008b),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 3,
                                          spreadRadius: 1)
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Cross Fit Training",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 30,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.3),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.1),
                                                blurRadius: 3,
                                                spreadRadius: 1)
                                          ],
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "2099/-",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 30, right: 30, top: 20, bottom: 30),
                                child: Container(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 15),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.star_half_outlined,
                                              color: Colors.yellow[700],
                                              size: 20,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Flexible(
                                                child: Text(
                                              "45 Days Training",
                                              style: TextStyle(
                                                  fontSize: _width * 0.04,
                                                  fontWeight: FontWeight.w600),
                                            )),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 15),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.star_half_outlined,
                                              color: Colors.yellow[700],
                                              size: 20,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Flexible(
                                                child: Text(
                                              "1 Consultation Call",
                                              style: TextStyle(
                                                  fontSize: _width * 0.04,
                                                  fontWeight: FontWeight.w600),
                                            )),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 15),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.star_half_outlined,
                                              color: Colors.yellow[700],
                                              size: 20,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Flexible(
                                                child: Text(
                                              "Diet Plan",
                                              style: TextStyle(
                                                  fontSize: _width * 0.04,
                                                  fontWeight: FontWeight.w600),
                                            )),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 15),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.star_half_outlined,
                                              color: Colors.yellow[700],
                                              size: 20,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Flexible(
                                                child: Text(
                                              "24/7 Support",
                                              style: TextStyle(
                                                  fontSize: _width * 0.04,
                                                  fontWeight: FontWeight.w600),
                                            )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: -25,
                          child: MaterialButton(
                            height: 50,
                            onPressed: () {
                              Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: PlanDetails()));
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: Color(0xFF00008b),
                            child: Text(
                              "Get Best Offer",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      overflow: Overflow.visible,
                      children: [
                        Container(
                          height: 360,
                          width: 260,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 3,
                                  spreadRadius: 1)
                            ],
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Container(
                                  height: 100,
                                  width: 230,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF734f96),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 3,
                                          spreadRadius: 1)
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Cross Fit Training",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 30,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.3),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.1),
                                                blurRadius: 3,
                                                spreadRadius: 1)
                                          ],
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "2099/-",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 30, right: 30, top: 20, bottom: 30),
                                child: Container(
                                  // height: 280,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 15),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.star_half_outlined,
                                              color: Colors.yellow[700],
                                              size: 20,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Flexible(
                                                child: Text(
                                              "45 Days Training",
                                              style: TextStyle(
                                                  fontSize: _width * 0.04,
                                                  fontWeight: FontWeight.w600),
                                            )),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 15),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.star_half_outlined,
                                              color: Colors.yellow[700],
                                              size: 20,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Flexible(
                                                child: Text(
                                              "1 Consultation Call",
                                              style: TextStyle(
                                                  fontSize: _width * 0.04,
                                                  fontWeight: FontWeight.w600),
                                            )),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 15),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.star_half_outlined,
                                              color: Colors.yellow[700],
                                              size: 20,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Flexible(
                                                child: Text(
                                              "Diet Plan",
                                              style: TextStyle(
                                                  fontSize: _width * 0.04,
                                                  fontWeight: FontWeight.w600),
                                            )),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 15),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.star_half_outlined,
                                              color: Colors.yellow[700],
                                              size: 20,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Flexible(
                                                child: Text(
                                              "24/7 Support",
                                              style: TextStyle(
                                                  fontSize: _width * 0.04,
                                                  fontWeight: FontWeight.w600),
                                            )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: -25,
                          child: MaterialButton(
                            height: 50,
                            onPressed: () {
                              Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: PlanDetails()));
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: Color(0xFF734f96),
                            child: Text(
                              "Get Best Offer",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      overflow: Overflow.visible,
                      children: [
                        Container(
                          height: 360,
                          width: 260,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 3,
                                  spreadRadius: 1)
                            ],
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Container(
                                  height: 100,
                                  width: 230,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF0b504f),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 3,
                                          spreadRadius: 1)
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Cross Fit Training",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 30,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.3),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.1),
                                                blurRadius: 3,
                                                spreadRadius: 1)
                                          ],
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "2099/-",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 30, right: 30, top: 20, bottom: 30),
                                child: Container(
                                  // height: 280,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 15),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.star_half_outlined,
                                              color: Colors.yellow[700],
                                              size: 20,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Flexible(
                                                child: Text(
                                              "45 Days Training",
                                              style: TextStyle(
                                                  fontSize: _width * 0.04,
                                                  fontWeight: FontWeight.w600),
                                            )),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 15),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.star_half_outlined,
                                              color: Colors.yellow[700],
                                              size: 20,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Flexible(
                                                child: Text(
                                              "1 Consultation Call",
                                              style: TextStyle(
                                                  fontSize: _width * 0.04,
                                                  fontWeight: FontWeight.w600),
                                            )),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 15),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.star_half_outlined,
                                              color: Colors.yellow[700],
                                              size: 20,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Flexible(
                                                child: Text(
                                              "Diet Plan",
                                              style: TextStyle(
                                                  fontSize: _width * 0.04,
                                                  fontWeight: FontWeight.w600),
                                            )),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 15),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.star_half_outlined,
                                              color: Colors.yellow[700],
                                              size: 20,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Flexible(
                                                child: Text(
                                              "24/7 Support",
                                              style: TextStyle(
                                                  fontSize: _width * 0.04,
                                                  fontWeight: FontWeight.w600),
                                            )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: -25,
                          child: MaterialButton(
                            height: 50,
                            onPressed: () {
                              Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: PlanDetails()));
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: Color(0xFF0b504f),
                            child: Text(
                              "Get Best Offer",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              height: 20,
              color: Colors.grey.withOpacity(0.1),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.only(right: 20, left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 80,
                    child: Image.asset(
                      "assets/plans/wallet.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your Credit Balance",
                        style: TextStyle(
                            fontSize: 16, color: Colors.black.withOpacity(0.6)),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "\$0",
                        style: TextStyle(
                            fontSize: 25, color: Colors.black.withOpacity(0.9)),
                      ),
                    ],
                  ),
                  Text(
                    "Earn More",
                    style: TextStyle(fontSize: 18, color: Palette.primaryColor),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 20,
              color: Colors.grey.withOpacity(0.1),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "Our Team of World Class Coach",
              style:
                  TextStyle(fontSize: 18, color: Colors.black.withOpacity(0.8)),
            ),
            Container(
              height: 230,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 25, bottom: 10),
                          child: Container(
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 64,
                                  backgroundColor: Colors.pinkAccent[100],
                                  child: CircleAvatar(
                                    radius: 62,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      radius: 60,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/coachs/coachs1.png"),
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Latika Arorra",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Yoga Coach",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black.withOpacity(0.5)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: CoachPick()));
              },
              height: 35,
              color: Colors.black.withOpacity(0.8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Text(
                " View More Coaches ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              height: 20,
              color: Colors.grey.withOpacity(0.1),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "Our Champions",
              style:
                  TextStyle(fontSize: 20, color: Colors.black.withOpacity(0.8)),
            ),
            SizedBox(
              height: 20,
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                initialPage: 0,
                enlargeCenterPage: false,
                viewportFraction: 1,
                autoPlay: true,
                reverse: false,
                enableInfiniteScroll: true,
                autoPlayInterval: Duration(seconds: 2),
                autoPlayAnimationDuration: Duration(milliseconds: 2000),
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
              items: [
                Container(
                  height: 200,
                  width: _width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("assets/plans/champ1.png"),
                    fit: BoxFit.cover,
                  )),
                ),
                Container(
                  height: 200,
                  width: _width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("assets/plans/champ1.png"),
                    fit: BoxFit.cover,
                  )),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );

  }
  Widget _ChatWithUs(){
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 15,left: 20,bottom: 30,right: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Need More Help?",style: TextStyle(color: Colors.black,fontSize: 22),),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Row(
                    children: [
                      Icon(
                        Icons.chat,size: 40,color: Colors.purple,
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left:10.0),
                        child: Text("Chat with us",style: TextStyle(color: Colors.black,fontSize: 20),),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_sharp,size: 25,color: Colors.purple,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



class OnboardingDots2 extends StatelessWidget {
  bool isActive;
  OnboardingDots2(this.isActive);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 3.3),
      height: isActive ? 10 : 10,
      width: isActive ? 10 : 10,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.transparent,
        border: isActive
            ? Border.all(
                color: Colors.white,
                width: 0,
              )
            : Border.all(
                color: Colors.white,
                width: 1.5,
              ),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
