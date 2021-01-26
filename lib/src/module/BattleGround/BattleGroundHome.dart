import 'package:delayed_display/delayed_display.dart';
import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class BattleGroundHome extends StatefulWidget {
  @override
  _BattleGroundHomeState createState() => _BattleGroundHomeState();
}

class _BattleGroundHomeState extends State<BattleGroundHome> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    final Duration initialDelay = Duration(milliseconds: 250);
    return Scaffold(
      backgroundColor: Color(0xFF0f1012),
      appBar: AppBar(
        backgroundColor: Color(0xFF0f1012),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 25,
            color: Colors.yellow,
          ),
        ),
        title: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: <TextSpan>[
            TextSpan(
              text: 'Battle',
              style: GoogleFonts.lato(
                  fontSize: 25,
                  color: Colors.yellow,
                  fontWeight: FontWeight.w500),
            ),
            TextSpan(
              text: 'Ground',
              style: GoogleFonts.lato(
                  fontSize: 25,
                  color: Palette.x1Color,
                  fontWeight: FontWeight.w500),
            ),
          ]),
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                // gradient: new LinearGradient(
                //     colors: [
                //       Color(0xFF351919),
                //       Color(0xFF0f1012),
                //        ],
                //     begin: FractionalOffset.topLeft,
                //     end: FractionalOffset.bottomRight,
                //    ),
            ),
            child: Column(
              children: [
                DelayedDisplay(
                  slidingBeginOffset: Offset(0.35, 0),
                  delay: initialDelay,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(7.5)),
                                border: Border.all(color: Colors.yellow, width: 1.5),
                                image: DecorationImage(
                                  image: AssetImage("images/userImage6.jpeg"),
                                  fit: BoxFit.cover,
                                )),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Level 1",
                                  style: GoogleFonts.lato(
                                      color: Colors.yellow,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Elena Gilbert",
                                  style: GoogleFonts.lato(
                                      color: Palette.x1Color,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: AnimationLimiter(
                    child: GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      childAspectRatio: 3/2,
                      scrollDirection: Axis.vertical,
                      crossAxisCount: 3,
                      mainAxisSpacing: 0.0,
                      children: List.generate(6, (index) =>  AnimationConfiguration.staggeredGrid(
                        columnCount: 3,
                        position: index,
                        duration: const Duration(milliseconds: 1000),
                        child: ScaleAnimation(
                          scale: 0.5,
                          child: FadeInAnimation(
                            child: Column(
                              children: [
                                Text("1750",style: GoogleFonts.openSans(fontSize: 25,color: Colors.white),),
                                SizedBox(
                                  height: 2,
                                ),
                                Text("Comp Points",style: GoogleFonts.raleway(fontSize: 15,color: Colors.yellow),),
                              ],
                            ),
                          ),
                        ),
                      ),)
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
