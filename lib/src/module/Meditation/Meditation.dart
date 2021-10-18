import 'package:fitmemax/src/module/Meditation/MeditationCategoryDetailPage.dart';
import 'package:fitmemax/src/module/Meditation/MeditationCategoryMainPage.dart';
import 'package:fitmemax/src/module/Meditation/MeditationSearch.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'MeditationInsightsForYou.dart';


class Meditation extends StatefulWidget {

  @override
  _MeditationState createState() => _MeditationState();
}

class _MeditationState extends State<Meditation> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
     body: SingleChildScrollView(
       child: Stack(
         alignment: Alignment.topCenter,
         children: [
           Image.asset("assets/meditation/background.png",fit: BoxFit.fitWidth,color: Color(0xFFfdadad),),
           Column(
             children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   SafeArea(
                     child: IconButton(onPressed: (){
                       Navigator.pop(context);
                     }, icon: Icon(Icons.arrow_back,color: Colors.white,size: 20,)
                     ),
                   ),
                   SafeArea(child: Padding(
                     padding: const EdgeInsets.only(top: 25),
                     child: Text("Meditation",style: TextStyles.HeadingWhite,),
                   )),
                   SafeArea(
                     child: IconButton(onPressed: (){
                       Navigator.push(
                           context,
                           PageTransition(
                               type:
                               PageTransitionType
                                   .fade,
                               child:
                               MeditationSearch()));
                     }, icon: Icon(Icons.search,color: Colors.white,size: 20,)
                     ),
                   ),
                 ],
               ),
               Padding(
                 padding: const EdgeInsets.only(left: 30,right: 30,top: 20),
                 child: Container(
                   height: 300,
                   width: _width-60,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                     color: CupertinoColors.white,
                     boxShadow: [
                       BoxShadow(
                         color: Colors.black.withOpacity(0.08),
                         blurRadius: 5,
                         spreadRadius: 5,
                       ),
                     ]
                   ),
                   child: Column(
                     children: [
                       Padding(
                         padding: const EdgeInsets.all(10),
                         child: Stack(
                           alignment: Alignment.topLeft,
                           children: [
                             Container(
                               height: 180,
                               width: _width-80,
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(10),
                                   color: CupertinoColors.white,
                                 image: DecorationImage(
                                   image: AssetImage("assets/meditation/meditation01.png"),
                                   fit: BoxFit.cover,
                                 )
                               ),
                             ),
                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Container(
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(13),
                                   color: Colors.black.withOpacity(0.5),
                                 ),
                                 child: Padding(
                                   padding: const EdgeInsets.only(left: 10,right: 10,top: 4,bottom: 5),
                                   child: Text("Featured",style: TextStyles.ParaWhite,),
                                 ),
                               ),
                             )
                           ],
                         ),
                       ),
                       Text("Mindfulness at workplace part 1",style: TextStyles.RegulerBlack,textAlign: TextAlign.center,),
                       Padding(
                         padding: const EdgeInsets.only(top: 5),
                         child: Opacity(
                           opacity: 0.8,
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                               Icon(Icons.workspaces_outline,size: 15,color: Colors.black,),
                               SizedBox(
                                 width: 5,
                               ),
                               Text("Video",style: TextStyles.BodyBlack,textAlign: TextAlign.center,),
                               SizedBox(
                                 width: 5,
                               ),
                               CircleAvatar(
                                 radius: 3,
                                 backgroundColor: Colors.black,
                               ),
                               SizedBox(
                                 width: 5,
                               ),
                               Text("7 Mins",style: TextStyles.BodyBlack,textAlign: TextAlign.center,),
                             ],
                           ),
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(top: 5),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             CircleAvatar(
                               radius: 15,
                               backgroundImage: AssetImage("images/userImage5.jpeg"),
                             ),
                             SizedBox(
                               width: 7,
                             ),
                             Text("Marrsia | June 6 | Mindfulness",style: TextStyles.BodyBlack,textAlign: TextAlign.center,),
                           ],
                         ),
                       ),
                     ],
                   ),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(left: 20,top: 25,right: 20,bottom: 20),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Text("Insights for you",style: TextStyles.TitleBlack,),
                     GestureDetector(
                       onTap: (){
                         Navigator.push(
                             context,
                             PageTransition(
                                 type:
                                 PageTransitionType
                                     .fade,
                                 child:
                                 MeditationInsightsForYou()));
                       },
                       child: CircleAvatar(
                         child: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 12,),
                         backgroundColor: Colors.grey[300],
                         radius: 15,
                       ),
                     ),
                   ],
                 ),
               ),
               Container(
                 child: MediaQuery.removePadding(
                   context: context,
                   removeTop: true,
                   child: ListView.builder(
                     shrinkWrap: true,
                     physics: NeverScrollableScrollPhysics(),
                     itemCount: 3,
                     itemBuilder: (BuildContext context, int Index){
                       return Padding(
                         padding: const EdgeInsets.only(left: 20,right: 20,bottom: 15),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Container(
                               height: _width*0.3,
                               width: _width*0.3,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(7.5),
                                 image: DecorationImage(
                                   image: AssetImage("assets/meditation/meditation03.png"),
                                   fit: BoxFit.cover,
                                 ),
                               ),
                             ),
                             SizedBox(
                               width: 10,
                             ),
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 SizedBox(
                                     width: (_width-(_width*0.3)-50),
                                     child: Row(
                                   children: [
                                     Flexible(child: Text("How we accept our failures?",style: TextStyles.RegulerBlack,)),
                                   ],
                                 )),
                                 SizedBox(
                                   height: 5,
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(top: 5),
                                   child: Opacity(
                                     opacity: 0.8,
                                     child: Row(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment: CrossAxisAlignment.center,
                                       children: [
                                         Icon(Icons.workspaces_outline,size: 15,color: Colors.black,),
                                         SizedBox(
                                           width: 5,
                                         ),
                                         Text("Video",style: TextStyles.BodyBlack,textAlign: TextAlign.center,),
                                         SizedBox(
                                           width: 5,
                                         ),
                                         CircleAvatar(
                                           radius: 3,
                                           backgroundColor: Colors.black,
                                         ),
                                         SizedBox(
                                           width: 5,
                                         ),
                                         Text("7 Mins",style: TextStyles.BodyBlack,textAlign: TextAlign.center,),
                                       ],
                                     ),
                                   ),
                                 ),
                                 SizedBox(
                                   height: 5,
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(top: 5),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     crossAxisAlignment: CrossAxisAlignment.center,
                                     children: [
                                       CircleAvatar(
                                         radius: 15,
                                         backgroundImage: AssetImage("images/userImage5.jpeg"),
                                       ),
                                       SizedBox(
                                         width: 7,
                                       ),
                                       Text("Marrsia",style: TextStyles.BodyBlack,textAlign: TextAlign.center,),
                                     ],
                                   ),
                                 ),
                               ],
                             )
                           ],
                         ),
                       );
                     },
                   ),
                 ),
               ),
               Container(
                 child: MediaQuery.removePadding(
                   context: context,
                   removeTop: true,
                   child: ListView.builder(
                     shrinkWrap: true,
                     physics: NeverScrollableScrollPhysics(),
                     itemCount: 3,
                     itemBuilder: (BuildContext context, int index ){
                       return Column(
                         children: [
                           Padding(
                             padding: const EdgeInsets.only(left: 20,top: 25,right: 20,bottom: 20),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               crossAxisAlignment: CrossAxisAlignment.center,
                               children: [
                                 Text("Motivation",style: TextStyles.TitleBlack,),
                                 GestureDetector(
                                   onTap: (){
                                     Navigator.push(
                                         context,
                                         PageTransition(
                                             type:
                                             PageTransitionType
                                                 .fade,
                                             child:
                                             MeditationCategoryDetailPage()));
                                   },
                                   child: CircleAvatar(
                                     child: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 12,),
                                     backgroundColor: Colors.grey[300],
                                     radius: 15,
                                   ),
                                 ),
                               ],
                             ),
                           ),
                           Container(
                             height: 200,
                             child: MediaQuery.removePadding(
                               context: context,
                               removeTop: true,
                               child: ListView.builder(
                                 shrinkWrap: true,
                                 itemCount: 5,
                                 scrollDirection: Axis.horizontal,
                                 itemBuilder: (BuildContext context, int index){
                                   return Padding(
                                     padding: EdgeInsets.only(right: 15,left: (index==0)? 15: 0),
                                     child: GestureDetector(
                                       onTap: (){
                                         Navigator.push(
                                             context,
                                             PageTransition(
                                                 type:
                                                 PageTransitionType
                                                     .fade,
                                                 child:
                                                 MeditationCategoryMainPage()));
                                       },
                                       child: Stack(
                                         children: [
                                           Container(
                                             height: 200,
                                             width: 140,
                                             decoration: BoxDecoration(
                                               borderRadius: BorderRadius.circular(7.5),
                                               image: DecorationImage(
                                                 image: AssetImage("assets/meditation/meditation04.jpg"),
                                                 fit: BoxFit.cover
                                               ),
                                             ),
                                           ),
                                           Align(
                                             alignment: Alignment.bottomCenter,
                                             child: Container(
                                               height: 50,
                                               width: 140,
                                               decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.only(bottomLeft: Radius.circular(7.5),bottomRight: Radius.circular(7.5),),
                                                 color: Colors.black.withOpacity(0.2),
                                               ),
                                               child: Padding(
                                                 padding: const EdgeInsets.all(4.0),
                                                 child: Column(
                                                   crossAxisAlignment: CrossAxisAlignment.start,
                                                   children: [
                                                     Text("Train your mind",style: TextStyles.ParaWhite,),
                                                     SizedBox(height: 3,),
                                                     Text("5 Minutes",style: TextStyles.BodyWhite,),
                                                   ],
                                                 ),
                                               ),
                                             ),
                                           ),
                                         ],
                                       ),
                                     ),
                                   );
                                 },
                               ),
                             ),
                           ),
                         ],
                       );
                     },
                   ),
                 ),
               ),
               SizedBox(
                 height: 20,
               ),
             ],
           ),
         ],
       ),
     ),
    );
  }
}
