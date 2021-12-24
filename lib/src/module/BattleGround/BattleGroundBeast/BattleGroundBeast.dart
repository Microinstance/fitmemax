import 'package:animator/animator.dart';
import 'package:fitmemax/Objects/InnerShadow.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BattleGroundBeast extends StatefulWidget {

  @override
  _BattleGroundBeastState createState() => _BattleGroundBeastState();
}

class _BattleGroundBeastState extends State<BattleGroundBeast> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ColorPalette.BattleGroundBackground,
      body: SafeArea(
        child: Stack(
          children: [
            InnerShadow(
              blur: 5,
              color: Colors.black.withOpacity(0.5),
              offset: const Offset(5, 5),
              child: Container(
                height: _height,
                width: _width,
                // decoration: BoxDecoration(
                //   color:
                // ),
              ),
            ),
            Container(
              height: _height,
              width: _width,
              color: Colors.transparent,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 55,
                width: _width,
                decoration: BoxDecoration(
                  color: ColorPalette.BattleGroundAppBar,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5.0,
                      spreadRadius: 5.0,
                      color: Colors.black.withOpacity(0.3),
                      offset: Offset(3.0, 0),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 30, right: 25, top: 7.5, bottom: 7.5),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: borderRadious.primeryRadious,
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    ColorPalette.BattleGroundGredientRed1,
                                    ColorPalette.BattleGroundGredientRed2,
                                    ColorPalette.BattleGroundGredientRed3,
                                  ]),
                              border: Border.all(
                                width: 1.5,
                                color: Colors.white.withOpacity(0.3),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.05),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                )
                              ]),
                          child: Icon(
                            Icons.arrow_back,
                            size: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      InnerShadow(
                        blur: 2,
                        color: Colors.yellow.withOpacity(0.7),
                        offset: const Offset(2, 2),
                        child: Container(
                            height: 40,
                            width: 130,
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(7.5)),
                              color: Colors.black,
                            ),
                            child: Center(
                              child: Padding(
                                padding:
                                const EdgeInsets.only(left: 15, right: 15),
                                child: Text(
                                  "Beast",
                                  style: TextStyles.GameRegulerWhite,
                                ),
                              ),
                            )),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Animator(
                            duration: Duration(seconds: 1),
                            cycles: 0,
                            resetAnimationOnRebuild: true,
                            tween: Tween<double>(begin: 0.85, end: 1),
                            builder: (_, anim, __) => Transform.scale(
                              origin: Offset(1, 2),
                              scale: anim.value,
                              child: Image.asset(
                                  "assets/battleground/multiple_coins.png",
                                  height: 35,
                                  fit: BoxFit.contain),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Container(
                                height: 55,
                                width: 15,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.white.withOpacity(0.2),
                                      blurRadius: 1,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        ColorPalette.GrediantGreen1,
                                        ColorPalette.GrediantGreen2,
                                        ColorPalette.GrediantGreen1,
                                      ]),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                )),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Row(
                          children: [
                            Animator(
                              duration: Duration(seconds: 1),
                              cycles: 0,
                              resetAnimationOnRebuild: true,
                              tween: Tween<double>(begin: 0.85, end: 1),
                              builder: (_, anim, __) => Transform.scale(
                                origin: Offset(1, 2),
                                scale: anim.value,
                                child: Image.asset(
                                    "assets/battleground/multiple_cash.png",
                                    height: 35,
                                    fit: BoxFit.contain),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Container(
                                  height: 55,
                                  width: 15,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white.withOpacity(0.2),
                                        blurRadius: 1,
                                        spreadRadius: 1,
                                      ),
                                    ],
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          ColorPalette.GrediantGreen1,
                                          ColorPalette.GrediantGreen2,
                                          ColorPalette.GrediantGreen1,
                                        ]),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
             top: 60,
              child: Container(
                height: _height-60,
                width: _width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 70,left: 25),
                          child: Text("0",style: TextStyles.GameSemiBoldWhite,textAlign: TextAlign.center,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 25,right: 25,top: (_height-100)/2+40,bottom:(_height-110)/2-30 ),
                          child: Stack(
                            alignment: Alignment.topCenter,
                            clipBehavior: Clip.none,
                            children: [
                              Stack(
                                alignment: Alignment.bottomCenter,
                                clipBehavior: Clip.none,
                                children: [
                                  Positioned(
                                    bottom: -15,
                                    child: SizedBox(
                                      width: _width*2,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: List.generate(7, (index) => Column(
                                          children: [
                                               Padding(
                                              padding: const EdgeInsets.only(top: 3),
                                              child: Container(
                                                height: 15,
                                                width: 5,
                                                decoration: BoxDecoration(
                                                  color: (index==0 || index == 6) ?Colors.transparent : Colors.yellow.withOpacity(0.9),
                                                  borderRadius: BorderRadius.circular(15),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: -35,
                                    child: SizedBox(
                                      width: _width*2,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: List.generate(7, (index) => Column(
                                          children: [
                                            (index==0 || index == 6) ? Opacity(
                                                opacity: 0,
                                                child: Text("${index*1000}",style: TextStyles.GameRegulerWhite,textAlign: TextAlign.center,)) :Padding(
                                                  padding: EdgeInsets.only(left: (index==1) ? 25 :20),
                                                  child: Text("${index*1000}",style: TextStyles.GameRegulerWhite,textAlign: TextAlign.center,),
                                                )
                                          ],
                                        )),
                                      ),
                                    ),
                                  ),
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Stack(
                                        alignment: Alignment.centerLeft,
                                        children: [
                                          Container(
                                            width: _width*2,
                                            decoration: BoxDecoration(
                                              color: Colors.black.withOpacity(0.4),
                                              borderRadius: BorderRadius.circular(15),
                                              border: Border.all(
                                                color: Colors.white,
                                               width: 2,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 5,bottom: 5,top: 5,right: 5),
                                            child: Container(
                                              width: ((_width*2)-10)*1,
                                              decoration: BoxDecoration(
                                                color: Colors.yellow[700],
                                                borderRadius: BorderRadius.circular(15),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: _width*2,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: List.generate(7, (index) => Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(top: 3),
                                                child: Container(
                                                  height: _height-(((_height-100)/2+40)+((_height-110)/2-30))-65,
                                                  width: 5,
                                                  decoration: BoxDecoration(
                                                    color:(index==0 || index ==6)? Colors.transparent : Colors.black.withOpacity(0.9),
                                                    borderRadius: BorderRadius.circular(15),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )),
                                        ),
                                      ),
                                    ],
                                  ),


                                ],
                              ),
                              Positioned(
                                top: -100,
                                child: SizedBox(
                                  width:( _width*2),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: List.generate(7, (index) => Stack(
                                      alignment: Alignment.center,
                                      clipBehavior: Clip.none,
                                      children: [
                                        Opacity(
                                          opacity:(index == 0 || index == 6 ) ? 0 : 0.2,
                                          child: Stack(
                                            alignment: Alignment.bottomCenter,
                                            clipBehavior: Clip.none,
                                            children: [
                                              Positioned(
                                                bottom: -7,
                                                child: RotationTransition(
                                                  turns: new AlwaysStoppedAnimation(45 / 360),
                                                  child: Container(
                                                    height: 30,
                                                    width: 30,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.circular(5),
                                                    ),

                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 80,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(5),
                                                ),

                                              ),
                                            ],
                                          ),
                                        ),
                                        (index == 0 || index == 6 ) ? SizedBox() : Padding(
                                          padding: const EdgeInsets.only(right: 5),
                                          child: Image.asset("assets/Rings/rings1.png",fit: BoxFit.contain,height: 60,),
                                        ),
                                        (index == 0 || index == 6 ) ? SizedBox() :  Positioned(
                                          right: -15,
                                          top: -15,
                                          child
                                              : CircleAvatar(
                                              radius: 20,
                                              backgroundColor: Colors.black.withOpacity(0.2),
                                              child: Center(child: Icon(Icons.lock,color: Colors.white.withOpacity(0.5),size: 20,))),
                                        ),
                                      ],
                                    ))
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 70,right: 25),
                          child: Text("4000",style: TextStyles.GameSemiBoldWhite,textAlign: TextAlign.center,),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
