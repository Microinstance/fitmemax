import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_date_picker_timeline/flutter_date_picker_timeline.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

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
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  color: Palette.primaryColor,
                  child: SafeArea(
                    child: Container(
                      height: 0,
                      color: Palette.primaryColor,
                    ),
                  ),
                ),
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
                        top: 90,
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
                            top: 180, left: 25, right: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      height: 10,
                      width: _width,
                      decoration: BoxDecoration(
                        color: Palette.primaryColor,
                      ),
                    ),
                    Container(
                      height: 10,
                      width: _width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                        color: Color(0xFFF5F5F5),
                        // color: Colors.white
                      ),
                    ),
                  ],
                ),
                Container(
                    padding: const EdgeInsets.only(top: 11, bottom: 11),
                    decoration: BoxDecoration(color: const Color(0xFFF5F5F5),
                    ),
                    child: FlutterDatePickerTimeline(
                      startDate: DateTime(2020, 12, 01),
                      endDate: DateTime(2021, 01, 00),
                      initialSelectedDate: DateTime.now(),
                      selectedItemBackgroundColor: Palette.primaryColor,
                      selectedItemTextStyle: GoogleFonts.lato(fontSize: 17,color: Colors.white,fontWeight: FontWeight.bold),
                      onSelectedDateChange: (DateTime dateTime) {
                        print(dateTime);
                      },
                    )),
                Container(
                  height: 6,
                  color: Color(0xFFF5F5F5),
                ),
                SizedBox(height: 25,),
                _diat(
                  width: _width,
                  Titel: 'Breakfast',
                  goall: "Goal 256 KCal",
                  images : "assets/calori/breckfast.png",
                  select: true,
                ),
                _diat(
                    width: _width,
                    Titel: 'Lunch',
                    goall: "Goal 256 KCal",
                    images : "assets/calori/lunch.png",
                  select: true,
                ),
                _diat(
                    width: _width,
                    Titel: 'Dinner',
                    goall: "Goal 256 KCal",
                    images : "assets/calori/dinner.png",
                  select: true,
                ),
              ],
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 5,right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.white,
                      size: 25,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.settings,
                      color: Colors.white,
                      size: 25,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _neutrentBar({String titel, String dec, double percent, Color colors}) {
    return Column(
      children: [
        Text(
          titel,
          style: GoogleFonts.lato(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
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
  Widget _diat({double width, String Titel, String goall,String images,bool select = false}){
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            width: width-40,
            // height: 170,
            decoration: BoxDecoration(
              color: Color(0xFFeef6f1),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15,top: 15,right: 15),
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
                              alignment: Alignment.centerLeft
                            )
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(Titel,style: GoogleFonts.lato(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 26,letterSpacing: 1),),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text(
                          goall,
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
                   child: select ? Column(
                    children: [
                      Container(
                        height: 2,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15,bottom: 15,right: 15,left: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "256 kCal",
                              style: GoogleFonts.roboto(
                                  color: Colors.black.withOpacity(0.4),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "24 kCal",
                                  style: GoogleFonts.roboto(
                                      color: Colors.black.withOpacity(0.4),
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
                ) : SizedBox(),
                 )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: select ? Icon(Icons.face,color: Colors.blue,size: 30,) : Icon(Icons.add,color: Palette.primaryColor,size: 20,),
            ),
          ),
        ],
      ),
    );
  }
}
