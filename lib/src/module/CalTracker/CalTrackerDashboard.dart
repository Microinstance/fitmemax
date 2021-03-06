import 'package:fitmemax/src/module/CalTracker/CalSettings.dart';
import 'package:fitmemax/src/module/CalTracker/FoodAdd.dart';
import 'package:fitmemax/src/module/CalTracker/MacrsCharts.dart';
import 'package:fitmemax/src/widgets/WaterTankChart.dart';
import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_date_picker_timeline/flutter_date_picker_timeline.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import 'GoPremium.dart';
import 'MicrosCharts.dart';

class CalTrackerDashboard extends StatefulWidget {
  @override
  _CalTrackerDashboardState createState() => _CalTrackerDashboardState();
}

class _CalTrackerDashboardState extends State<CalTrackerDashboard> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ));
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Palette.primaryColor,
              centerTitle: true,
              pinned: false,
              expandedHeight: 300,
              floating: false,
              flexibleSpace: FlexibleSpaceBar(
                background: SafeArea(
                  child: Stack(
                    overflow: Overflow.visible,
                    children: [
                      Container(
                        width: _width,
                        color: Palette.primaryColor,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 25),
                              child: SleekCircularSlider(
                                appearance: CircularSliderAppearance(
                                  animationEnabled: true,
                                  customWidths: CustomSliderWidths(
                                      trackWidth: 3,
                                      progressBarWidth: 10,
                                      shadowWidth: 15),
                                  customColors: CustomSliderColors(
                                      dotColor: Palette.primaryColor,
                                      trackColor: Colors.white.withOpacity(0.6),
                                      progressBarColors: [
                                        Colors.grey[500],
                                        Colors.grey[300],
                                        Colors.white,
                                      ],
                                      shadowColor: Colors.grey[50],
                                      shadowMaxOpacity: 0.08),
                                  infoProperties: InfoProperties(
                                    modifier: (x) {
                                      return '';
                                    },
                                    mainLabelStyle: GoogleFonts.lato(
                                      fontSize: 0,
                                    ),
                                  ),
                                  startAngle: 180,
                                  angleRange: 180,
                                  size: 300.0,
                                ),
                                initialValue: 70,
                              ),
                            ),
                            Positioned(
                              top: 75,
                              child: Column(
                                children: [
                                  Text(
                                    "1920",
                                    style: GoogleFonts.roboto(
                                        color: Colors.white,
                                        fontSize: 45,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "KCal Left",
                                    style: GoogleFonts.roboto(
                                        color: Colors.white.withOpacity(0.6),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 200, left: 25, right: 25),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _neutrentBar(
                                      colors: Colors.yellow,
                                      dec: '252 gm left',
                                      percent: 0.7,
                                      titel: 'Carbs'),
                                  _neutrentBar(
                                      colors: Colors.pinkAccent,
                                      dec: '32 g left',
                                      percent: 0.7,
                                      titel: 'Fat'),
                                  _neutrentBar(
                                      colors: Colors.brown,
                                      dec: '124 g left',
                                      percent: 0.6,
                                      titel: 'Protein'),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 305),
                              child: Container(
                                height: 5,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.8),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 5,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.7),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5, left: 3),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_rounded,
                              size: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5, right: 3),
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(context,
                                  PageTransition(type: PageTransitionType.fade, child: CalSettings()));
                            },
                            icon: Icon(
                              Icons.settings,
                              size: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: Column(
          children: [
            MediaQuery.removePadding(
              context: context,
              removeBottom: true,
              child: Container(
                color: Palette.primaryColor,
                child: SafeArea(
                  child: Container(
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.only(top: 11, bottom: 11),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                      ),
                      child: FlutterDatePickerTimeline(
                        startDate: DateTime(2021, 01, 01),
                        endDate: DateTime(2021, 12, 00),
                        initialSelectedDate: DateTime.now(),
                        selectedItemBackgroundColor: Palette.primaryColor,
                        selectedItemTextStyle: GoogleFonts.lato(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        onSelectedDateChange: (DateTime dateTime) {
                          print(dateTime);
                        },
                      )),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: MediaQuery.removePadding(
                  context: context,
                  removeBottom: true,
                  removeTop: true,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      _diat(
                        Dec: "The first meal of the day. Usually around 6am-9am",
                        width: _width,
                        Titel: 'Breakfast',
                        goal: "Goal 256 KCal",
                        images: "assets/calori/breckfast.png",
                        select: false,
                      ),
                      _diat(
                        Dec: "A meal eaten in the late morning, instead of BReakfast and lUNCH. (informal)",
                        width: _width,
                        Titel: 'Brunch',
                        goal: "Goal 256 KCal",
                        images: "assets/calori/lunch.png",
                        select: true,
                      ),
                      _diat(
                        Dec: "A meal in the middle of the day. Usually around noon or 1pm.",
                        width: _width,
                        Titel: 'Lunch',
                        goal: "Goal 256 KCal",
                        images: "assets/calori/brunch.png",
                        select: true,
                      ),
                      _diat(
                        Dec: "A light or informal evening meal. Around 5pm-6pm.",
                        width: _width,
                        Titel: 'Supper',
                        goal: "Goal 256 KCal",
                        images: "assets/calori/supper.png",
                        select: true,
                      ),
                      _diat(
                        Dec: "The main meal of the day, eaten either in the middle of the day or in the evening. Usually when people say 'Dinner', they mean an evening meal, around 8pm-9:30pm",
                        width: _width,
                        Titel: 'Dinner',

                        goal: "Goal 256 KCal",
                        images: "assets/calori/dinner.png",
                        select: true,
                      ),
                      GoPremium(),
                      MacrsCharts(),
                      MicrosCharts(),
                      WaterTankChart(),
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

  Widget _neutrentBar(
      {String titel, String dec, double percent, Color colors}) {
    return Column(
      children: [
        Text(
          titel,
          style: GoogleFonts.lato(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Stack(
            children: [
              Container(
                height: 5,
                width: 90,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
              Container(
                height: 5,
                width: 90 * percent,
                decoration: BoxDecoration(
                  color: colors,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
            ],
          ),
        ),
        Text(
          dec,
          style: GoogleFonts.lato(
              fontSize: 15, color: Colors.white.withOpacity(0.7)),
        ),
      ],
    );
  }

  Widget _diat(
      {double width,
      String Titel,
      String Dec,
      String goal,
      String images,
      bool select = true}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            PageTransition(type: PageTransitionType.fade, child: FoodAdd()));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  width: width - 40,
                  decoration: BoxDecoration(
                    color: Color(0xFFeef6f1),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 15, top: 15, right: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 50,
                              width: 80,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(images),
                                      fit: BoxFit.contain,
                                      alignment: Alignment.centerLeft)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              Titel,
                              style: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26,
                                  letterSpacing: 1),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10,top: 5),
                              child: Text(
                               Dec,
                                style: GoogleFonts.roboto(
                                    color: Colors.black.withOpacity(0.3),
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Text(
                                goal,
                                style: GoogleFonts.roboto(
                                    color: Colors.black.withOpacity(0.4),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: select
                            ? Column(
                                children: [
                                  Container(
                                    height: 2,
                                    color: Colors.white,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15,
                                        bottom: 15,
                                        right: 15,
                                        left: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "256 kCal",
                                          style: GoogleFonts.roboto(
                                              color:
                                                  Colors.black.withOpacity(0.4),
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              "24 kCal",
                                              style: GoogleFonts.roboto(
                                                  color: Colors.black
                                                      .withOpacity(0.4),
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "  UNDER",
                                              style: GoogleFonts.roboto(
                                                  color: Palette.primaryColor,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            : SizedBox(),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: select
                        ? Icon(
                            Icons.face,
                            color: Colors.blue,
                            size: 30,
                          )
                        : Icon(
                            Icons.add,
                            color: Palette.primaryColor,
                            size: 20,
                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
