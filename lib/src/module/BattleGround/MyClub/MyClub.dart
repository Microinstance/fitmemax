import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../Objects/InnerShadow.dart';
import '../../../../styles.dart';

class MyClub extends StatefulWidget {
  const MyClub({Key key}) : super(key: key);

  @override
  _MyClubState createState() => _MyClubState();
}

class _MyClubState extends State<MyClub> with TickerProviderStateMixin {

  static const TabHeading = TextStyle(fontFamily: "Adora",fontSize: 14,color: Colors.white,);

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
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 0),
              child: Container(
                //height: _height-60-55,
                child: _body(
                  //height: _height,
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
                      Padding(
                        padding: const EdgeInsets.only(top: 10,left: 30),
                        child: Row(
                          children: [
                            _tab(
                              titel: 'My Club',
                              onTap: (){
                                setState(() {
                                  (_currentPage != 'Friends') ? _currentPage = 'Friends' : print(_currentPage);
                                });
                              },
                              isSelected: (_currentPage == 'Friends') ? true : false,
                            ),
                            _tab(
                              titel: 'Search',
                              onTap: (){
                                setState(() {
                                  (_currentPage != 'Contacts') ? _currentPage = 'Contacts' : print(_currentPage);
                                });
                              },
                              isSelected: (_currentPage == 'Contacts') ? true : false,

                            ),
                          ],
                        ),
                      )
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
          height: 45,
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
            padding: const EdgeInsets.only(left: 50,right: 50),
            child: Text(titel.toUpperCase(),style: TabHeading,),
          )),
        ),
      ),
    );
  }
  Widget _friendsBody({double width,double height}){
    return Container(
      child: MediaQuery.removePadding(
        context: context,
        removeLeft: true,
        child: Row(
          children: [
            Expanded(child: Container()),
            Container()
          ],
        ),
      ),
    );
  }
  Widget _contactsBody({double width,double height}){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 50,),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(color: Color(0xFF353444), borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 50,
                              child: Image.asset("images/my_club.png"),
                            ),
                            SizedBox(width: 20,),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Partha Goria", style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.yellow,
                                      fontWeight: FontWeight.bold
                                  ),),
                                  SizedBox(height: 10,),
                                  Text("Pay for Fun", style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 15,),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Color(0xFF353444),
                            borderRadius: BorderRadius.all(Radius.circular(5))
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 50,
                              child: Image.asset("assets/Badges/badges.png"),
                            ),
                            SizedBox(width: 10,),
                            Container(
                              alignment: Alignment.topLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Weekly Club Wining", style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.yellow,
                                      fontWeight: FontWeight.bold
                                  ),),
                                  SizedBox(height: 10,),
                                  Text("1.30B", style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),)
                                ],
                              ),
                            ),
                            Spacer(),
                            Container(
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.orange,
                                  textStyle: TextStyle(fontSize: 18),
                                ),
                                onPressed: () {},
                                child: Text('League'),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      ListTile(
                        visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                        title: Text("Total Club Winnings:",
                        style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),),
                        trailing: Text("527.85B", style: TextStyle(color: Colors.white),),
                      ),
                      ListTile(
                        visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                        title: Text("Membesrs:", style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),),
                        trailing: Text("30/50", style: TextStyle(color: Colors.white),),
                      ),
                      ListTile(
                        visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                        title: Text("Type:", style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),),
                        trailing: Text("Invite Only", style: TextStyle(color: Colors.white),),),
                    ],
                  )
              ),
              Container(
                width: 450,
                height: MediaQuery.of(context).size.height - 50,
                child: ListView(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 50),
                  //shrinkWrap: true,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration : BoxDecoration(
                          color: Color(0xFF353444)
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 70,
                            decoration: BoxDecoration(
                              color: ColorPalette.BattleGroundBackground8,
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Center(child: Text("#${4}",style: TextStyles.GameSemiBoldyellow,)),
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
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Image.asset("assets/battleground/multiple_coins.png",height: 50,fit: BoxFit.contain,width: 40,),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration : BoxDecoration(
                          color: Color(0xFF353444)
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 70,
                            decoration: BoxDecoration(
                              color: ColorPalette.BattleGroundBackground8,
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Center(child: Text("#${4}",style: TextStyles.GameSemiBoldyellow,)),
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
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Image.asset("assets/battleground/multiple_coins.png",height: 50,fit: BoxFit.contain,width: 40,),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration : BoxDecoration(
                          color: Color(0xFF353444)
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 70,
                            decoration: BoxDecoration(
                              color: ColorPalette.BattleGroundBackground8,
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Center(child: Text("#${4}",style: TextStyles.GameSemiBoldyellow,)),
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
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Image.asset("assets/battleground/multiple_coins.png",height: 50,fit: BoxFit.contain,width: 40,),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration : BoxDecoration(
                          color: Color(0xFF353444)
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 70,
                            decoration: BoxDecoration(
                              color: ColorPalette.BattleGroundBackground8,
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Center(child: Text("#${4}",style: TextStyles.GameSemiBoldyellow,)),
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
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Image.asset("assets/battleground/multiple_coins.png",height: 50,fit: BoxFit.contain,width: 40,),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration : BoxDecoration(
                          color: Color(0xFF353444)
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 70,
                            decoration: BoxDecoration(
                              color: ColorPalette.BattleGroundBackground8,
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Center(child: Text("#${4}",style: TextStyles.GameSemiBoldyellow,)),
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
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Image.asset("assets/battleground/multiple_coins.png",height: 50,fit: BoxFit.contain,width: 40,),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
  Widget _body({double height, double width}){
    if (_currentPage == 'Friends') {
      return _contactsBody(
        width: width,
        //height: ,
      );
    }  if (_currentPage == 'Contacts') {
      return _friendsBody(
        width: width,
        height: height,
      );
    }
  }
}