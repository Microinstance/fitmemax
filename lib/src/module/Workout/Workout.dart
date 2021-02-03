import 'package:fitmemax/src/module/Workout/WorkoutExplore.dart';
import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class Workout extends StatefulWidget {
  @override
  _WorkoutState createState() => _WorkoutState();
}

class _WorkoutState extends State<Workout> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarIconBrightness: Brightness.dark
    ));
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,size: 20,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text("Workouts",style: TextStyle(color: Colors.black,fontSize: 20),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Stack(
            //   overflow: Overflow.visible,
            //   children: [
            //     Container(
            //       child: Padding(
            //         padding: const EdgeInsets.only(left: 15,top: 0,right: 15),
            //         child: Stack(
            //           children: [
            //             Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 CircleAvatar(
            //                   radius: 30,
            //                   backgroundColor: Palette.x1Color,
            //                   child: CircleAvatar(
            //                     radius: 28,
            //                     backgroundImage: AssetImage("images/userImage7.jpeg"),
            //                   ),
            //                 ),
            //
            //                 Padding(
            //                   padding: const EdgeInsets.only(top: 5),
            //                   child: Text("Elena Gilbart",style: GoogleFonts.lato(
            //                     fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500
            //                   ),),
            //                 ),
            //                 Padding(
            //                   padding: const EdgeInsets.only(top: 5),
            //                   child: Text("You Have 180 Coins in your wallet",style: GoogleFonts.lato(
            //                     fontSize: 12,color: Colors.black.withOpacity(0.5),
            //                   ),),
            //                 ),
            //               ],
            //             ),
            //             Align(
            //               alignment: Alignment.topRight,
            //               child: Padding(
            //                 padding: const EdgeInsets.only(top: 5),
            //                 child: Container(
            //                   decoration: BoxDecoration(
            //                     color: Colors.grey[100],
            //                     borderRadius: BorderRadius.circular(10),
            //                   ),
            //                   child: SizedBox(
            //                     width: 225,
            //                     child: Padding(
            //                       padding: const EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
            //                       child: Row(
            //                         crossAxisAlignment: CrossAxisAlignment.center,
            //                         mainAxisAlignment: MainAxisAlignment.center,
            //                         children: [
            //                           Text("Upgrade to Premium",style: GoogleFonts.lato(
            //                               fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500
            //                           ),),
            //                           SizedBox(
            //                             width: 10,
            //                           ),
            //                           Icon(Icons.whatshot_rounded,size: 20,color: Colors.yellow[700],),
            //                         ],
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            // ),
            //     Positioned(
            //         bottom: -15,right: 1,
            //         child: Image.asset("assets/gif/coninss.gif",height: 80,width: 80,)),
            //   ],
            // ),
            ListTile(
              leading: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.amber,
                child: Center(
                  child: Icon(Icons.star,size: 20,color: Colors.white,),
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.arrow_forward,size: 20,color: Colors.black,),
                onPressed: (){},
              ),
              title: Text("Upgrade To Premium",style: TextStyle(color: Colors.black,fontSize: 20),),
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.purpleAccent,
                child: Center(
                  child: Icon(Icons.accessibility_new_rounded,size: 25,color: Colors.white,),
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.arrow_forward,size: 20,color: Colors.black,),
                onPressed: (){
                  Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: WorkoutExplore()));
                },
              ),
              title: Text("Explore All Workouts",style: TextStyle(color: Colors.black,fontSize: 20),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15,left: 15,bottom: 15),
              child: Row(
                children: [
                  Text("Top Picks",style: TextStyle(
                    fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500
                  ),),
                ],
              ),
            ),
            Container(
              height: 250,
              child: AnimationLimiter(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index){
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 1000),
                      child: SlideAnimation(
                        horizontalOffset: 44.0,
                        child: FadeInAnimation(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15,right: 0,bottom: 15,top: 10),
                            child: Container(
                              width: 150,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/workout/12.png"),
                                      fit: BoxFit.cover
                                  ),
                                borderRadius: BorderRadius.circular(7),
                                boxShadow: [
                                ]
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10,bottom: 5),
                                    child: Text(
                                      "Cardio And Dance",
                                      style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                        color: Colors.white
                                    ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10,bottom: 15),
                                    child: Row(
                                      children: [
                                        Text(
                                          "13 min",
                                          style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                            color: Colors.white
                                        ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10,bottom: 15),
                                    child: Row(
                                      children: [
                                        Text(
                                          "556 watched",
                                          style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                            color: Colors.white
                                        ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              child: MediaQuery.removePadding(
                context: context,
                removeBottom: true,
                removeTop: true,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index){
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10,left: 15,bottom: 10,right: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Abs Workout",style: TextStyle(
                                  fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500
                              ),),
                             IconButton(
                                 icon:  Icon(Icons.arrow_forward_ios_rounded,size: 20,color: Colors.black,),
                                 onPressed: (){
                                   Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: WorkoutExplore()));
                                 },
                             ),
                            ],
                          ),
                        ),
                        Container(
                          height: 150,
                          child: MediaQuery.removePadding(
                            context: context,
                            removeTop : true,
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: (BuildContext context, int index){
                                return Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Stack(
                                    alignment: Alignment.bottomRight,
                                    children: [
                                      Stack(
                                        alignment: Alignment.topRight,
                                        children: [
                                          Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Container(
                                                width: 250,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage("assets/workout/1.png"),
                                                      fit: BoxFit.cover
                                                    ),
                                                    borderRadius: BorderRadius.circular(7),
                                                ),
                                              ),
                                              Container(
                                                width: 250,
                                                height: 160,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(7),
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Colors.black.withOpacity(0.1),
                                                      Colors.black.withOpacity(0.05),
                                                    ],
                                                    begin: FractionalOffset.centerLeft,
                                                    end: FractionalOffset.bottomCenter,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 5,bottom: 10),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 5,top: 10),
                                                        child: Text("Core Yoga",style: TextStyle(color: Colors.black,fontSize: 22),),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 5,top: 5),
                                                        child: Text("565 Watched",style: GoogleFonts.lato(color: Colors.black.withOpacity(0.5),fontSize: 15),),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Container(
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  border: Border.all(color: Colors.white,width: 1),
                                                  borderRadius: BorderRadius.circular(7),
                                                  color: Colors.black.withOpacity(0.3),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 5,right: 5,top: 1,bottom: 3),
                                                  child: Center(child: Text("25:00",style: TextStyle(fontSize: 14,color: Colors.white),)),
                                                )),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 2,left: 2,top: 0,right: 5),
                                        child: IconButton(
                                          onPressed: (){},
                                          icon: Icon(Icons.play_circle_outline_rounded,size: 30,color: Colors.black.withOpacity(0.5),),
                                        ),
                                      ),
                                    ],
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
          ],
        ),
      ),
    );
  }
}
