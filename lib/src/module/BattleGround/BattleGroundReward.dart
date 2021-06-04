import 'package:fitmemax/Objects/InnerShadow.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';

class BattleGroundReward extends StatefulWidget {
  const BattleGroundReward({Key key}) : super(key: key);

  @override
  _BattleGroundRewardState createState() => _BattleGroundRewardState();
}

class _BattleGroundRewardState extends State<BattleGroundReward> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Material(
      type: MaterialType.transparency,
      child: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 30, bottom: 30, right: 80, left: 80),
          child: Stack(
            alignment: Alignment.topRight,
            overflow: Overflow.visible,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: ColorPalette.BattleGroundBackground4,
                    borderRadius: borderRadious.primeryRadious,
                    border: Border.all(
                      width: 1,
                      color: Colors.white.withOpacity(0.2),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      InnerShadow(
                        blur: 3,
                        color: Colors.black.withOpacity(0.3),
                        offset: const Offset(5, 5),
                        child: Container(
                          decoration: BoxDecoration(
                              color: ColorPalette.BattleGroundBackground5,
                              borderRadius: borderRadious.primeryRadious),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(
                                  4,
                                  (index) => Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(7.5)),
                                          gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                ColorPalette.GrediantGreen3,
                                                ColorPalette.GrediantGreen5,
                                              ]),
                                          border: Border.all(
                                            width: 1.5,
                                            color:
                                                Colors.white.withOpacity(0.3),
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.white
                                                  .withOpacity(0.05),
                                              spreadRadius: 1,
                                              blurRadius: 1,
                                            )
                                          ]),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5,
                                            right: 5,
                                            top: 5,
                                            bottom: 5),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Free Coins\n50 coins",
                                              style:
                                                  TextStyles.GameRegulerWhite,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Image.asset(
                                              "assets/battleground/coins1.png",
                                              width: _width * 0.03,
                                            ),
                                          ],
                                        ),
                                      )),
                                )),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(
                          "Daily Missions",
                          style: TextStyles.GameSemiBoldyellow,
                        ),
                      ),
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          InnerShadow(
                            blur: 3,
                            color: Colors.black.withOpacity(0.3),
                            offset: const Offset(5, 5),
                            child: Container(
                              height: _height - 220,
                              width: _width - 160,
                              decoration: BoxDecoration(
                                  color: ColorPalette.BattleGroundBackground5,
                                  borderRadius: borderRadious.primeryRadious),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "Mission",
                                          style: TextStyles.GameShadowWhite1,
                                        ),
                                        Text(
                                          "Reward",
                                          style: TextStyles.GameShadowWhite1,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 5,
                            right: 5,
                            left: 5,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 12, bottom: 7),
                              child: SizedBox(
                                height: _height - 257,
                                width: _width - 180,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 5,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return _missonRewards(width: _width);
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: -15,
                right: -15,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
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
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _missonRewards({double width}){
    return Padding(
      padding: const EdgeInsets.only(
          left: 5, right: 5, bottom: 5),
      child: Container(
        height: 55,
        width: (width - 300),
        decoration: BoxDecoration(
            color: ColorPalette
                .BattleGroundBackground6,
            borderRadius:
            BorderRadius.circular(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: (width - 300)*0.6,
              child: Padding(
                padding: const EdgeInsets.only(left: 5,top: 5,bottom: 5,right: 5),
                child: Column(
                  children: [
                    Container(
                     height: 25,
                      width: ((width - 300)*0.6)-10,
                      decoration: BoxDecoration(
                        color: ColorPalette.BattleGroundBackground7,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text("Send or Request gifts from Friends",style: TextStyles.GameParaWhite,),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                height: 15,
                                width: 15,
                                child: MaterialButton(
                                  height: 20,
                                  onPressed: (){},
                                  color: ColorPalette.BattleGroundFriendsGreen5,
                                  elevation: 0,
                                ),
                              ),
                              Icon(Icons.refresh,color: Colors.white,size:10 ,)
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: 15,
                                  width: ((width - 300)*0.6)-30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: ColorPalette.BattleGroundBackground8,
                                  ),
                                ),
                                Text("0/100",style: TextStyles.GameBodywhite,)
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: (width - 300)*0.4,
              child: Padding(
                padding: const EdgeInsets.only(right:5, ),
                child: Row(
                  children: [
                    Container(
                        height: 45,
                        width:( ((width - 300)*0.4)-10)/2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(3)),
                            color:ColorPalette.BattleGroundBackground9,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 5,
                              right: 5,
                              top: 5,
                              bottom: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                            Column(
                              children: [
                                Image.asset("assets/battleground/coins1.png",height: 15,fit: BoxFit.contain,),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text("1.2k",style: TextStyles.GameParaWhite,),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset("assets/battleground/clan.png",height: 15,fit: BoxFit.contain,),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text("+450",style: TextStyles.GameParaYellow,),
                                )
                              ],
                            ),
                          ],),

                        )),
                    Padding(
                      padding: const EdgeInsets.only(left:5, ),
                      child: Container(
                        height: 45,
                          width:( ((width - 300)*0.4)-10)/2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(3)),
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    ColorPalette.GrediantGreen3,
                                    ColorPalette.GrediantGreen5,
                                  ]),
                              border: Border.all(
                                width: 1.5,
                                color:
                                Colors.white.withOpacity(0.3),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white
                                      .withOpacity(0.05),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                )
                              ]),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 5,
                                  right: 5,
                                  top: 5,
                                  bottom: 5),
                              child: Text("See Gifts",style: TextStyles.GameRegulerWhite,),

                            ),
                          )),
                    ),
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
