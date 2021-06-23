import 'package:fitmemax/Objects/InnerShadow.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChooseBet extends StatefulWidget {
  @override
  _ChooseBetState createState() => _ChooseBetState();
}

class _ChooseBetState extends State<ChooseBet> {

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top: 30,bottom: 30,right: _width*0.1,left: _width*0.1),
      child: Stack(
        alignment: Alignment.topRight,
        clipBehavior: Clip.none,
        children: [
          Container(
            height: _height-60,
            width: _width*0.8 ,
            decoration: BoxDecoration(
              color: ColorPalette.BattleGroundBackground7,
              borderRadius: BorderRadius.circular(7.5),
              border: Border.all(color: Colors.white.withOpacity(0.1),width: 1)
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10,bottom: 10),
                  child: Text("Choose your bet!",style: TextStyles.GameSemiBoldyellow,),
                ),
                Container(
                    height: (_height-60)-130,
                    width: (_width*0.8)-40,
                  decoration: BoxDecoration(
                    color: ColorPalette.BattleGroundBackground8,
                    borderRadius: BorderRadius.circular(7.5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: GridView.count(
                      shrinkWrap: true,
                      childAspectRatio: 1/0.35,
                      crossAxisCount: 4,
                      children: List.generate(20, (index) => _bet(
                        coins: "${10 + (10 * index)}",
                      )),
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Prize is double your Bet!",style: TextStyles.GameSemiBoldyellow,),
                      Container(
                          height: 35,
                          width: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(7.5)),
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    ColorPalette.GrediantGreen3,
                                    ColorPalette.GrediantGreen5,
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
                            padding: const EdgeInsets.only(left: 5,right: 5),
                            child: Text("Confirm",style: TextStyles.GameRegulerBigWhite,),
                          ))
                      ),
                    ],
                  ),
                ),
                Spacer(),
              ],
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
    );
  }
}
class _bet extends StatefulWidget {
  String coins;
  _bet({this.coins});
  @override
  __betState createState() => __betState();
}

class __betState extends State<_bet> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: (){
          setState(() {
            isSelected ? isSelected = false : isSelected = true;
          });
        },
        child: Container(
          decoration: BoxDecoration(
              color: isSelected ? Colors.black : ColorPalette.BattleGroundBackground6,
              borderRadius: BorderRadius.circular(7.5),
              border: Border.all(
                color: Colors.white.withOpacity(0.5),
                width: isSelected ? 1 : 0,
              )
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.coins,style: TextStyles.GameSemiBoldyellow,),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Image.asset("assets/battleground/single_coin.png",height: 20,fit: BoxFit.contain,),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
