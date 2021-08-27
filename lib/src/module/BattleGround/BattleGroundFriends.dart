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
  String _currentPage = 'Friends';
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset : false,
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
            Padding(
              padding: const EdgeInsets.only(top: 60,bottom: 55),
              child: Container(
                height: _height-60-55,
                child: _body(
                  height: _height,
                  width: _width,
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
                  padding: const EdgeInsets.only(left: 30,right: 10),
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
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: 20,left: 30),
                        child: Row(
                          children: [
                            _tab(
                                titel: 'Friends',
                              onTap: (){
                                  setState(() {
                                    (_currentPage != 'Friends') ? _currentPage = 'Friends' : print(_currentPage);
                                  });
                              },
                              isSelected: (_currentPage == 'Friends') ? true : false,
                            ),
                            _tab(
                                titel: 'Contacts',
                                onTap: (){
                                  setState(() {
                                    (_currentPage != 'Contacts') ? _currentPage = 'Contacts' : print(_currentPage);
                                  });
                                },
                              isSelected: (_currentPage == 'Contacts') ? true : false,

                            ),
                            _tab(titel: 'Queue',
                                onTap: (){
                                  setState(() {
                                    (_currentPage != 'Queue') ? _currentPage = 'Queue' : print(_currentPage);
                                  });
                                },
                              isSelected: (_currentPage == 'Queue') ? true : false,
                            ),
                          ],
                        ),
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
      ),
    );
  }
  Widget _tab({String titel, Function onTap, bool isSelected}){
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            color: ColorPalette.BattleGroundBackground5,
            border: isSelected ? Border(
              top: BorderSide(width: 1.0, color: ColorPalette.GrediantGreen2),
              left: BorderSide(width: 1.0, color: ColorPalette.GrediantGreen2),
              right: BorderSide(width: 1.0, color: ColorPalette.GrediantGreen2),
            ) : Border(
              top: BorderSide(width: 1.0, color: Colors.white),
              left: BorderSide(width: 1.0, color: Colors.white),
              right: BorderSide(width: 1.0, color: Colors.white),
            ),
          ),
          child: Center(child: Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: Text(titel,style: TextStyles.GameRegulerWhite,),
          )),
        ),
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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
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
                        child: Text("Follow",style: TextStyles.GameParaWhite,),
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
  Widget _contactsCard({double height, double width, bool isOnline = true,bool isChallange = false,bool isFollow = false}){
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
            padding: const EdgeInsets.all(7.0),
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
                  padding: const EdgeInsets.only(top: 10,bottom: 8),
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
                Spacer(),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.black.withOpacity(0.3),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 2,bottom: 2,left: 5,right: 5),
                      child: Text("You are Winning\n41 - 47",style: TextStyles.GameParaYellow,textAlign: TextAlign.center,),
                    )),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(top:3),
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
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Container(
                      height: 23,
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
                        child:
                        Text("Unfollow",style: TextStyles.GameParaWhite,)  ,
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
  Widget _friendsBody({double width,double height}){
    return Container(
      child: MediaQuery.removePadding(
        context: context,
        removeLeft: true,
        child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index){
            return _friendsCard(
              height: height,
              width: width,
              isOnline: (index > 1) ? false : true,
              isChallange: (index > 0) ? false : true,
              isFollow: (index > 0) ? false : true,
            );
          },
        ),
      ),
    );
  }
  Widget _contactsBody({double width,double height}){
    return Container(
      child: MediaQuery.removePadding(
        context: context,
        removeLeft: true,
        child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index){
            return _contactsCard(
              height: height,
              width: width,
              isOnline: (index > 1) ? false : true,
              isChallange: (index > 0) ? false : true,
              isFollow: (index > 0) ? false : true,
            );
          },
        ),
      ),
    );
  }
  Widget _queueBody({double width,double height}){
    return Container(
      child: MediaQuery.removePadding(
        context: context,
        removeLeft: true,
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index){
              return Padding(
                padding:  EdgeInsets.only(top: (index==0) ? 10 : 0),
                child: _queueRow(
                  width: width,
                  height: height,
                  isChallange: (index < 5) ? true : false,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
  Widget _queueRow({double height,  double width, bool isChallange}){
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
      child: Container(
        height: 70,
        width: width-30,
        decoration: BoxDecoration(
          color: ColorPalette.BattleGroundBackground7,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/userImage5.jpeg"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(2),
                  border: Border.all(
                    width: 1,
                    color: Colors.white.withOpacity(0.5),
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Shantonu Challange you!",style: TextStyles.GameRegulerBigWhite,),
                    Opacity(
                        opacity: 0.4,
                        child: Text("01:05:21 08:05 pm",style: TextStyles.GameBodywhite,)),
                  ],
                ),
              ),
              Spacer(),
              Container(
                  height: 50,
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
                    child:isChallange ?  Text("  Challenge  ",style: TextStyles.GameRegulerBigWhite,) : Text("  Add as Friend  ",style: TextStyles.GameRegulerBigWhite,),
                  ))
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _body({double height, double width}){
    if (_currentPage == 'Friends') {
      return _contactsBody(
        width: width,
        height: height,
      );
    }  if (_currentPage == 'Contacts') {
      return _friendsBody(
        width: width,
        height: height,
      );
    }  if (_currentPage == 'Queue') {
      return _queueBody(
        width: width,
        height: height,
      );
    }
  }
}
