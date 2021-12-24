import 'package:animator/animator.dart';
import 'package:fitmemax/Objects/InnerShadow.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BattleGroundSolo extends StatefulWidget {

  @override
  _BattleGroundSoloState createState() => _BattleGroundSoloState();
}

class _BattleGroundSoloState extends State<BattleGroundSolo> {
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
                                  "Solo",
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
              top: 80,
              child: Container(
                height: _height-60,
                width: _width,
                child:ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index){
                    return Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                      child: Container(
                        width: _width-60,
                        decoration: BoxDecoration(
                          color: Color(0xFF081832),
                          borderRadius: BorderRadius.circular(7.5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(25),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset("assets/others/trophy.png",height: 60,fit: BoxFit.contain,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Super Riser",style: TextStyles.GameBigBoldyellow,),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text("Starts when tourney is full",style: TextStyles.GameRegulerWhite,),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Winners",style: TextStyles.GameRegulerWhite,),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text("6",style: TextStyles.GameBigBoldyellow,),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Entry",style: TextStyles.GameRegulerWhite,),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text("\₹25",style: TextStyles.GameBigBoldyellow,),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Opacity(
                                      opacity:0.4,
                                      child: Text("48/60",style: TextStyles.GameRegulerBigWhite,)),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Stack(
                                      alignment: Alignment.centerLeft,
                                      children: [
                                        Container(
                                          width: 154,
                                          height: 18,
                                          decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(0.2),
                                            borderRadius: BorderRadius.circular(7.5),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 2,top: 2,bottom: 2,right: 2),
                                          child: Container(
                                            width: 150*(48/60),
                                            height: 14,
                                            decoration: BoxDecoration(
                                              color: ColorPalette.FluracentGreen,
                                              borderRadius: BorderRadius.circular(7.5),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Prize ',
                                          style: TextStyles.GameRegulerWhite,
                                        ),
                                        TextSpan(
                                          text: '\₹25" ',
                                          style: TextStyles.GameBigBoldyellow,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 0),
                                    child: MaterialButton(
                                        shape:  RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(7.5),
                                        ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                                          child:(index==1)  ?Text("Completed",style: TextStyles.GameRegulerWhite,) : Text("Register",style: TextStyles.GameRegulerWhite,),
                                        ),
                                      ),
                                      color:(index==1)  ? ColorPalette.GrediantOrrange2 :ColorPalette.GreenLight,
                                      onPressed: (){},
                                    )
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
