import 'package:delayed_display/delayed_display.dart';
import 'package:fitmemax/Objects/InnerShadow.dart';
import 'package:fitmemax/src/module/BattleGround/BattleGround.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';

class WinnerScreen extends StatefulWidget {

  @override
  _WinnerScreenState createState() => _WinnerScreenState();
}

class _WinnerScreenState extends State<WinnerScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIOverlays([]);
    final Duration initialDelay = Duration(milliseconds: 1000);
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
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
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: DelayedDisplay(
                      delay: initialDelay,
                      slidingBeginOffset: Offset(-0.35, 0,),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: _playVideo(),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              _profile(
                                isLeft: true,
                                isWin: false,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: _profileCoin(
                                  isLef: true,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  DelayedDisplay(
                    delay: initialDelay,
                    slidingBeginOffset: Offset(0,0.35),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(": Wining Stats :",style: TextStyles.GameRegulerBigWhite,),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: List.generate(3, (index) => Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text("55",style: TextStyles.GameParaYellow,),
                            ),)
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text("Time End",style: TextStyles.GameParaWhite,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text("00:00:00",style: TextStyles.GameBigBoldyellow,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: GestureDetector(
                            onTap: (){

                              showDialog(
                                  context: context,
                                  builder: (_) => _dispute(
                                    width: _width,
                                    height: _height,
                                  )
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: borderRadious.primeryRadious,
                                color: ColorPalette.Yellow,
                                border: Border.all(color: Colors.black,width: 1),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10,right: 10,top: 4,bottom: 4),
                                child: Row(
                                  children: [
                                    Text("Raise Dispute",style: TextStyles.GameRegulerBlack,),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: DelayedDisplay(
                      delay: initialDelay,
                      slidingBeginOffset: Offset(0.35, 0,),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              _profile(
                                isLeft: false,
                                isWin: true,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: _profileCoin(
                                  isLef: false,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: _playVideo(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

  }
  Widget _profile({bool isLeft,bool isWin }){
    return Stack(
      alignment: Alignment.topCenter,
      clipBehavior: Clip.none,
      children: [
        InnerShadow(
          blur: 5,
          color: Colors.black.withOpacity(0.5),
          offset: const Offset(5, 5),
          child: Container(
            height: 201,
            width: 150,
            decoration: BoxDecoration(
              color: ColorPalette.BattleGroundBackground6,
              borderRadius: BorderRadius.circular(7.5),
              border: isWin?  Border.all(
                color: Colors.yellow,
                width: 3,
              ) : Border.all(
                color: Colors.yellow,
                width: 0,
              )
            ),
            child: Column(
              children: [
                Stack(
                  clipBehavior : Clip.none,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: InnerShadow(
                        blur: 5,
                        color: Colors.black.withOpacity(0.5),
                        offset: const Offset(5, 5),
                        child: Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("images/userImage1.jpeg"),
                                fit: BoxFit.cover,
                              ),
                              border: Border.all(width: 1,color: Colors.white.withOpacity(0.2)),
                              borderRadius: BorderRadius.circular(7.5),
                            )
                        ),
                      ),
                    ),
                    Align(
                      alignment: isLeft ? Alignment.topLeft : Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              "assets/battleground/star.png",
                              height: 30,
                            ),
                            Text(
                              "9",
                              style: TextStyles
                                  .GameParaBlack,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15,bottom: 15),
                  child: InnerShadow(
                    blur: 5,
                    color: Colors.black.withOpacity(0.5),
                    offset: const Offset(5, 5),
                    child: Container(
                      height:30,
                      width: 120,
                      decoration: BoxDecoration(
                        color: ColorPalette.BattleGroundBackground4,
                        border: Border.all(width: 1,color: Colors.white.withOpacity(0.2)),
                        borderRadius: BorderRadius.circular(7.5),
                      ),
                      child: Center(child: Text("Shivay",style: TextStyles.GameParaWhite,)),
                    ),

                  ),
                ),
              ],
            ),
          ),
        ),
        isWin ? Positioned(
            top: -40,
            child: Image.asset("assets/battleground/winner.png",height: 35,fit: BoxFit.contain,)) : SizedBox(),
      ],
    );
  }
  Widget _profileCoin({bool isLef}){
    return InnerShadow(
      blur: 5,
      color: Colors.black.withOpacity(0.5),
      offset: const Offset(5, 5),
      child: Container(
        height: 60,
        width: 150,
        decoration: BoxDecoration(
          color: ColorPalette.BattleGroundBackground6,
          borderRadius: BorderRadius.circular(7.5),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: InnerShadow(
                blur: 5,
                color: Colors.black.withOpacity(0.5),
                offset: const Offset(5, 5),
                child: Container(
                  height:40,
                  width: 120,
                  decoration: BoxDecoration(
                    color: ColorPalette.BattleGroundBackground4,
                    border: Border.all(width: 1,color: Colors.white.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(7.5),
                  ),
                  child: Center(child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      isLef ?  Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text("2545",style: TextStyles.GameParaWhite,),
                      ) : Image.asset("assets/battleground/multiple_coins.png",height: 20,fit: BoxFit.contain,) ,
                      isLef ? Image.asset("assets/battleground/multiple_coins.png",height: 20,fit: BoxFit.contain,) : Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text("2545",style: TextStyles.GameParaWhite,),
                      ),
                    ],
                  )),
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _playVideo(){
    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white.withOpacity(0.5),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(7.5),
        color: Colors.transparent.withOpacity(0.9),
       boxShadow: [
         BoxShadow(
             color: Colors.white.withOpacity(0.1),
           blurRadius: 2,
           spreadRadius: 2,
         )
       ]
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 5),
        child: Row(
          children: [
            Text("Play Video  ",style: TextStyles.GameParaWhite,),
            Icon(Icons.play_circle_fill,size: 20,color: Colors.white.withOpacity(0.9),),
          ],
        ),
      ),
    );
  }
  Widget _dispute({double width, double height}){
    return Material(
      type: MaterialType.transparency,
      child: Padding(
        padding: EdgeInsets.only(left: width*0.3,right: width*0.3,top: height*0.35,bottom: height*0.35),
        child: Container(
          height: 200,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white.withOpacity(0.5),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(7.5),
              color: Colors.transparent.withOpacity(0.9),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.1),
                  blurRadius: 2,
                  spreadRadius: 2,
                )
              ]
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Dispute in the basis of ?",style: TextStyles.GameRegulerYellow,),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: BattleGround()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: borderRadious.primeryRadious,
                            color: ColorPalette.Yellow,
                            border: Border.all(color: Colors.black,width: 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10,top: 4,bottom: 4),
                            child: Row(
                              children: [
                                Text("Workout Form",style: TextStyles.GameRegulerBlack,),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: BattleGround()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: borderRadious.primeryRadious,
                            color: ColorPalette.Yellow,
                            border: Border.all(color: Colors.black,width: 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10,top: 4,bottom: 4),
                            child: Row(
                              children: [
                                Text("Workout Stats",style: TextStyles.GameRegulerBlack,),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
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
