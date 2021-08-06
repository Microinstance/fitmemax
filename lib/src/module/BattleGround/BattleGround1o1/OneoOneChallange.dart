import 'dart:io';
import 'package:fitmemax/src/module/BattleGround/BattleGround1o1/WinnerScreen.dart';
import 'package:fitmemax/src/widgets/AssetVideoPlayer.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:page_transition/page_transition.dart';

class OneoOneChallange extends StatefulWidget {
  File video;
  OneoOneChallange({this.video});
  @override
  _OneoOneChallangeState createState() => _OneoOneChallangeState();
}

class _OneoOneChallangeState extends State<OneoOneChallange> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIOverlays([]);
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    final Duration initialDelay = Duration(milliseconds: 1000);
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            height: _height,
            width: _width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/battleground/background.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: _height,
            width: _width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30,right: 30,top: 50),
                  child: Column(
                    children: [
                      Container(
                        height: _height-200,
                        width: _height-100,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(color: Colors.white,width: 1),
                          borderRadius: BorderRadius.circular(7.5),
                        ),
                        child: (widget.video == null) ? SpinKitCircle(
                          color: Colors.yellow,
                          size: 50.0,
                        ) : AssetVideoPlayer(
                          play: true,
                          url: widget.video.path,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: MaterialButton(
                            onPressed: (){
                              Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: WinnerScreen()));
                            },
                          color: Colors.yellow,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15),
                            child: Text("Submit",style: TextStyles.GameParaBlack,),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Wrap(
                        children: List.generate(4, (index) => Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.yellow.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(7.5),
                            ),
                            child: TextField(
                              onChanged: (x){},
                              autofocus: false,
                              style: TextStyles.GameRegulerWhite,
                              cursorColor: ColorPalette.FluracentGreen,
                              decoration: InputDecoration(
                                  isDense: true,
                                  hintText: "Stat ${index+1}",
                                  hintStyle: TextStyles.GameRegulerWhite,
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.transparent,
                                  contentPadding: EdgeInsets.only(top: 12,right: 10,left: 8,bottom: 11)
                              ),
                            ),
                          ),
                        ),)
                      ),

                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
