import 'package:animator/animator.dart';
import 'package:fitmemax/src/module/Workout/WorkoutDetailPage.dart';
import 'package:fitmemax/src/module/Workout/WorkoutExplore.dart';
import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import 'WorkoutSearch.dart';

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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Animator(
              tween: Tween<double>(begin: 0.8, end: 1.4),
              curve: Curves.fastOutSlowIn,
              cycles: 0,
              builder: (_, animationState, __) => Transform.scale(
                scale: animationState.value,
                child:  IconButton(
                  onPressed: (){
                    Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child: WorkoutSearch()));
                  },
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
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
            ListTile(
              leading: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.red,
                child: Center(
                  child: Icon(Icons.live_tv,size: 23 ,color: Colors.white,),
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.arrow_forward,size: 20,color: Colors.black,),
                onPressed: (){
                  Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: WorkoutExplore()));
                },
              ),
              title: Text("Live Workouts",style: TextStyle(color: Colors.black,fontSize: 20),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15,left: 15,bottom: 15),
              child: Row(
                children: [
                  Text("Trending",style: TextStyle(
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
                          padding: const EdgeInsets.only(top: 15,left: 15,bottom: 15,right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Abs Workout",style: TextStyle(
                                  fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500
                              ),),
                            ],
                          ),
                        ),
                        Container(
                          height: 165,
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
                                  padding: const EdgeInsets.only(left: 15,bottom: 15),
                                  child: GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: WorkoutDetailPage()));
                                    },
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
