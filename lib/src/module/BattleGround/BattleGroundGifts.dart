import 'package:animator/animator.dart';
import 'package:fitmemax/Objects/InnerShadow.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BattleGroundGifts extends StatefulWidget {

  @override
  _BattleGroundGiftsState createState() => _BattleGroundGiftsState();
}

class _BattleGroundGiftsState extends State<BattleGroundGifts> {
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
            Container(
              height: _height,
              width: _width,
              decoration: BoxDecoration(
                // image: DecorationImage(
                //   image:  AssetImage("assets/battleground/background.png"),
                //   fit: BoxFit.cover,
                // ),
              ),
            ),
            Container(
              height: _height,
              width: _width,
              child: Padding(
                  padding: const EdgeInsets.only(top: 65,left: 10,right: 10),
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: GridView.count(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      childAspectRatio: 1/0.6,
                      children: List.generate(8, (index) => _giftCard(
                      )),
                    ),
                  )
              ),
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
                  padding: const EdgeInsets.only(left: 30,right: 25,top: 7.5,bottom: 7.5),
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
                                  ]
                              ),
                              border: Border.all(
                                width: 1.5, color: Colors.white.withOpacity(0.3),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.05),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                )
                              ]
                          ),
                          child: Icon(
                            Icons.arrow_back,size: 25,color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Container(
                          height: 40,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(7.5)),
                            color: Colors.transparent,
                            image: DecorationImage(image: AssetImage("assets/battleground/frame2.png"),
                              fit: BoxFit.contain,
                            ),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15,right: 15),
                              child: Text(
                                "Gifts",style: TextStyles.GameRegulerWhite,
                              ),
                            ),
                          )
                      ),
                      SizedBox(width: 20,),
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
          ],
        ),
      ),
    );
  }

  Widget _giftCard(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          InnerShadow(
            blur: 2,
            color: Colors.white.withOpacity(0.5),
            offset: const Offset(2, 2),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7),
                image: DecorationImage(
                  image: AssetImage("assets/battleground/play.png"),
                  fit: BoxFit.cover,
                )
              ),
            ),
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Opacity(
                    opacity: 0.6,
                    child: Icon(Icons.share,color: Colors.white,size: 20,)),
              )),
          Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Opacity(
                    opacity: 0.6,
                    child: Icon(Icons.copy,color: Colors.white,size: 20,),
                ),
              )),
        ],
      ),
    );
  }
}
