import 'package:fitmemax/Objects/InnerShadow.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BattleGroundCash extends StatefulWidget {

  @override
  _BattleGroundCashState createState() => _BattleGroundCashState();
}

class _BattleGroundCashState extends State<BattleGroundCash> {
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
                  padding: const EdgeInsets.only(top: 60,bottom: 55),
                  child: MediaQuery.removePadding(
                    context: context,
                    removeLeft: true,
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index){
                        return _friendsCard(
                          height: _height,
                          width: _width,
                        );
                      },
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
                                "Cash",style: TextStyles.GameRegulerWhite,
                              ),
                            ),
                          )
                      ),
                      SizedBox(width: 20,),
                      Text("Available Cash :  ",style: TextStyles.GameParaWhite,),
                      Text("12054",style: TextStyles.GameSemiBoldyellow,),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 50,
                width: _width,
                decoration: BoxDecoration(
                  color: ColorPalette.BattleGroundAppBar,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2.0,
                      spreadRadius: 2.0,
                      color: Colors.black.withOpacity(0.3),
                      offset: Offset(3.0, 0),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30,right: 25,top: 7.5,bottom: 7.5),
                  child: Row(
                    children: [
                      Text("Get 500 Cash each friend who joins Battle Ground",style: TextStyles.GameSemiBoldyellow,),
                      Spacer(),
                      Container(
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(7.5)),
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    ColorPalette.Grediantblue3,
                                    ColorPalette.Grediantblue4,
                                    ColorPalette.Grediantblue3,
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
                          child: Center(child: Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15),
                            child: Text("Invite Friends",style: TextStyles.GameRegulerWhite,),
                          ))
                      ),
                      SizedBox(width: 20,),
                      Container(
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(7.5)),
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    // ColorPalette.GrediantOrrange2,
                                    ColorPalette.GrediantOrrange1,
                                    ColorPalette.GrediantOrrange2,
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
                          child: Center(child: Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15),
                            child: Text("Add by\nUnique ID ",style: TextStyles.GameParaWhite,textAlign: TextAlign.center,),
                          ))
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
  Widget _friendsCard({double height, double width,}){
    return Padding(
      padding: const EdgeInsets.only(left: 20,top: 10,bottom: 10),
      child: InnerShadow(
        blur: 2,
        color: ColorPalette.BattleGroundFriendsGreen4.withOpacity(0.5),
        offset: const Offset(2, 2),
        child: Container(
          width: 150,
          decoration: BoxDecoration(
              color : ColorPalette.BattleGroundFriendsGreen3,
              border: Border.all(
                width: 1.5,
                color: ColorPalette.BattleGroundFriendsGreen4 ,
              ),
              borderRadius: borderRadious.primeryRadious
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text("Stack of Cash",style: TextStyles.GameSemiBoldWhite,),
                Padding(
                  padding: const EdgeInsets.only(top: 5,bottom: 10),
                  child: Container(
                    height: 2,
                    width: 110,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [
                              ColorPalette.BattleGroundGreenShade5,
                              ColorPalette.BattleGroundGreenShade4,
                              ColorPalette.BattleGroundGreenShade3,
                              ColorPalette.BattleGroundGreenShade2,
                              ColorPalette.BattleGroundGreenShade1,

                              ColorPalette.BattleGroundGreenShade1,
                              ColorPalette.BattleGroundGreenShade2,
                              ColorPalette.BattleGroundGreenShade3,
                              ColorPalette.BattleGroundGreenShade4,
                              ColorPalette.BattleGroundGreenShade5,

                            ]
                        )
                    ),
                  ),
                ),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: height-227,
                          width: 133,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    ColorPalette.BattleGroundFriendsGreen3,
                                    ColorPalette.GrediantGreen2,

                                  ]
                              )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 1.8,right: 2,left: 2),
                          child: Container(
                            height: height-230,
                            width: 130,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      ColorPalette.BattleGroundFriendsGreen3,
                                      ColorPalette.BattleGroundFriendsGreen5,

                                    ]
                                )
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: height-220,
                      child: Column(
                        children: [
                          Text("80,000",style: TextStyles.GameParaYellowLIneThrough),
                          SizedBox(height: 0,),
                          Text("25%",style: TextStyles.GameBodywhite),
                          SizedBox(height: 1,),
                          Text("100,000",style: TextStyles.GameSemiBoldyellow),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10,left: 8,right: 8),
                            child: Container(
                              height: height-340,
                              // width: 110,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/battleground/multiple_cash.png"),
                                    fit: BoxFit.contain,
                                  )
                              ),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Text("2499 ₹",style: TextStyles.GameSemiBoldWhite,),
                          ),
                          Spacer(),
                        ],
                      ),
                    )
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
