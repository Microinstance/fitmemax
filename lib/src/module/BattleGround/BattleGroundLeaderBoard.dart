import 'package:animator/animator.dart';
import 'package:fitmemax/Objects/InnerShadow.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BattleGroundLeaderBoard extends StatefulWidget {
  @override
  _BattleGroundLeaderBoardState createState() =>
      _BattleGroundLeaderBoardState();
}

class _BattleGroundLeaderBoardState extends State<BattleGroundLeaderBoard> {
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
                  padding: const EdgeInsets.only(top: 60),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10,bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Stack(
                                  clipBehavior: Clip.none,
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        border: Border.all(
                                            color: Colors.yellow[500],
                                            width: 2.5),
                                        color: Colors.transparent,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          children: [
                                            Stack(
                                              alignment: Alignment.topRight,
                                              clipBehavior: Clip.none,
                                              children: [
                                                InnerShadow(
                                                  blur: 2,
                                                  color: Colors.black.withOpacity(0.7),
                                                  offset: const Offset(2, 2),
                                                  child: Container(
                                                    height: 100,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            "images/userImage1.jpeg"),
                                                        fit: BoxFit.cover,
                                                      ),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          7),
                                                      border: Border.all(
                                                          color: Colors.white
                                                              .withOpacity(0.5),
                                                          width: 1),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  top: -5,
                                                  right: -5,
                                                  child: Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      Image.asset(
                                                        "assets/battleground/star.png",
                                                        height: 25,
                                                      ),
                                                      Text(
                                                        "9",
                                                        style: TextStyles
                                                            .GameParaBlack,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(top: 5),
                                              child: InnerShadow(
                                                blur: 2,
                                                color:
                                                Colors.white.withOpacity(0.5),
                                                offset: const Offset(2, 2),
                                                child: Container(
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(5),
                                                    border: Border.all(
                                                        color: Colors.white
                                                            .withOpacity(0.5),
                                                        width: 1),
                                                    color: Colors.black,
                                                  ),
                                                  child: Center(
                                                    child: Padding(
                                                      padding:
                                                      const EdgeInsets.only(
                                                          top: 5,
                                                          bottom: 5,
                                                          left: 5,
                                                          right: 5),
                                                      child: Text(
                                                        "Ashok Kumar",
                                                        style: TextStyles
                                                            .GameParaWhite,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: -16,
                                      child: Image.asset("assets/battleground/2nd.png",height: 70,fit: BoxFit.contain,),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Container(
                                    width:200,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 5,top:5 ),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment : CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "150258",
                                            style: TextStyles.GameRegulerWhite,
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(left: 10),
                                            child: Image.asset(
                                              "assets/battleground/single_coin.png",
                                              height: 20,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Stack(
                                  alignment: Alignment.centerLeft,
                                  clipBehavior : Clip.none,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        border: Border.all(
                                            color: Colors.yellow[500],
                                            width: 2.5),
                                        color: Colors.transparent,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Column(
                                          children: [
                                            Stack(
                                              alignment: Alignment.topRight,
                                              clipBehavior: Clip.none,
                                              children: [
                                                InnerShadow(
                                                  blur: 2,
                                                  color: Colors.black
                                                      .withOpacity(0.7),
                                                  offset: const Offset(2, 2),
                                                  child: Container(
                                                    height: 120,
                                                    width: 120,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            "images/userImage1.jpeg"),
                                                        fit: BoxFit.cover,
                                                      ),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          7),
                                                      border: Border.all(
                                                          color: Colors.white
                                                              .withOpacity(0.5),
                                                          width: 1),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  top: -10,
                                                  right: -10,
                                                  child: Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      Image.asset(
                                                        "assets/battleground/star.png",
                                                        height: 40,
                                                      ),
                                                      Text(
                                                        "9",
                                                        style: TextStyles
                                                            .GameRegulerBlack,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(top: 10),
                                              child: InnerShadow(
                                                blur: 2,
                                                color:
                                                Colors.white.withOpacity(0.5),
                                                offset: const Offset(2, 2),
                                                child: Container(
                                                  width: 120,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(5),
                                                    border: Border.all(
                                                        color: Colors.white
                                                            .withOpacity(0.5),
                                                        width: 1),
                                                    color: Colors.black,
                                                  ),
                                                  child: Center(
                                                    child: Padding(
                                                      padding:
                                                      const EdgeInsets.only(
                                                          top: 5,
                                                          bottom: 5,
                                                          left: 10,
                                                          right: 10),
                                                      child: Text(
                                                        "Ashok Kumar",
                                                        style: TextStyles
                                                            .GameParaWhite,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: -21,
                                      child: Image.asset("assets/battleground/1st.png",height: 90,fit: BoxFit.contain,),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Container(
                                    width:200,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 5,top:5 ),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment : CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "150258",
                                            style: TextStyles.GameRegulerWhite,
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(left: 10),
                                            child: Image.asset(
                                              "assets/battleground/single_coin.png",
                                              height: 20,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Stack(
                                  clipBehavior: Clip.none,
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        border: Border.all(
                                            color: Colors.yellow[500],
                                            width: 2.5),
                                        color: Colors.transparent,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          children: [
                                            Stack(
                                              alignment: Alignment.topRight,
                                              clipBehavior: Clip.none,
                                              children: [
                                                InnerShadow(
                                                  blur: 2,
                                                  color: Colors.black.withOpacity(0.7),
                                                  offset: const Offset(2, 2),
                                                  child: Container(
                                                    height: 100,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            "images/userImage1.jpeg"),
                                                        fit: BoxFit.cover,
                                                      ),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          7),
                                                      border: Border.all(
                                                          color: Colors.white
                                                              .withOpacity(0.5),
                                                          width: 1),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  top: -5,
                                                  right: -5,
                                                  child: Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      Image.asset(
                                                        "assets/battleground/star.png",
                                                        height: 25,
                                                      ),
                                                      Text(
                                                        "9",
                                                        style: TextStyles
                                                            .GameParaBlack,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(top: 5),
                                              child: InnerShadow(
                                                blur: 2,
                                                color:
                                                Colors.white.withOpacity(0.5),
                                                offset: const Offset(2, 2),
                                                child: Container(
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(5),
                                                    border: Border.all(
                                                        color: Colors.white
                                                            .withOpacity(0.5),
                                                        width: 1),
                                                    color: Colors.black,
                                                  ),
                                                  child: Center(
                                                    child: Padding(
                                                      padding:
                                                      const EdgeInsets.only(
                                                          top: 5,
                                                          bottom: 5,
                                                          left: 5,
                                                          right: 5),
                                                      child: Text(
                                                        "Ashok Kumar",
                                                        style: TextStyles
                                                            .GameParaWhite,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: -16,
                                      child: Image.asset("assets/battleground/3rd.png",height: 70,fit: BoxFit.contain,),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Container(
                                    width:200,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 5,top:5 ),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment : CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "150258",
                                            style: TextStyles.GameRegulerWhite,
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(left: 10),
                                            child: Image.asset(
                                              "assets/battleground/single_coin.png",
                                              height: 20,
                                              fit: BoxFit.contain,
                                            ),
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
                      Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: ColorPalette.BattleGroundBackground8,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 10,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index){
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    height: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: ColorPalette.BattleGroundBackground6,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(7.0),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 70,
                                            decoration: BoxDecoration(
                                              color: ColorPalette.BattleGroundBackground8,
                                              borderRadius: BorderRadius.circular(3),
                                            ),
                                            child: Center(child: Text("#${4+index}",style: TextStyles.GameSemiBoldyellow,)),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10),
                                            child: Stack(
                                              alignment: Alignment.center,
                                              // clipBehavior: Clip.none,
                                              children: [
                                                Container(
                                                  height: 40,
                                                  width: 40,
                                                  decoration: BoxDecoration(
                                                     // borderRadius: BorderRadius.circular(5),
                                                    image: DecorationImage(
                                                      image: AssetImage("images/userImage3.jpeg"),
                                                      fit: BoxFit.cover,
                                                    )
                                                  ),
                                                ),
                                                Container(
                                                  height: 50,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage("assets/battleground/frame_1.png"),
                                                      fit: BoxFit.contain,
                                                    )
                                                  ),
                                                ),

                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10,bottom: 5),
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Image.asset(
                                                  "assets/battleground/star.png",
                                                  height: 40,
                                                ),
                                                Text(
                                                  "9",
                                                  style: TextStyles.GameRegulerBlack,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 15),
                                            child: Container(
                                              height: 30,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image:
                                                  AssetImage("assets/battleground/india.png"),
                                                  fit: BoxFit.cover,
                                                ),
                                                border: Border.all(color: Colors.white, width: 1),
                                                borderRadius: BorderRadius.circular(3),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10),
                                            child: SizedBox(
                                              height: 50,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Anurag Dutta",
                                                    style: TextStyles.GameRegulerWhite,
                                                  ),
                                                  Opacity(
                                                      opacity: 0.4,
                                                      child: Text(
                                                        "No Clan!",
                                                        style: TextStyles.GameShadowWhite1,
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          Text("100",style: TextStyles.GameRegulerBigWhite,),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 15),
                                            child: Image.asset("assets/battleground/multiple_coins.png",height: 50,fit: BoxFit.contain,width: 40,),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
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
                                  "Leaderboard",
                                  style: TextStyles.GameRegulerWhite,
                                ),
                              ),
                            )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  "assets/battleground/star.png",
                                  height: 40,
                                ),
                                Text(
                                  "9",
                                  style: TextStyles.GameRegulerBlack,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 40,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage("assets/battleground/india.png"),
                                fit: BoxFit.cover,
                              ),
                              border: Border.all(color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Anurag Dutta",
                                  style: TextStyles.GameRegulerWhite,
                                ),
                                Opacity(
                                    opacity: 0.4,
                                    child: Text(
                                      "No Clan!",
                                      style: TextStyles.GameShadowWhite1,
                                    )),
                              ],
                            ),
                          ),
                          Text(
                            "#477",
                            style: TextStyles.GameRegulerYellow,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
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
}
