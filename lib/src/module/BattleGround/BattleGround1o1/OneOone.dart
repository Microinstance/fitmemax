import 'package:animator/animator.dart';
import 'package:fitmemax/Objects/InnerShadow.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ChooseBet.dart';

class OneOone extends StatefulWidget {
  @override
  _OneOoneState createState() => _OneOoneState();
}

class _OneOoneState extends State<OneOone> {
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
              child: Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    childAspectRatio: 1/0.75,
                    children: List.generate(6, (index) => _Catagory(
                      width: _width,
                      height: _height,
                      titel: "Running",
                      image: ""
                    )),
                  )),
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
                                  "One O One",
                                  style: TextStyles.GameRegulerWhite,
                                ),
                              ),
                            )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 10, right: 15),
                        child: Text(
                          "Choose your Category",
                          style: TextStyles.GameSemiBoldyellow,
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
          ],
        ),
      ),
    );
  }
  Widget _Catagory({double width, double height, String titel,String image}){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap:(){
          showDialog(
              context: context,
              builder: (_) => ChooseBet()
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.5),
            border: Border.all(color: Colors.white.withOpacity(0.4),
        )),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  InnerShadow(
                    blur: 5,
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(5, 5),
                    child: Container(
                      height: 135,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(7.5),topLeft:Radius.circular(7.5) ),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              ColorPalette.Grediantblue5,
                              ColorPalette.Grediantblue6,
                              ColorPalette.Grediantblue5,
                            ]
                          )),
                    ),
                  ),
                  Image.asset('assets/battleground/onooone_cat1.png',height: 100,),
                ],
              ),
              Container(
                height: 0.5,
                decoration: BoxDecoration(
                    color: Colors.white),
              ),
              Spacer(),
              Text("Running",style: TextStyles.GameSemiBoldyellow,),
              Spacer(),
            ],
          ),

        ),
      ),

    );
  }
}
