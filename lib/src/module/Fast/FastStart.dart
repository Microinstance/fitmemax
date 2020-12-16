import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class FastStart extends StatefulWidget {
  @override
  _FastStartState createState() => _FastStartState();
}

class _FastStartState extends State<FastStart> {

  String printDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined,color: Colors.white,size: 20,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text("Circadian Rhythm TRF",style: GoogleFonts.lato(fontSize: 22,color: Colors.white),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Keep Fasting 💪",style: GoogleFonts.lato(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: Color(0xFF161616),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5,right: 5,top: 2,bottom: 2),
                      child: Row(
                        children: [
                          Text("16 : 9 ",style: GoogleFonts.lato(fontSize: 15,color: Colors.white,),),
                          Icon(Icons.edit,size: 20,color: Color(0xFFffbe94),),
                        ],
                      ),
                    ),

                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    overflow: Overflow.visible,
                    alignment: Alignment.bottomCenter,
                    children: [
                      SleekCircularSlider(
                        appearance: CircularSliderAppearance(
                            customWidths: CustomSliderWidths(trackWidth: 8, progressBarWidth: 20, shadowWidth: 25),
                            customColors: CustomSliderColors(
                                dotColor: Colors.black,
                                trackColor: Color(0xFF292b2c),
                                progressBarColors: [Color(0xFFff7171),Color(0xFFffbb92),],
                                shadowColor: Colors.grey[50],
                                shadowMaxOpacity: 0.05),
                            infoProperties: InfoProperties(
                                topLabelStyle: TextStyle(
                                    color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
                                topLabelText: 'Elapsed',
                                bottomLabelStyle: TextStyle(
                                    color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
                                bottomLabelText: 'time',
                                mainLabelStyle: TextStyle(
                                    color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.w600),
                                modifier: (double value) {
                                  final time = printDuration(Duration(seconds: value.toInt()));
                                  return '$time';
                                }),
                            startAngle: 120,
                            angleRange: 300,
                            size: 290.0,
                        ),
                        initialValue: 85,
                          min: 0,
                          max: 100,
                      ),
                      Positioned(
                        bottom: -15,
                        child: MaterialButton(
                          onPressed: (){},
                          color: Color(0xFFffbb92),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5,right: 5,top: 2,bottom: 2),
                            child: Text("End",style: GoogleFonts.lato(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
