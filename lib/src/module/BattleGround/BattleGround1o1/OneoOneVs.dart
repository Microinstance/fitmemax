import 'package:delayed_display/delayed_display.dart';
import 'package:fitmemax/Objects/InnerShadow.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OneoOneVs extends StatefulWidget {

  @override
  _OneoOneVsState createState() => _OneoOneVsState();
}

class _OneoOneVsState extends State<OneoOneVs> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    final Duration initialDelay = Duration(milliseconds: 1000);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: DelayedDisplay(
                      delay: initialDelay,
                      slidingBeginOffset: Offset(-0.35, 0,),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _profile(
                            isLeft: true,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: _profileCoin(
                              isLef: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  DelayedDisplay(
                    delay: initialDelay,
                    slidingBeginOffset: Offset(0,0.35),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: Alignment.topCenter,
                          clipBehavior: Clip.none,
                          children: [
                            InnerShadow(
                              blur: 5,
                              color: Colors.black.withOpacity(0.5),
                              offset: const Offset(5, 5),
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: ColorPalette.BattleGroundBackground2,
                                  borderRadius: BorderRadius.circular(7.5),
                                  border: Border.all(
                                    width: 2,
                                    color: ColorPalette.Yellow,
                                  )
                                ),
                              ),
                            ),
                            Positioned(
                                top: -50,
                                child: Text("Vs",style: TextStyles.GameBigBoldyellow,)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  DelayedDisplay(
                    delay: initialDelay,
                    slidingBeginOffset: Offset(0.35, 0,),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _profile(
                            isLeft: false,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: _profileCoin(
                              isLef: false,
                            ),
                          ),
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
    );
  }
  Widget _profile({bool isLeft }){
    return InnerShadow(
      blur: 5,
      color: Colors.black.withOpacity(0.5),
      offset: const Offset(5, 5),
      child: Container(
        height: 195,
        width: 150,
        decoration: BoxDecoration(
          color: ColorPalette.BattleGroundBackground6,
          borderRadius: BorderRadius.circular(7.5),
        ),
        child: Column(
          children: [
            Stack(
              clipBehavior : Clip.none,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: InnerShadow(
                    blur: 5,
                    color: Colors.black.withOpacity(0.5),
                    offset: const Offset(5, 5),
                    child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("images/userImage1.jpeg"),
                            fit: BoxFit.cover,
                          ),
                          border: Border.all(width: 1,color: Colors.white.withOpacity(0.2)),
                          borderRadius: BorderRadius.circular(7.5),
                        )
                    ),
                  ),
                ),
                Align(
                  alignment: isLeft ? Alignment.topLeft : Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          "assets/battleground/star.png",
                          height: 30,
                        ),
                        Text(
                          "9",
                          style: TextStyles
                              .GameParaBlack,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,bottom: 15),
              child: InnerShadow(
                blur: 5,
                color: Colors.black.withOpacity(0.5),
                offset: const Offset(5, 5),
                child: Container(
                  height:30,
                  width: 120,
                  decoration: BoxDecoration(
                    color: ColorPalette.BattleGroundBackground4,
                    border: Border.all(width: 1,color: Colors.white.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(7.5),
                  ),
                  child: Center(child: Text("Shivay",style: TextStyles.GameParaWhite,)),
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _profileCoin({bool isLef}){
    return InnerShadow(
      blur: 5,
      color: Colors.black.withOpacity(0.5),
      offset: const Offset(5, 5),
      child: Container(
        height: 60,
        width: 150,
        decoration: BoxDecoration(
          color: ColorPalette.BattleGroundBackground6,
          borderRadius: BorderRadius.circular(7.5),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: InnerShadow(
                blur: 5,
                color: Colors.black.withOpacity(0.5),
                offset: const Offset(5, 5),
                child: Container(
                  height:40,
                  width: 120,
                  decoration: BoxDecoration(
                    color: ColorPalette.BattleGroundBackground4,
                    border: Border.all(width: 1,color: Colors.white.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(7.5),
                  ),
                  child: Center(child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      isLef ?  Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text("2545",style: TextStyles.GameParaWhite,),
                      ) : Image.asset("assets/battleground/multiple_coins.png",height: 20,fit: BoxFit.contain,) ,
                      isLef ? Image.asset("assets/battleground/multiple_coins.png",height: 20,fit: BoxFit.contain,) : Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text("2545",style: TextStyles.GameParaWhite,),
                      ),
                    ],
                  )),
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
