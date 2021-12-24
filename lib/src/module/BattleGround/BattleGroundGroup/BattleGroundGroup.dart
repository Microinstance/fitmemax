import 'package:animator/animator.dart';
import 'package:fitmemax/Objects/InnerShadow.dart';
import 'package:fitmemax/src/module/BattleGround/BattleGroundGifts.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';

class BattleGroundGroup extends StatefulWidget {

  @override
  _BattleGroundGroupState createState() => _BattleGroundGroupState();
}

class _BattleGroundGroupState extends State<BattleGroundGroup> {
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
                                  "Group",
                                  style: TextStyles.GameRegulerWhite,
                                ),
                              ),
                            )),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.people_alt_outlined,color: Colors.yellow,size: 22,),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "120515",
                          style: TextStyles.GameRegulerBigWhite,
                        ),
                      ),

                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.wine_bar_sharp,color: Colors.yellow,size: 22,),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "50",
                          style: TextStyles.GameRegulerBigWhite,
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.fade,
                                  child: BattleGroundGifts()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Animator(
                                duration: Duration(seconds: 1),
                                cycles: 0,
                                resetAnimationOnRebuild: true,
                                tween:
                                Tween<double>(begin: 0.85, end: 1),
                                builder: (_, anim, __) =>
                                    Transform.scale(
                                      origin: Offset(1, 2),
                                      scale: anim.value,
                                      child: Image.asset(
                                          "assets/battleground/reward.png",
                                          height: 30,
                                          width: _width * 0.07 - 20),
                                    ),
                              ),
                              Text(" Gifts",
                                  style: TextStyles.GameRegulerWhite)
                            ],
                          ),
                        ),
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
              top: 80,
              child: Container(
                  height: _height-60,
                  width: _width,
                  child:ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5,left: 20,right: 20,bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 170,
                              width: (_width-60)/2,
                              child: Stack(
                                children: [
                                  Container(
                                    height: 170,
                                    width: (_width-60)/2,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.black,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Container(
                                      height: 170/1.5,
                                      width: (_width-60)/2,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                                        image: DecorationImage(
                                          image: AssetImage("assets/battleground/football_ground.png"),
                                          fit: BoxFit.cover,
                                        )
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      height: 170/3.5,
                                      width: (_width-60)/2,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)),
                                      ),
                                      child: Column(
                                        children: [
                                          Text("Squad Management",style: TextStyles.GameSemiBoldyellow,),
                                          Opacity(
                                              opacity: 0.5,
                                              child: Text("Make adjustment with your squad",style: TextStyles.GameRegulerWhite,))
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 170,
                              width: (_width-60)/2,
                              child: Stack(
                                children: [
                                  Container(
                                    height: 170,
                                    width: (_width-60)/2,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.black,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Container(
                                      height: 170/1.5,
                                      width: (_width-60)/2,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                                        image: DecorationImage(
                                          image: AssetImage("assets/battleground/football_ground.png"),
                                          fit: BoxFit.cover,
                                        )
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      height: 170/3.5,
                                      width: (_width-60)/2,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)),
                                      ),
                                      child: Column(
                                        children: [
                                          Text("My Team",style: TextStyles.GameSemiBoldyellow,),
                                          Opacity(
                                              opacity: 0.5,
                                              child: Text("Browse and train your members",style: TextStyles.GameRegulerWhite,))
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 100,
                              width: (_width-60)/2,
                              child: Stack(
                                children: [
                                  Container(
                                    height: 100,
                                    width: (_width-60)/2,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.black,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 100,
                                          width: ((_width-60)/2)/2,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular(15)),
                                              image: DecorationImage(
                                                image: AssetImage("assets/battleground/football_ground.png"),
                                                fit: BoxFit.cover,
                                              )
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: ((_width-60)/2)/2,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Flexible(child: Padding(
                                                    padding: const EdgeInsets.only(left: 15,right: 15),
                                                    child: Text("Achievements",style: TextStyles.GameBigBoldyellow,),
                                                  )),
                                                ],
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
                          ],
                        ),
                      ),
                    ],
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
