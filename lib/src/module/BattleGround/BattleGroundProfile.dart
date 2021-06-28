import 'package:animator/animator.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BattleGroundProfile extends StatefulWidget {
  const BattleGroundProfile({Key key}) : super(key: key);

  @override
  _BattleGroundProfileState createState() => _BattleGroundProfileState();
}

class _BattleGroundProfileState extends State<BattleGroundProfile> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    final Duration initialDelay = Duration(milliseconds: 1000);
    final Duration SendoryDelay = Duration(milliseconds: 300);
    
    return Scaffold(
      backgroundColor: ColorPalette.BattleGroundBackground,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: _height,
              width: _width,
              decoration: BoxDecoration(
              ),
            ),
            Container(
              height: _height,
              width: _width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15,top: 70,bottom: 17),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                height: _height*0.3,
                                width: _height*0.3,
                                child: Padding(
                                  padding: EdgeInsets.all(_height*0.01),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("images/userImage7.jpeg"),
                                        fit: BoxFit.cover,
                                      ),

                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: _height*0.3,
                                width: _height*0.3,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/battleground/frame1.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                           padding: const EdgeInsets.only(left: 15,),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: [
                               Row(
                                 children: [
                                   Container(
                                     height: 27,
                                     width: 35,
                                     decoration: BoxDecoration(
                                       image: DecorationImage(
                                         image: AssetImage("assets/battleground/india.png"),
                                         fit: BoxFit.cover
                                       ),
                                       borderRadius: BorderRadius.circular(2),
                                       border: Border.all(width: 2,color: Colors.white.withOpacity(0.9)),
                                     ),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.only(left: 10),
                                     child: Text("Anurag Dutta",style: TextStyles.GameRegulerBigWhite,),
                                   )
                                 ],
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(top: 10),
                                 child: Row(
                                   children: [
                                     Container(
                                       height: 35,
                                       width: 30,
                                       decoration: BoxDecoration(
                                         image: DecorationImage(
                                           image: AssetImage("assets/battleground/clanlogo.png"),
                                           fit: BoxFit.contain
                                         ),
                                       ),
                                     ),
                                     Padding(
                                       padding: const EdgeInsets.only(left: 10),
                                       child: Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                           Text("FriendsDgp",style: TextStyles.GameRegulerYellow,),
                                           SizedBox(height: 3,),
                                           Text("Co-Leader",style: TextStyles.GameRegulerWhite,),
                                         ],
                                       ),
                                     ),


                                   ],
                                 ),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(top: 10),
                                 child: Row(
                                   children: [
                                     Text("880 536",style: TextStyles.GameRegulerYellow,),
                                     SizedBox(
                                       width: 5,
                                     ),
                                     Animator(
                                       duration: Duration(seconds: 1),
                                       cycles: 0,
                                       resetAnimationOnRebuild: true,
                                       tween: Tween<double>(begin: 0.8, end: 1),
                                       builder: (_, anim, __) => Transform.scale(
                                         origin: Offset(1, 2),
                                         scale: anim.value,
                                       child: Container(
                                         height: 22,
                                         width: 50,
                                         decoration: BoxDecoration(
                                           image: DecorationImage(
                                               image: AssetImage("assets/battleground/coins2.png"),
                                               fit: BoxFit.contain
                                           ),
                                         ),
                                       ),
                                     ),
                                     ),
                                   ],
                                 ),
                               ),

                             ],
                           ),
                         ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Level Progress",style: TextStyles.GameBodywhite,),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Stack(
                                      overflow: Overflow.visible,
                                      alignment: Alignment.center,
                                      children: [
                                        Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            Container(
                                              height: 14.5,
                                              width: _width*0.13,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.black,
                                                  width: 2,
                                                ),
                                                color: Colors.black,
                                                borderRadius: BorderRadius.circular(2),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(2),
                                              child: Container(
                                                height: 12,
                                                width: _width*0.13*0.56,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      ColorPalette.GrediantGreen3,
                                                      ColorPalette.GrediantGreen4,
                                                      ColorPalette.GrediantGreen5,
                                                    ],
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                  ),
                                                  borderRadius: BorderRadius.circular(2,
                                                ),
                                              ),
                                              )),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 1),
                                          child: Text("88508/250000",style: TextStyles.BodyBoldWhite,),
                                        ),
                                        Positioned(
                                          right: -16,
                                          bottom: -5,
                                          child:      Container(
                                            height: 30,
                                            width: 32,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage("assets/battleground/medel.png"),
                                                  fit: BoxFit.contain
                                              ),
                                            ),
                                          ),),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(height: 7,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Level Progress",style: TextStyles.GameBodywhite,),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Stack(
                                      clipBehavior: Clip.none, alignment: Alignment.center,
                                      children: [
                                        Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            Container(
                                              height: 14.5,
                                              width: _width*0.13,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.black,
                                                  width: 2,
                                                ),
                                                color: Colors.black,
                                                borderRadius: BorderRadius.circular(2),
                                              ),
                                            ),
                                            Padding(
                                                padding: const EdgeInsets.all(2),
                                                child: Container(
                                                  height: 12,
                                                  width: _width*0.13*0.56,
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        ColorPalette.GrediantGreen3,
                                                        ColorPalette.GrediantGreen4,
                                                        ColorPalette.GrediantGreen5,
                                                      ],
                                                      begin: Alignment.topCenter,
                                                      end: Alignment.bottomCenter,
                                                    ),
                                                    borderRadius: BorderRadius.circular(2,
                                                    ),
                                                  ),
                                                )),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 1),
                                          child: Text("88508/250000",style: TextStyles.BodyBoldWhite,),
                                        ),
                                        Positioned(
                                          right: -16,
                                          bottom: -5,
                                          child:      Container(
                                            height: 30,
                                            width: 32,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage("assets/battleground/medel.png"),
                                                  fit: BoxFit.contain
                                              ),
                                            ),
                                          ),),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(height: 7,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Level Progress",style: TextStyles.GameBodywhite,),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Stack(
                                      overflow: Overflow.visible,
                                      alignment: Alignment.center,
                                      children: [
                                        Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            Container(
                                              height: 14.5,
                                              width: _width*0.13,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.black,
                                                  width: 2,
                                                ),
                                                color: Colors.black,
                                                borderRadius: BorderRadius.circular(2),
                                              ),
                                            ),
                                            Padding(
                                                padding: const EdgeInsets.all(2),
                                                child: Container(
                                                  height: 12,
                                                  width: _width*0.13*0.56,
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        ColorPalette.GrediantGreen3,
                                                        ColorPalette.GrediantGreen4,
                                                        ColorPalette.GrediantGreen5,
                                                      ],
                                                      begin: Alignment.topCenter,
                                                      end: Alignment.bottomCenter,
                                                    ),
                                                    borderRadius: BorderRadius.circular(2,
                                                    ),
                                                  ),
                                                )),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 1),
                                          child: Text("88508/250000",style: TextStyles.BodyBoldWhite,),
                                        ),
                                        Positioned(
                                          right: -16,
                                          bottom: -5,
                                          child:      Container(
                                            height: 30,
                                            width: 32,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage("assets/battleground/medel.png"),
                                                  fit: BoxFit.contain
                                              ),
                                            ),
                                          ),),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                height: _height*0.3,
                                width: _height*0.3,
                                decoration: BoxDecoration(
                                  color: Color(0xFF18171d).withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(3.5),
                                  border: Border.all(width: 2,color: Color(0xFF28272f)),
                                ),
                              ),
                              Container(
                                height: _height*0.3-18,
                                width: (_height*0.3)-15,
                                decoration: BoxDecoration(
                                    color: Color(0xFF2b2936).withOpacity(0.9),
                                    borderRadius: BorderRadius.circular(3.5),
                                    boxShadow: [BoxShadow(
                                      blurRadius: 2.5,
                                      color:  Colors.white.withOpacity(0.1),
                                      spreadRadius: 2.5,
                                    ),]
                                ),
                              ),
                              Container(
                                height: _height*0.3-18-10,
                                width: (_height*0.3)-15-10,
                                decoration: BoxDecoration(
                                 image: DecorationImage(
                                   image: AssetImage(
                                     "assets/Rings/ring1.png",
                                   ),
                                   fit: BoxFit.contain
                                 )
                                ),
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10,right: 11),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text("Player Stats",style: TextStyles.GameRegulerWhite,),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                          text: "Rank : ",
                                        style: TextStyles.GameParaYellow,
                                      ),
                                      TextSpan(
                                        text: "220",
                                        style: TextStyles.GameParaWhite,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Games Won : ",
                                        style: TextStyles.GameParaYellow,
                                      ),
                                      TextSpan(
                                        text: "252 of 356",
                                        style: TextStyles.GameParaWhite,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Win Percentage : ",
                                        style: TextStyles.GameParaYellow,
                                      ),
                                      TextSpan(
                                        text: "85.6%",
                                        style: TextStyles.GameParaWhite,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Turnament Won : ",
                                        style: TextStyles.GameParaYellow,
                                      ),
                                      TextSpan(
                                        text: "20 of 145",
                                        style: TextStyles.GameParaWhite,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Win Streak : ",
                                        style: TextStyles.GameParaYellow,
                                      ),
                                      TextSpan(
                                        text: "0",
                                        style: TextStyles.GameParaWhite,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10,left:7),
                                child: Text("Rings",style: TextStyles.GameRegulerYellow,),
                              ),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    height: 100,
                                    width: _width*0.35,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF18171d).withOpacity(0.8),
                                      borderRadius: BorderRadius.circular(3.5),
                                      border: Border.all(width: 2,color: Color(0xFF28272f)),
                                    ),
                                  ),
                                  Container(
                                    height: 84,
                                    width: (_width*0.35)-15,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF2b2936).withOpacity(0.9),
                                      borderRadius: BorderRadius.circular(3.5),
                                      boxShadow: [BoxShadow(
                                        blurRadius: 2.5,
                                        color:  Colors.white.withOpacity(0.1),
                                        spreadRadius: 2.5,
                                      ),]
                                    ),
                                  ),
                                  SizedBox(
                                    height: 90,
                                    width: _width*0.35+10,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: MediaQuery.removePadding(
                                        context: context,
                                        removeLeft: true,
                                        child: ListView.builder(
                                          itemCount: 20,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (BuildContext context, int index){
                                            return _rings(
                                              isLock: (index >2) ? true : false,
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
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10,left:7),
                                child: Text("Rings",style: TextStyles.GameRegulerYellow,),
                              ),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    height: 100,
                                    width: _width*0.35,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF18171d).withOpacity(0.8),
                                      borderRadius: BorderRadius.circular(3.5),
                                      border: Border.all(width: 2,color: Color(0xFF28272f)),
                                    ),
                                  ),
                                  Container(
                                    height: 84,
                                    width: (_width*0.35)-15,
                                    decoration: BoxDecoration(
                                        color: Color(0xFF2b2936).withOpacity(0.9),
                                        borderRadius: BorderRadius.circular(3.5),
                                        boxShadow: [BoxShadow(
                                          blurRadius: 2.5,
                                          color:  Colors.white.withOpacity(0.1),
                                          spreadRadius: 2.5,
                                        ),]
                                    ),
                                  ),
                                  SizedBox(
                                    height: 90,
                                    width: _width*0.35+10,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: MediaQuery.removePadding(
                                        context: context,
                                        removeLeft: true,
                                        child: ListView.builder(
                                          itemCount: 20,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (BuildContext context, int index){
                                            return _rings(
                                              isLock: (index >2) ? true : false,
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

                        ],
                      ),
                    ),
                  ],
                ),
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
                        onTap:(){
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            // borderRadius: borderRadious.primeryRadious,
                              borderRadius: BorderRadius.all(Radius.circular(7.5)),
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
                                "Profile",style: TextStyles.GameRegulerWhite,
                              ),
                            ),
                          )
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10,bottom: 11),
                        child: Text("LEVEL 3",style: TextStyles.GameSemiBoldyellow,),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          children: [
                            Text("Total Winning",style: TextStyles.GameRegulerYellow,),
                            SizedBox(height: 2,),
                            Text("105",style: TextStyles.GameRegulerWhite,),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          children: [
                            Text("Unique ID",style: TextStyles.GameRegulerYellow,),
                            SizedBox(height: 2,),
                            Text("258-817-455",style: TextStyles.GameRegulerWhite,),
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
  Widget _rings({bool isLock}){
    return Stack(
      alignment: Alignment.center,
      children: [
        Opacity(
          opacity:isLock ?  0.3 : 1.0,
          child: Image.asset(
            "assets/Rings/ring2.png",height: 50,fit: BoxFit.contain,
            // width:,
          ),
        ),
        isLock ? Icon(Icons.lock,color: Colors.white,size: 20,) : SizedBox(),
      ],
    );
  }
}
