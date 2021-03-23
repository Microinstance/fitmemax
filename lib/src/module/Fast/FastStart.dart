import 'package:fitmemax/src/ListData/ListData.dart';
import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class FastStart extends StatefulWidget {
  final String titel;
  FastStart({this.titel = "Circadian Rhythm TRF" });
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
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
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
        title: Text(widget.titel,style: GoogleFonts.lato(fontSize: 22,color: Colors.white),),
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
            Stack(
              children: [
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
                Padding(
                  padding: const EdgeInsets.only(top: 30,left: 20,right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Color(0xFF33251d),
                        child: Center(
                          child: Icon(Icons.lock_clock,size: 25,color: Color(0xFFfeba91),),
                        ),
                      ),
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Color(0xFF2e2e2e),
                        child: Center(
                          child: Icon(Icons.face,size: 25,color: Colors.white,),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text("Start",style: GoogleFonts.lato(fontSize: 18,color: Color(0xFFffbb92),fontWeight: FontWeight.bold),),
                    Text("End",style: GoogleFonts.lato(fontSize: 18,color: Color(0xFFff7171),fontWeight: FontWeight.bold),),
                  ],),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 35,
                            decoration: BoxDecoration(
                              color:  Color(0xFFffbb92).withOpacity(0.2),
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15,right: 15),
                                child: Text("06 : 00",style: GoogleFonts.lato(color:  Color(0xFFffbb92),fontSize: 18,fontWeight: FontWeight.bold),),
                              ),
                            ),
                          ),
                          SizedBox(width: 5,),
                          Text("13th Aug",style: GoogleFonts.lato(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w500),),
                        ],
                      ),
                      Row(
                        children: [
                          Text("13th Aug",style: GoogleFonts.lato(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w500),),
                          SizedBox(width: 5,),
                          Container(
                            height: 35,
                            decoration: BoxDecoration(
                              color:  Color(0xFFff7171).withOpacity(0.2),
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15,right: 15),
                                child: Text("06 : 00",style: GoogleFonts.lato(color:  Color(0xFFff7171),fontSize: 18,fontWeight: FontWeight.bold),),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            Stack(
              overflow: Overflow.visible,
              alignment: Alignment.topRight,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15),
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Container(
                        height: 200,
                        width: _width-30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Color(0xFF1c1c1e),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15,top: 15,bottom: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: _width/2,
                                    child: Text("Thinking what to Eat ?",style: GoogleFonts.lato(fontWeight: FontWeight.w800,color: Colors.white,fontSize: 26),),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: _width/2,
                                    child: Text("Ask our Coaches about healthy meal suggestions",style: GoogleFonts.lato(fontWeight: FontWeight.w500,color: Colors.white.withOpacity(0.5),fontSize: 18),),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/fast/fastfruit.png"),
                              fit: BoxFit.contain
                            )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: -5,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Icon(Icons.bookmark_rounded,color: Colors.yellow[500],size: 30,),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,top: 20),
              child: Row(
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color:  Color(0xFFffbb92).withOpacity(0.2),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Center(
                      child: Icon(Icons.emoji_people_rounded,color:Color(0xFFffbb92) ,size: 20,)
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Fasting Buddies",style: GoogleFonts.lato(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20 ),),
                ],
              ),
            ),
            Container(
              height: 130,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: Data().User.length,
                itemBuilder: (BuildContext context, int index){
                  return Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Color(0xFFff7171),
                      child: CircleAvatar(
                        radius: 37,
                        backgroundColor: Colors.black,
                        child: CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage(Data().User[index]),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
