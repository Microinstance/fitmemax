import 'package:fitmemax/Objects/InnerShadow.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BattleGroundFriends extends StatefulWidget {
  const BattleGroundFriends({Key key}) : super(key: key);

  @override
  _BattleGroundFriendsState createState() => _BattleGroundFriendsState();
}

class _BattleGroundFriendsState extends State<BattleGroundFriends> {
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
      body: Stack(
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
                      isOnline: (index > 1) ? false : true,
                      isChallange: (index > 0) ? false : true,
                      isFollow: (index > 0) ? false : true,
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
                    Container(
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
                              "Friends",style: TextStyles.GameRegulerWhite,
                            ),
                          ),
                        )
                    ),
                    SizedBox(width: 20,),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        InnerShadow(
                          blur: 5,
                          color:  Colors.black.withOpacity(0.4),
                          offset: const Offset(5, 5),
                          child: Container(
                            height: 35,
                            width: 170,
                            decoration: BoxDecoration(
                                color: ColorPalette.BattleGroundBackground3,
                                border: Border.all(
                                  width: 1.5,
                                  color: Colors.black,
                                ),
                                borderRadius: borderRadious.primeryRadious
                            ),
                          ),

                        ),
                        SizedBox(
                          height: 35,
                          width: 170,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10,top: 2,bottom: 2),
                            child: Row(
                              children: [
                                Icon(Icons.search,size: 18,color: Colors.white,),
                                SizedBox(
                                  height: 31,
                                  width: 132,
                                  child: TextField(
                                    onChanged: (x){},
                                    autofocus: false,
                                    style: TextStyles.GameRegulerWhite,
                                    cursorColor: ColorPalette.FluracentGreen,
                                    decoration: InputDecoration(
                                        isDense: false,
                                        hintText: "Search By ID...",
                                        hintStyle: TextStyles.GameRegulerWhite,
                                        border: InputBorder.none,
                                        filled: true,
                                        fillColor: Colors.transparent,
                                        contentPadding: EdgeInsets.only(top: 12,right: 10,left: 8,bottom: 11)
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
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
                    Text("Get 500 coins each friend who joins Battle Ground",style: TextStyles.GameSemiBoldyellow,),
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
    );
  }
  Widget _friendsCard({double height, double width, bool isOnline = true,bool isChallange = false,bool isFollow = false}){
    return Padding(
      padding: const EdgeInsets.only(left: 20,top: 10,bottom: 10),
      child: InnerShadow(
        blur: 5,
        color:  isOnline?  ColorPalette.BattleGroundFriendsGreen2.withOpacity(0.5) :Colors.black.withOpacity(0.4),
        offset: const Offset(5, 5),
        child: Container(
          height: height,
          width: 150,
          decoration: BoxDecoration(
            color: isOnline? ColorPalette.BattleGroundFriendsGreen1 : ColorPalette.BattleGroundBackground3,
            border: Border.all(
              width: 1.5,
              color: isOnline? ColorPalette.BattleGroundFriendsGreen2 : Colors.black,
            ),
            borderRadius: borderRadious.primeryRadious
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                isOnline ?   Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            ColorPalette.GrediantGreen2,
                            ColorPalette.GrediantGreen1,
                          ]
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 7,),
                    Text("Online",style: TextStyles.GameParaWhite,),
                  ],
                ) :  Text("Last seen 1 hour ago",style: TextStyles.GameBodyYellow,),
                Padding(
                  padding: const EdgeInsets.only(top: 10,bottom: 10),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 65,
                        width: 65,
                        child: Padding(
                          padding: EdgeInsets.all(height*0.01),
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
                        height: 65,
                        width: 65,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/battleground/frame1.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text("Anurag",style: TextStyles.GameRegulerWhite,),
                Padding(
                  padding: const EdgeInsets.only(top: 2,bottom: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Winnings: ",style: TextStyles.GameBodyYellow,),
                      Text("12k",style: TextStyles.GameBodywhite,),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2,bottom: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Matches: ",style: TextStyles.GameBodyYellow,),
                      Text("2-3",style: TextStyles.GameBodywhite,),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Container(
                      height: 25,
                      width: 80,
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
                        padding: const EdgeInsets.only(left: 5,right: 5),
                        child:isFollow ? Text("Follow",style: TextStyles.GameParaWhite,) :
                        Text("Unfollow",style: TextStyles.GameParaWhite,)  ,
                      ))
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child:isChallange ? Container(
                      height: 25,
                      width: 80,
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
                        child: Text("Challenge",style: TextStyles.GameParaWhite,),
                      ))
                  ) :
                  Container(
                      height: 25,
                      width: 80,
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
                        padding: const EdgeInsets.only(left: 5,right: 5),
                        child: Text("Sent",style: TextStyles.GameParaWhite,),
                      ))
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
