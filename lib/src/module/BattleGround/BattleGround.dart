import 'package:animator/animator.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:fitmemax/src/module/BattleGround/BattleGround1o1/OneOone.dart';
import 'package:fitmemax/src/module/BattleGround/BattleGroundCash.dart';
import 'package:fitmemax/src/module/BattleGround/BattleGroundCoins.dart';
import 'package:fitmemax/src/module/BattleGround/BattleGroundFriends.dart';
import 'package:fitmemax/src/module/BattleGround/BattleGroundGifts.dart';
import 'package:fitmemax/src/module/BattleGround/BattleGroundGroup/BattleGroundGroup.dart';
import 'package:fitmemax/src/module/BattleGround/BattleGroundLeaderBoard.dart';
import 'package:fitmemax/src/module/BattleGround/BattleGroundProfile.dart';
import 'package:fitmemax/src/module/dashboard/Dashboard.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:page_transition/page_transition.dart';
import 'BattleGroundBeast/BattleGroundBeast.dart';
import 'BattleGroundReward.dart';
import 'BattleGroundSolo/BattleGroundSolo.dart';
import 'MyClub/MyClub.dart';

class BattleGround extends StatefulWidget {
  @override
  _BattleGroundState createState() => _BattleGroundState();
}

class _BattleGroundState extends State<BattleGround> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    final Duration initialDelay = Duration(milliseconds: 800);
    final Duration SendoryDelay = Duration(milliseconds: 300);
    return (_height < _width) ? Scaffold(
      backgroundColor: Colors.transparent,
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
            child: Column(
              children: [
                DelayedDisplay(
                  delay: initialDelay,
                  slidingBeginOffset: Offset(0, -0.35,),
                  child: Container(
                    height: 60,
                    width: _width,
                    decoration:
                        BoxDecoration(color: Colors.black.withOpacity(0.6)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 25,
                        right: 25,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Stack(
                                clipBehavior: Clip.none,
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    height: 60,
                                    width: _width * 0.08,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: GestureDetector(
                                        onTap: (){
                                          Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: MyClub()));
                                        },
                                        child: Column(
                                          children: [
                                            Image.asset("assets/battleground/clan.png", height: 30, width: _width * 0.07 - 20),
                                            Spacer(),
                                            Text("Clan", style: TextStyles.GameRegulerWhite),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      top: 7,
                                      child: Image.asset("assets/battleground/beta.png",height: 35,fit: BoxFit.contain,)),
                                ],
                              ),
                              _deviders()
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 5, bottom: 5, left: 7, right: 7),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: BattleGroundProfile()));
                                  },
                                  child: Container(
                                    height: 50,
                                    width: _width * 0.07 - 10,
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "images/userImage7.jpeg"),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.circular(3),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.white.withOpacity(0.4),
                                            spreadRadius: 0.4,
                                            blurRadius: 0.4,
                                          )
                                        ]),
                                  ),
                                ),
                              ),
                              _deviders()
                            ],
                          ),
                          Row(
                            children: [
                              Stack(
                                alignment: Alignment.centerRight,
                                children: [
                                  GestureDetector(
                                    onTap:(){
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType.fade,
                                              child: BattleGroundProfile()));
                                    },
                                    child: Container(
                                      height: 60,
                                      width: _width * 0.11,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 5,
                                              top: 7,
                                              right: 5,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                    height: 28,
                                                    child: Stack(
                                                      alignment: Alignment.center,
                                                      children: [
                                                        Image.asset(
                                                          "assets/battleground/star.png",
                                                          height: 28,
                                                        ),
                                                        Stack(
                                                          alignment:
                                                              Alignment.center,
                                                          children: [
                                                            Opacity(
                                                                opacity: 0.5,
                                                                child: Text(
                                                                  "3",
                                                                  style: TextStyles
                                                                      .GameShadowblack1,
                                                                )),
                                                            Text(
                                                              "3",
                                                              style: TextStyles
                                                                  .GameShadowWhite1,
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    )),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      top: 2),
                                                  child: Text(
                                                    "Anurag",
                                                    style:
                                                        TextStyles.GameBodywhite,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Spacer(),
                                          Container(
                                            height: 20,
                                            width: _width * 0.12,
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                child: Padding(
                                              padding:
                                                  const EdgeInsets.only(right: 2),
                                              child: Text(
                                                "4500",
                                                style: TextStyles.GameParaYellow,
                                              ),
                                            )),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 7, top: 20),
                                    child: Animator(
                                      duration: Duration(seconds: 1),
                                      cycles: 0,
                                      resetAnimationOnRebuild: true,
                                      tween: Tween<double>(begin: 0.7, end: 1),
                                      builder: (_, anim, __) => Transform.scale(
                                        origin: Offset(1, 2),
                                        scale: anim.value,
                                        child: Image.asset(
                                          "assets/battleground/coins1.png",
                                          height: 15,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              _deviders(),
                            ],
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap:(){
                                  showDialog(
                                      context: context,
                                      builder: (_) => BattleGroundReward()
                                  );
                                },
                                child: Container(
                                  height: 60,
                                  width: _width * 0.1,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                      children: [
                                        Stack(
                                          clipBehavior: Clip.none,
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
                                                        "assets/battleground/shop.png",
                                                        height: 30,
                                                        width: _width * 0.07 - 20),
                                                  ),
                                            ),
                                            Positioned(
                                              right: -5,
                                              top: -5,
                                              child: CircleAvatar(
                                                radius: 10,
                                                backgroundColor: Colors.white,
                                                child: CircleAvatar(
                                                  radius: 8,
                                                  backgroundColor: Colors.yellow,
                                                  child: Text("2",style: TextStyles.GameParaBlack,),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Text("Rewards",
                                            style: TextStyles.GameRegulerWhite)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              _deviders()
                            ],
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap:(){
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: BattleGroundLeaderBoard()));
                                },
                                child: Container(
                                  height: 60,
                                  width: _width * 0.165,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 7),
                                    child: Column(
                                      children: [
                                        Stack(
                                          alignment: Alignment.topRight,
                                          overflow: Overflow.visible,
                                          children: [
                                            Animator(
                                              duration: Duration(seconds: 1),
                                              cycles: 0,
                                              resetAnimationOnRebuild: true,
                                              tween: Tween<double>(
                                                  begin: 0.85, end: 1),
                                              builder: (_, anim, __) =>
                                                  Transform.scale(
                                                origin: Offset(1, 2),
                                                scale: anim.value,
                                                child: Image.asset(
                                                  "assets/battleground/leaderboard.png",
                                                  height: 25,
                                                  fit: BoxFit.contain,
                                                  color: ColorPalette.Yellow,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top: -3,
                                              right: -10,
                                              child: CircleAvatar(
                                                radius: 8,
                                                backgroundColor: ColorPalette.Red,
                                                child: Center(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 1, right: 1),
                                                    child: Text(
                                                      '3',
                                                      style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          "Leaderboard",
                                          style: TextStyles.GameRegulerWhite,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              _deviders(),
                            ],
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: BattleGroundCoins()));
                                },
                                child: Container(
                                  height: 60,
                                  width: _width * 0.10,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            top: 7,
                                            right: _width * 0.016,
                                          ),
                                          child: Column(
                                            children: [
                                              Animator(
                                                duration: Duration(seconds: 1),
                                                cycles: 0,
                                                resetAnimationOnRebuild: true,
                                                tween: Tween<double>(
                                                    begin: 0.85, end: 1),
                                                builder: (_, anim, __) =>
                                                    Transform.scale(
                                                      origin: Offset(1, 2),
                                                      scale: anim.value,
                                                      child: Image.asset(
                                                          "assets/battleground/multiple_coins.png",
                                                          height: 28,
                                                          fit: BoxFit.contain),
                                                    ),
                                              ),
                                              SizedBox(
                                                height: 3,
                                              ),
                                              Text(
                                                "4500",
                                                style:
                                                TextStyles.GameRegulerYellow,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Align(
                                          alignment: Alignment.centerRight,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 0, bottom: 1, top: 1),
                                            child: Container(
                                                height: 58,
                                                width: _width * 0.0175,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(2),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.white
                                                          .withOpacity(0.2),
                                                      blurRadius: 1,
                                                      spreadRadius: 1,
                                                    ),
                                                  ],
                                                  gradient: LinearGradient(
                                                      begin: Alignment.topCenter,
                                                      end: Alignment.bottomCenter,
                                                      colors: [
                                                        ColorPalette
                                                            .GrediantGreen1,
                                                        ColorPalette
                                                            .GrediantGreen2,
                                                        ColorPalette
                                                            .GrediantGreen1,
                                                      ]),
                                                ),
                                                child: Center(
                                                  child: Icon(
                                                    Icons.add,
                                                    color: Colors.white,
                                                    size: 15,
                                                  ),
                                                )),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                              _deviders()
                            ],
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: BattleGroundCash()));
                                },
                                child: Container(
                                  height: 60,
                                  width: _width * 0.10,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            top: 7,
                                            right: _width * 0.016,
                                          ),
                                          child: Column(
                                            children: [
                                              Animator(
                                                duration: Duration(seconds: 1),
                                                cycles: 0,
                                                resetAnimationOnRebuild: true,
                                                tween: Tween<double>(
                                                    begin: 0.85, end: 1),
                                                builder: (_, anim, __) =>
                                                    Transform.scale(
                                                  origin: Offset(1, 2),
                                                  scale: anim.value,
                                                  child: Image.asset(
                                                      "assets/battleground/multiple_cash.png",
                                                      height: 28,
                                                      fit: BoxFit.contain),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 3,
                                              ),
                                              Text(
                                                "4500",
                                                style:
                                                    TextStyles.GameRegulerYellow,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Align(
                                          alignment: Alignment.centerRight,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 0, bottom: 1, top: 1),
                                            child: Container(
                                                height: 58,
                                                width: _width * 0.0175,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(2),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.white
                                                          .withOpacity(0.2),
                                                      blurRadius: 1,
                                                      spreadRadius: 1,
                                                    ),
                                                  ],
                                                  gradient: LinearGradient(
                                                      begin: Alignment.topCenter,
                                                      end: Alignment.bottomCenter,
                                                      colors: [
                                                        ColorPalette
                                                            .GrediantGreen1,
                                                        ColorPalette
                                                            .GrediantGreen2,
                                                        ColorPalette
                                                            .GrediantGreen1,
                                                      ]),
                                                ),
                                                child: Center(
                                                  child: Icon(
                                                    Icons.add,
                                                    color: Colors.white,
                                                    size: 15,
                                                  ),
                                                )),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                              _deviders()
                            ],
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: BattleGroundGifts()));
                                },
                                child: Container(
                                  height: 60,
                                  width: _width * 0.07,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
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
                                        Spacer(),
                                        Text("Gifts",
                                            style: TextStyles.GameRegulerWhite)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              _deviders()
                            ],
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: Dashboard()));
                                },
                                child: Container(
                                  height: 60,
                                  width: _width * 0.05,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.power_settings_new_rounded,
                                          size: 25,
                                          color: ColorPalette.Red,
                                        ),
                                      ],
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
                ),
                Spacer(),
                Container(
                  height: 140,
                  child: MediaQuery.removePadding(
                    removeLeft: true,
                    context: context,
                    child: AnimationLimiter(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int index) {
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 2000),
                            child: ScaleAnimation(
                                scale: 0.8,
                                child: FadeInAnimation(child: _play(
                                  isBeta: (index == 0) ? false : true,
                                  image: _image(index),
                                    onTap:(){
                                      if(index == 0){
                                        Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: OneOone()));
                                      } else if(index == 1){
                                        Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: BattleGroundSolo()));
                                      }  else if(index == 2){
                                        Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: BattleGroundGroup()));
                                      }else if(index == 3){
                                        Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: BattleGroundBeast()));
                                      }
                                    },
                                ))),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: [
                      SafeArea(child: SizedBox()),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: DelayedDisplay(
                          delay: initialDelay,
                          slidingBeginOffset: Offset(
                            -0.35,
                            0,
                          ),
                          child: GestureDetector(
                            onTap: (){
                              // Navigator.push(
                              //     context,
                              //     PageTransition(
                              //         type: PageTransitionType.fade,
                              //         child: BattleGroundSpin()));
                            },
                            child: Stack(
                              alignment: Alignment.topRight,
                              overflow: Overflow.visible,
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(20),
                                      border: Border.all(
                                          color: Colors.yellow.withOpacity(0.2),
                                          width: 2),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.yellow.withOpacity(0.2),
                                          blurRadius: 3,
                                          spreadRadius: 3,
                                        )
                                      ]),
                                  child: Center(
                                    child: Image.asset("assets/battleground/mod-redef copy.png",height: 40,fit: BoxFit.contain,),
                                  ),
                                ),
                                Positioned(
                                  top: -5,
                                  right: -5,
                                  child: CircleAvatar(
                                    radius: 9,
                                    backgroundColor: ColorPalette.Red,
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 1.1, right: 0.2),
                                        child: Text(
                                          '0',
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // Positioned(
                                //     top: 1,
                                //     right: 5,
                                //     child: Image.asset("assets/battleground/beta.png",height: 33,fit: BoxFit.contain,)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            4,
                            (index) => DelayedDisplay(
                                delay: initialDelay,
                                slidingBeginOffset: Offset(
                                  0,
                                  0.35,
                                ),
                                child: GestureDetector(
                                    onTap: (){
                                      // playMusic(path: loopAudio);
                                    },
                                    child: _boxSlot()))),

                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: DelayedDisplay(
                          delay: initialDelay,
                          slidingBeginOffset: Offset(
                            -0.35,
                            0,
                          ),
                          child: GestureDetector(
                            onTap:(){
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      child: BattleGroundFriends()));
                            },
                            child: Stack(
                              alignment: Alignment.topRight,
                              overflow: Overflow.visible,
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      borderRadious.secendaryRadious,
                                      border: Border.all(
                                          color: Colors.white.withOpacity(0.2),
                                          width: 2),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white.withOpacity(0.2),
                                          blurRadius: 3,
                                          spreadRadius: 3,
                                        )
                                      ]),
                                  child: Center(
                                    child: Icon(
                                      Icons.people_outline_sharp,
                                      color: Colors.white.withOpacity(0.8),
                                      size: 25,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: -3,
                                  right: -10,
                                  child: CircleAvatar(
                                    radius: 9,
                                    backgroundColor: ColorPalette.Red,
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 1.1, right: 0.2),
                                        child: Text(
                                          '3',
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SafeArea(child: SizedBox()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ) : Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SizedBox(
          height: 70,
          width: 70,
          child: CircularProgressIndicator(
            color: Colors.yellow,
          ),
        ),
      ),
    );
  }
  Widget _deviders() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 1),
          child: Container(
            height: 60,
            width: 0.05,
            decoration: BoxDecoration(
                borderRadius: borderRadious.secendaryRadious,
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.4),
                    spreadRadius: 0.4,
                    blurRadius: 0.4,
                  )
                ]),
          ),
        ),
        Container(
          height: 60,
          width: 3,
          decoration: BoxDecoration(
            borderRadius: borderRadious.secendaryRadious,
            color: Colors.black,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 1),
          child: Container(
            height: 60,
            width: 0.05,
            decoration:
                BoxDecoration(borderRadius: borderRadious.secendaryRadious,
                    // color: Colors.white.withOpacity(0.5),
                    boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.4),
                    spreadRadius: 0.4,
                    blurRadius: 0.4,
                  )
                ]),
          ),
        ),
      ],
    );
  }
  Widget _play({String image = "assets/battleground/play.png", Function onTap,bool isBeta = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, top: 5, bottom: 5, left: 20),
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          alignment: Alignment.topLeft,
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 140,
              width: 240,
              decoration: BoxDecoration(
                  borderRadius: borderRadious.secendaryRadious,
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.1),
                      blurRadius: 2,
                      spreadRadius: 3,
                    )
                  ]),
            ),
           isBeta ? Padding(
             padding: const EdgeInsets.only(top: 1),
             child: Image.asset("assets/battleground/beta.png",height: 57,fit: BoxFit.contain,),
           ) : SizedBox(),
          ],
        ),
      ),
    );
  }
  Widget _boxSlot() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: GestureDetector(
        onTap:(){
        },
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.4),
            borderRadius: borderRadious.secendaryRadious,
            border: Border.all(
              color: Colors.white.withOpacity(0.15),
              width: 1,
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "Box Slot",
                style: TextStyles.GameParaWhite,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
  String _image(int index) {
    if (index == 0){
      return "assets/battleground/1o1.png" ;
    } if (index == 1){
      return "assets/battleground/beast.png" ;
    } if (index == 2){
      return "assets/battleground/clanwar.png" ;
    } else return "assets/battleground/solo.png" ;
  }
}
