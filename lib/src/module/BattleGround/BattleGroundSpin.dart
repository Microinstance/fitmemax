import 'dart:async';
import 'dart:math';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:fitmemax/src/module/BattleGround/BattleGround.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinning_wheel/flutter_spinning_wheel.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';

class BattleGroundSpin extends StatefulWidget {

  @override
  _BattleGroundSpinState createState() => _BattleGroundSpinState();
}

class _BattleGroundSpinState extends State<BattleGroundSpin> {
  final StreamController _dividerController = StreamController<int>.broadcast();
  final _wheelNotifier = StreamController<double>();

  AudioPlayer audioPlayer = AudioPlayer();
  AudioPlayerState audioPlayerState = AudioPlayerState.PAUSED;
  AudioCache audioCache;

  String loopAudio = 'battleground/audio/spnwhl-sound (2).mp3';
  String victory = 'battleground/audio/bell sound (3).wav';
  String impact = 'audio/sfx_impact.mp3';

  @override
  void initState() {
   super.initState();
   audioCache = AudioCache(fixedPlayer: audioPlayer);
   audioPlayer.onPlayerStateChanged.listen((AudioPlayerState s) {
     setState(() {
       audioPlayerState = s;
     });
   });
  }
  @override
  void dispose() {
    _dividerController.close();
    _wheelNotifier.close();
    audioPlayer.release();
    audioPlayer.dispose();
    audioCache.clearCache();
    super.dispose();
  }
  playMusic({String path}) async {
    await audioCache.play(path);
  }
  pauseMusic() async {
    await audioPlayer.pause();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    double _generateRandomAngle() => Random().nextDouble() * pi * 2;
    double _generateRandomVelocity() => (Random().nextDouble() * 6000) + 2000;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Stack(
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
            Align(
              alignment: Alignment.center,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: _height-60,
                    width: _width*0.6,
                    child: DottedBorder(
                      radius:  Radius.circular(7.5),
                      strokeCap: StrokeCap.round,
                      strokeWidth: 2,
                      color: Colors.yellow,
                      borderType: BorderType.RRect,
                      dashPattern: [2,6,],
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.5),
                            image: DecorationImage(
                                image: AssetImage("assets/battleground/spin_background.png"),
                                fit: BoxFit.cover
                            )
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 12,bottom: 10),
                            child: Stack(
                              alignment: Alignment.center,
                              clipBehavior: Clip.none,
                              children: [
                                SpinningWheel(
                                  Image.asset('assets/battleground/mod-redef copy.png'),
                                  width: 280,
                                  height: 280,
                                  initialSpinAngle: _generateRandomAngle(),
                                  spinResistance: 0.2,
                                  canInteractWhileSpinning: false,
                                  dividers: 16,
                                  onUpdate: _dividerController.add,
                                  onEnd: (value){
                                    print(value);
                                    if(value == 10 && value == 2 ) {
                                      _wheelNotifier.sink.add(_generateRandomVelocity());
                                    }else {
                                      pauseMusic();
                                      playMusic(path: victory);
                                      showModalBottomSheet(
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        elevation: 0,
                                        enableDrag: false,
                                        isDismissible: false,
                                        builder: (BuildContext context) {
                                          return Container(
                                            height: 130,
                                            decoration: BoxDecoration(
                                              color: ColorPalette.BattleGroundBackground6.withOpacity(0.8),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 20,bottom: 20,left: 50,right: 50),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(15),
                                                    border: Border.all(color: Colors.yellow,width: 2),
                                                    gradient: LinearGradient(
                                                        begin: Alignment.bottomCenter,
                                                        end: Alignment.topCenter,
                                                        colors: [
                                                          ColorPalette.BattleGroundBackground8,
                                                          ColorPalette.BattleGroundBackground5,
                                                        ]
                                                    )
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      StreamBuilder(
                                                        stream: _dividerController.stream,
                                                        builder: (c,s){
                                                          return s.hasData ? _Score(selected : s.data)  : Container();
                                                        },
                                                      ),
                                                      MaterialButton(
                                                        onPressed: (){
                                                          playMusic(path: impact);
                                                          Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: BattleGround()));
                                                          Fluttertoast.showToast(
                                                              msg: "Rewards are Collected",
                                                              toastLength: Toast.LENGTH_SHORT,
                                                              gravity: ToastGravity.CENTER,
                                                              timeInSecForIosWeb: 1,
                                                              backgroundColor: Colors.red,
                                                              textColor: Colors.white,
                                                              fontSize: 16.0
                                                          );
                                                        },
                                                        color: Colors.yellow,
                                                        shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(7.5) ),
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(left: 5,right: 5,top: 2,bottom: 2),
                                                          child: Text("Collect",style: TextStyles.GameSemiBoldblack,),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                        isScrollControlled: true,
                                      );
                                    }
                                  },
                                  secondaryImage:
                                  Image.asset('assets/battleground/spin_center.png',),
                                  secondaryImageHeight: 60,
                                  secondaryImageWidth: 60,
                                  shouldStartOrStop: _wheelNotifier.stream,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: Image.asset("assets/battleground/spin_outer_dial.png", height: 350,fit: BoxFit.contain,),
                                ),
                                GestureDetector(
                                  onTap:(){
                                    _wheelNotifier.sink.add(_generateRandomVelocity());
                                    playMusic(path: loopAudio);
                                  },
                                  child: Container(
                                    height: 60,
                                    width: 60,
                                    color: Colors.transparent,
                                  ),
                                ),
                                // Align(
                                //   alignment: Alignment.topCenter,
                                //   child: StreamBuilder(
                                //     stream: _dividerController.stream,
                                //     builder: (c,s){
                                //       return s.hasData ? _Score(selected : s.data)  : Container();
                                //     },
                                //   ),
                                // )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      top: -12,
                      right: -15,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: BattleGround()));
                        },
                          child: Image.asset("assets/icon/close-icon.png",height: 30,fit: BoxFit.contain,))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
   _Score({int selected}){
    Map<int, String> labels = {
      1: '5000 Fitcoins',
      2: '1 Day Go Pro',
      3: '1000 Fitcash',
      4: '10% less on 1 month Go Pro',
      5: '100 Fitcoins',
      6: '10% less on 3 month Go Pro',
      7: '100 Fitcash',
      8: '3 month sponsorship',
      9: '50 Fitcoins',
      10: 'Gift card (INR 500)',
      11: '15% less on MuscleBaba',
      12: '20000 Fitcoins',
      13: '120% Fitcash in 30 minutes',
      14: 'Whey Protein (5 lbs)',
      15: 'Whey Protein (5 lbs)',
      16: '10 Fitcash',
    };
    return Text("${labels[selected]}",style: TextStyles.GameBigBoldyellow,);

  }
  Widget _Collect({String Score = "10% less on 1 month Go Pro"}){
    return Container(
      height: 130,
      decoration: BoxDecoration(
        color: ColorPalette.BattleGroundBackground6.withOpacity(0.8),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20,bottom: 20,left: 50,right: 50),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.yellow,width: 2),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                ColorPalette.BattleGroundBackground8,
                ColorPalette.BattleGroundBackground5,
              ]
            )
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Text(Score,style: TextStyles.GameBigBoldyellow,),
                StreamBuilder(
                  stream: _dividerController.stream,
                  builder: (c,s){
                    return s.hasData ? _Score(selected : s.data)  : Container();
                  },
                ),
                MaterialButton(
                  onPressed: (){
                    playMusic(path: impact);
                    Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: BattleGround()));
                    Fluttertoast.showToast(
                        msg: "Rewards are Collected",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                  },
                  color: Colors.yellow,
                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(7.5) ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5,right: 5,top: 2,bottom: 2),
                    child: Text("Collect",style: TextStyles.GameSemiBoldblack,),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

