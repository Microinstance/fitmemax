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
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 5, bottom: 5),
                                      child: Container(
                                        height: 50,
                                        width: _width - 160,
                                        decoration: BoxDecoration(
                                            color: ColorPalette
                                                .BattleGroundBackground6,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      ),
                                    );
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
}
