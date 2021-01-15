import 'package:fitmemax/src/module/BattleGround/BattleGroundHome.dart';
import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class BattleGroundLoading extends StatefulWidget {
  @override
  _BattleGroundLoadingState createState() => _BattleGroundLoadingState();
}

class _BattleGroundLoadingState extends State<BattleGroundLoading> {

  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }
  @override
  dispose(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: _height,
            width: _width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/battleground/battlegroundbackground.png"),
                fit: BoxFit.cover,
              )
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: BattleGroundHome()));
                },
                child: SpinKitPouringHourglass(
                  size: 50,
                  color: Colors.yellow,
                ),
              ),
              SizedBox(height: 15,),
              GestureDetector(
                  onTap: (){
                    Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: BattleGroundHome()));
                  },
                  child: Text("Loading..",style: GoogleFonts.lato(fontSize: 22,color: Colors.yellow,fontWeight: FontWeight.bold),)),
            ],
          ),
        ],
      )
    );
  }
}
