import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_container.dart';
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
            child: Column(
              children: [
                Container(
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
                   SizedBox(width: 20,),
                   Container(
                     height: 40,
                     decoration: BoxDecoration(
                       // borderRadius: borderRadious.primeryRadious,
                       borderRadius: BorderRadius.all(Radius.circular(7.5)),
                    color: ColorPalette.BattleGroundBackground2,
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
                     child: Center(
                       child: Padding(
                         padding: const EdgeInsets.only(left: 15,right: 15),
                         child: Row(
                           children: [
                             Icon(Icons.face,size:20,color: Colors.white.withOpacity(0.7),),
                             SizedBox(
                               width: 10,
                             ),
                             Text(
                               "Profile",style: TextStyles.GameRegulerWhite,
                             ),
                           ],
                         ),
                       ),
                     )
                   ),
                   Spacer(),
                   Text("Level 3",style: TextStyles.GameRegulerYellow,),
                 ],
               ),
             ),
           ),
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15,top: 17,bottom: 17),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: _height*0.2,
                            width: _height*0.2,
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
                            height: _height*0.2,
                            width: _height*0.2,
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
                                 height: 22,
                                 width: 30,
                                 decoration: BoxDecoration(
                                   image: DecorationImage(
                                     image: AssetImage("assets/battleground/india.png"),
                                     fit: BoxFit.cover
                                   ),
                                   borderRadius: BorderRadius.circular(2),
                                   border: Border.all(width: 1,color: Colors.white.withOpacity(0.4)),
                                 ),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(left: 10),
                                 child: Text("Anurag Dutta",style: TextStyles.GameRegulerWhite,),
                               )
                             ],
                           ),
                           Padding(
                             padding: const EdgeInsets.only(top: 7),
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
                                       Text("FriendsDgp",style: TextStyles.GameSemiBoldBlack,),
                                       SizedBox(height: 3,),
                                       Text("Co-Leader",style: TextStyles.GameRegulerWhite,),
                                     ],
                                   ),
                                 )
                               ],
                             ),
                           ),
                           Column(
                             children: [
                               Padding(
                                 padding: const EdgeInsets.only(top: 10),
                                 child: Row(
                                   children: [
                                     Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       children: [
                                         Row(
                                           children: [
                                             Stack(
                                               alignment: Alignment.centerRight,
                                               overflow: Overflow.visible,
                                               children: [
                                                 Text("880 536",style: TextStyles.GameRegulerYellow,),
                                                 Positioned(
                                                   right: -45,
                                                   top: -15,
                                                   child: Container(
                                                     height: 40,
                                                     width: 40,
                                                     decoration: BoxDecoration(
                                                       image: DecorationImage(
                                                           image: AssetImage("assets/battleground/coins2.png"),
                                                           fit: BoxFit.contain
                                                       ),
                                                     ),
                                                   ),
                                                 ),
                                               ],
                                             ),
                                             SizedBox(
                                               width: 105,
                                             ),
                                             Column(
                                               crossAxisAlignment: CrossAxisAlignment.start,
                                               children: [
                                                 Text("Level Progress",style: TextStyles.GameParaWhite,),
                                                 SizedBox(
                                                   height: 10,
                                                 ),
                                                 Stack(
                                                   overflow: Overflow.visible,
                                                   alignment: Alignment.center,
                                                   children: [
                                                     Stack(
                                                       alignment: Alignment.centerLeft,
                                                       children: [
                                                         Container(
                                                           height: 14,
                                                           width: _width*0.18,
                                                           decoration: BoxDecoration(
                                                             border: Border.all(
                                                               color: Colors.black,
                                                               width: 2,
                                                             ),
                                                             color: Colors.black,
                                                             borderRadius: BorderRadius.circular(4),
                                                           ),
                                                         ),
                                                         Padding(
                                                           padding: const EdgeInsets.all(2),
                                                           child: Container(
                                                             height: 10,
                                                             width: _width*0.18*0.56,
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
                                                               borderRadius: BorderRadius.circular(4),
                                                             ),
                                                           ),
                                                         ),
                                                       ],
                                                     ),
                                                     Padding(
                                                       padding: const EdgeInsets.only(bottom: 1),
                                                       child: Text("88508/250000",style: TextStyles.BodyBoldWhite,),
                                                     ),
                                                     Positioned(
                                                       right: -20,
                                                       bottom: -11,
                                                       child:      Container(
                                                         height: 40,
                                                         width: 40,
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
                                         SizedBox(
                                           height: 10,
                                         ),
                                         Row(
                                           children: [
                                             Column(
                                               crossAxisAlignment: CrossAxisAlignment.start,
                                               mainAxisAlignment: MainAxisAlignment.start,
                                               children: [
                                                 Text("Level Progress",style: TextStyles.GameParaWhite,),
                                                 SizedBox(
                                                   height: 10,
                                                 ),
                                                 Stack(
                                                   overflow: Overflow.visible,
                                                   alignment: Alignment.center,
                                                   children: [
                                                     Stack(
                                                       alignment: Alignment.centerLeft,
                                                       children: [
                                                         Container(
                                                           height: 14,
                                                           width: _width*0.18,
                                                           decoration: BoxDecoration(
                                                             border: Border.all(
                                                               color: Colors.black,
                                                               width: 2,
                                                             ),
                                                             color: Colors.black,
                                                             borderRadius: BorderRadius.circular(4),
                                                           ),
                                                         ),
                                                         Padding(
                                                           padding: const EdgeInsets.all(2),
                                                           child: Container(
                                                             height: 10,
                                                             width: _width*0.18*0.56,
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
                                                               borderRadius: BorderRadius.circular(4),
                                                             ),
                                                           ),
                                                         ),
                                                       ],
                                                     ),
                                                     Padding(
                                                       padding: const EdgeInsets.only(bottom: 1),
                                                       child: Text("88508/250000",style: TextStyles.BodyBoldWhite,),
                                                     ),
                                                     Positioned(
                                                       right: -20,
                                                       bottom: -11,
                                                       child:      Container(
                                                         height: 40,
                                                         width: 40,
                                                         decoration: BoxDecoration(
                                                           image: DecorationImage(
                                                               image: AssetImage("assets/battleground/medel.png"),
                                                               fit: BoxFit.contain
                                                           ),
                                                         ),
                                                       ),),
                                                   ],
                                                 ),
                                               ],
                                             ),
                                             SizedBox(
                                               width: 30,
                                             ),
                                             Column(

                                               crossAxisAlignment: CrossAxisAlignment.start,
                                               mainAxisAlignment: MainAxisAlignment.start,
                                               children: [
                                                 Text("Level Progress",style: TextStyles.GameParaWhite,),
                                                 SizedBox(
                                                   height: 10,
                                                 ),
                                                 Stack(
                                                   overflow: Overflow.visible,
                                                   alignment: Alignment.center,
                                                   children: [
                                                     Stack(
                                                       alignment: Alignment.centerLeft,
                                                       children: [
                                                         Container(
                                                           height: 14,
                                                           width: _width*0.18,
                                                           decoration: BoxDecoration(
                                                             border: Border.all(
                                                               color: Colors.black,
                                                               width: 2,
                                                             ),
                                                             color: Colors.black,
                                                             borderRadius: BorderRadius.circular(4),
                                                           ),
                                                         ),
                                                         Padding(
                                                           padding: const EdgeInsets.all(2),
                                                           child: Container(
                                                             height: 10,
                                                             width: _width*0.18*0.56,
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
                                                               borderRadius: BorderRadius.circular(4),
                                                             ),
                                                           ),
                                                         ),
                                                       ],
                                                     ),
                                                     Padding(
                                                       padding: const EdgeInsets.only(bottom: 1),
                                                       child: Text("88508/250000",style: TextStyles.BodyBoldWhite,),
                                                     ),
                                                     Positioned(
                                                       right: -20,
                                                       bottom: -11,
                                                       child:      Container(
                                                         height: 40,
                                                         width: 40,
                                                         decoration: BoxDecoration(
                                                           image: DecorationImage(
                                                               image: AssetImage("assets/battleground/medel.png"),
                                                               fit: BoxFit.contain
                                                           ),
                                                         ),
                                                       ),),
                                                   ],
                                                 ),
                                               ],
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
                         ],
                       ),
                     )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
