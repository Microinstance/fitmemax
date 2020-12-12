import 'dart:math';

import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class CalTrackerDashboard extends StatefulWidget {
  @override
  _CalTrackerDashboardState createState() => _CalTrackerDashboardState();
}

class _CalTrackerDashboardState extends State<CalTrackerDashboard> {
  int _currentValue = 50;

  void _generateRandomValue() {
    final randomizer = Random();
    _currentValue = randomizer.nextInt(100);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle.dark.copyWith(
        statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:  Brightness.dark,
    ));
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SafeArea(child: SizedBox(
                  height: 0,
                )),
                Container(
                  width: _width,
                  color: Palette.primaryColor,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: SleekCircularSlider(
                          appearance: CircularSliderAppearance(
                              animationEnabled: true,
                              customWidths: CustomSliderWidths(trackWidth: 3, progressBarWidth: 10, shadowWidth: 15),
                              customColors:  CustomSliderColors(
                                  dotColor: Colors.white.withOpacity(0.8),
                                  trackColor:Colors.white.withOpacity(0.6),
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
                                  mainLabelStyle: GoogleFonts.lato(fontSize: 0,),
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
                            Text("1920",style: GoogleFonts.roboto(color: Colors.white,fontSize: 45,fontWeight: FontWeight.bold),),
                            SizedBox(height: 5,),
                            Text("KCal Left",style: GoogleFonts.roboto(color: Colors.white.withOpacity(0.6), fontSize: 15,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    height: 5,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                ),
                Container(
                  height: _height,
                  width: 500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 5,top: 0),
              child: IconButton(icon: Icon(Icons.arrow_back_ios_rounded,color: Colors.white,size: 25,),
                  onPressed: (){
                Navigator.pop(context);
                  },
              ),
            ),
          )
        ],
      ),
    );
  }
}