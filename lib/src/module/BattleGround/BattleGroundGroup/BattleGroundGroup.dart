import 'package:delayed_display/delayed_display.dart';
import 'package:fitmemax/src/module/BattleGround/BattleGround.dart';
import 'package:fitmemax/src/module/BattleGround/SquadManagement/squad_management.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:page_transition/page_transition.dart';

import '../ChampionResult/ChampionResult.dart';

class BattleGroundGroup extends StatefulWidget {
  @override
  _BattleGroundGroupState createState() => _BattleGroundGroupState();
}

class _BattleGroundGroupState extends State<BattleGroundGroup> {
  PageController _controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    final Duration initialDelay = Duration(milliseconds: 1000);
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    double _boxWidth = _width*1;
    Widget listItems(){
      return Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[800],
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                )
              ]
            ),
            child: Column(
              children: [
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10,bottom: 15,top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Opacity(
                          opacity: 0.8,
                          child: Text("Sponsored By",style: TextStyles.GameShadowWhite1,textAlign: TextAlign.center,)),
                      Text("GNA",style: TextStyles.GameSemiBoldWhite,textAlign: TextAlign.center,),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Container(
              width: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.yellow[600],
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 2,
                    spreadRadius: 2,
                  )
                ]
              ),
              child:Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Spacer(),
                    Text("BANGALORE BLAZERS",style: TextStyles.GameBoldblack,textAlign: TextAlign.center,),
                    Spacer(),
                    MaterialButton(
                      onPressed: (){},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text("Join Team",style: TextStyles.GameRegulerBigWhite,),
                      ),
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    }
    Widget y(index){
      if(index == 0) {
        return Container(
          height: 150,
          width: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white
          ),
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: SquadManagement()));
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      height: 80,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                        image: DecorationImage(
                          image: AssetImage("assets/battleground/football_ground.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Spacer(),
                    Text("Squad Management",style: TextStyles.GameSemiBoldyellow,),
                    Text("Make adjustment to your squad",style: TextStyles.GameParaBlack,),
                    SizedBox(
                      height: 7,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.yellow,
                    child: Center(child: Icon(Icons.manage_accounts,color: Colors.black,size: 20,)),
                  ),
                )
              ],
            ),
          ),
        );
      }
      if(index == 1) {
        return  Container(
          height: 150,
          width: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  Container(
                    height: 80,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                      image: DecorationImage(
                        image: AssetImage("assets/battleground/football_ground.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Spacer(),
                  Text("My Team",style: TextStyles.GameSemiBoldyellow,),
                  Text("Browser and train your members",style: TextStyles.GameParaBlack,),
                  SizedBox(
                    height: 7,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.yellow,
                  child: Center(child: Icon(Icons.ac_unit,color: Colors.black,size: 20,)),
                ),
              )
            ],
          ),
        );
      }
    }
    Widget z(index){
      if(index == 0) {
        return Container(
          height: 100,
          width: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Row(
                children: [
                  Stack(
                    alignment: Alignment.centerRight,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular(15)),
                          image: DecorationImage(
                            image: AssetImage("assets/battleground/football_ground.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        right: -20,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.yellow,
                          child: Center(child: Icon(Icons.ac_unit,color: Colors.black,size: 20,)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 140,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20,right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Achievements",style: TextStyles.GameRegulerBlack,),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      }
      if(index == 1) {
        return Container(
          height: 100,
          width: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white
          ),
          child: Row(
            children: [
              Stack(
                alignment: Alignment.centerRight,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular(15)),
                      image: DecorationImage(
                        image: AssetImage("assets/battleground/football_ground.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    right: -20,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.yellow,
                      child: Center(child: Icon(Icons.ac_unit,color: Colors.black,size: 20,)),
                    ),
                  )
                ],
              ),
              SizedBox(
                width: 140,
                child: Padding(
                  padding: const EdgeInsets.only(left: 27,right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Practice",style: TextStyles.GameRegulerBlack,),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }
    }
    Widget x(index){
      if(index == 0) {
        return GestureDetector(
            onTap: (){
              _controller.jumpToPage(0); // for regular jump
            },
            child: Text("Match",style: TextStyles.GameRegulerBigWhite,));
      }
      if(index == 2) {
        return GestureDetector(
            onTap: (){
              _controller.jumpToPage(1); // for regular jump
            },
            child: Text("Club House",style: TextStyles.GameRegulerBigWhite,));
      }
      if(index == 4) {
        return GestureDetector(
            onTap: (){
              _controller.jumpToPage(2); // for regular jump
            },
            child: Text("Contract",style: TextStyles.GameRegulerBigWhite,));
      }
      if(index == 6) {
        return GestureDetector(
            onTap: (){
              //_controller.jumpToPage(3); // for regular jump
              Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: ChampionResult()));
            },
            child: Text("IFL",style: TextStyles.GameRegulerBigWhite,));
      }
      else return Padding(
        padding:  EdgeInsets.only(left: _width*0.07,right: _width*0.07),
        child: Container(
          height: 20,
          width: 5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
        ),
      );
    }
    Widget _list(){
      return Container(
        height: 270,
        width: _boxWidth,
        child: ListView.builder(
          itemCount: 6,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index){
            return Padding(
              padding: EdgeInsets.only(left: 7.5,right: 7.5),
              child: listItems(),
              // child: Stack(
              //   children: [
              //     Container(
              //       width: 180,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(15),
              //         color: Colors.yellow,
              //       ),
              //       child: Padding(
              //         padding: const EdgeInsets.all(10),
              //         child: Column(
              //           children: [
              //             Spacer(),
              //             Text("BANGALORE BLAZERS",style: TextStyles.GameBoldblack,textAlign: TextAlign.center,),
              //             Spacer(),
              //             MaterialButton(
              //               onPressed: (){},
              //               shape: RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(10),
              //               ),
              //               child: Padding(
              //                 padding: const EdgeInsets.all(5.0),
              //                 child: Text("Join Team",style: TextStyles.GameRegulerBigWhite,),
              //               ),
              //               color: Colors.black,
              //             ),
              //             Spacer(),
              //             SizedBox(height: 30,),
              //           ],
              //         ),
              //       ),
              //     ),
              //     Align(
              //       alignment: Alignment.bottomCenter,
              //       child: Container(
              //         width: 180,
              //         height: 50,
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)),
              //           color: Colors.black,
              //         ),
              //         child: Padding(
              //           padding: const EdgeInsets.only(left: 10,right: 10,bottom: 15,top: 10),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Opacity(
              //                   opacity: 0.8,
              //                   child: Text("Sponsored By",style: TextStyles.GameShadowWhite1,textAlign: TextAlign.center,)),
              //               Text("GNA",style: TextStyles.GameSemiBoldWhite,textAlign: TextAlign.center,),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            );
          },
        ),
      );
    }
    return Scaffold(
      backgroundColor: ColorPalette.BattleGroundBackground,
      body:Stack(
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DelayedDisplay(
                    delay: initialDelay,
                    slidingBeginOffset: Offset(0, -0.35,),
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15,top: 15,bottom: 5),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: GestureDetector(
                              onTap:(){
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.fade,
                                        child: BattleGround()));
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
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.yellow,
                                child: Center(child: Text("G",style: TextStyles.GameRegulerBlack,)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text("15054555",style: TextStyles.GameRegulerWhite,),
                              ),

                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.yellow,
                                  child: Center(child: Icon(Icons.star,size: 15,color: Colors.black,)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text("50",style: TextStyles.GameRegulerWhite,),
                                ),

                              ],
                            ),
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Icon(Icons.person,size: 25,color: Colors.yellow,),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Icon(Icons.card_giftcard,size: 25,color: Colors.yellow,),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Icon(Icons.email,size: 25,color: Colors.yellow,),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Icon(Icons.shopping_cart,size: 25,color: Colors.yellow,),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15,bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 20,
                          width: _width*0.8,
                          child: AnimationLimiter(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 7,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return AnimationConfiguration.staggeredList(
                                    position: index,
                                    duration: const Duration(milliseconds: 1000),
                                    child: ScaleAnimation(
                                        scale: 0.8,
                                        child: FadeInAnimation(child: x(index))));
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 270,
                    width: _boxWidth,
                    child: PageView.builder(
                      controller: _controller,
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index){
                        if(index == 0) {
                          return _list();
                        }else return SizedBox(
                          width: _width*0.7,
                          child: Column(
                            children: [
                              Container(
                                height: 190,
                                width: _width*0.7,
                                child: AnimationLimiter(
                                  child: GridView.count(
                                    crossAxisCount: 2,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    childAspectRatio: 0.9/0.5,
                                    mainAxisSpacing: 0.0,
                                    crossAxisSpacing: 20.0,
                                    children: List.generate(2, (index) =>
                                        AnimationConfiguration.staggeredGrid(
                                          columnCount: 2,
                                          position: index,
                                          duration: const Duration(milliseconds: 1500),
                                          child: ScaleAnimation(
                                            scale: 0.5,
                                            child: FadeInAnimation(
                                                child: y(index)
                                            ),
                                          ),
                                        ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 80,
                                width: _width*0.7,
                                child: AnimationLimiter(
                                  child: GridView.count(
                                    crossAxisCount: 2,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    childAspectRatio: 0.9/0.25,
                                    mainAxisSpacing: 0.0,
                                    crossAxisSpacing: 20.0,
                                    children: List.generate(2, (index) =>
                                        AnimationConfiguration.staggeredGrid(
                                          columnCount: 2,
                                          position: index,
                                          duration: const Duration(milliseconds: 1500),
                                          child: ScaleAnimation(
                                            scale: 0.5,
                                            child: FadeInAnimation(
                                                child: z(index)
                                            ),
                                          ),
                                        ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}