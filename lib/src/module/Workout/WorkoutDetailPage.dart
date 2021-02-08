import 'package:fitmemax/src/module/Workout/WorkoutExersizePage.dart';
import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class WorkoutDetailPage extends StatefulWidget {
  @override
  _WorkoutDetailPageState createState() => _WorkoutDetailPageState();
}

class _WorkoutDetailPageState extends State<WorkoutDetailPage> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  leading: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      }
                  ),
                  expandedHeight: 230.0,
                  floating: true,
                  pinned: true,
                  snap: true,
                  elevation: 0,
                  centerTitle: false,
                  title: Text('Leg Slimming', style: GoogleFonts.openSans(color: Colors.white, fontSize: 20.0,)),
                  backgroundColor: Colors.teal,
                  flexibleSpace: FlexibleSpaceBar(
                      background: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          SizedBox(
                            width: _width,
                            child: Image.network(
                              'https://images.pexels.com/photos/2294354/pexels-photo-2294354.jpeg?crop=entropy&cs=srgb&dl=pexels-li-sun-2294354.jpg&fit=crop&fm=jpg&h=427&w=640',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 5,
                            child: SizedBox(
                              width: _width-30,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text("Calories",style: GoogleFonts.roboto(fontSize: 14,color: Colors.white),),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text("53",style: GoogleFonts.roboto(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
                                    ],
                                  ),

                                  Column(
                                    children: [
                                      Text("Joined",style: GoogleFonts.roboto(fontSize: 14,color: Colors.white),),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text("5453",style: GoogleFonts.roboto(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
                                    ],
                                  ),

                                  Column(
                                    children: [
                                      Text("Minute",style: GoogleFonts.roboto(fontSize: 14,color: Colors.white),),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text("14",style: GoogleFonts.roboto(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                  ),
                ),
              ];
            },
            body: Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,top: 20,),
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Introduction",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.bold),),
                    Padding(
                      padding: const EdgeInsets.only(top: 10,bottom: 15),
                      child: SizedBox(
                        width: _width-30,
                        height: 150,
                        child: Row(
                          children: [
                            Flexible(
                                child: Text("Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered",style: GoogleFonts.lato(fontSize: 15,color: Colors.grey.withOpacity(0.8)),)),
                          ],
                        ),
                      ),
                    ),
                    Text("Equipment",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    Text("Body weight Training",style: GoogleFonts.lato(fontSize: 15,color: Colors.grey.withOpacity(0.8)),),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Exercise List",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.bold),),

                        Text("12 Exercise",style: GoogleFonts.lato(fontSize: 15,color: Colors.grey.withOpacity(0.8)),),
                      ],
                    ),
                    SizedBox(height: 20,),
                   Container(
                     child: MediaQuery.removePadding(
                       removeTop: true,
                       context: context,
                       child: ListView.builder(
                         itemCount: 3,
                         physics: NeverScrollableScrollPhysics(),
                         shrinkWrap: true,
                         itemBuilder: (BuildContext context, int index){
                           return  Column(
                             children: [
                               Row(
                                 children: [
                                   Text("Abs",style: GoogleFonts.lato(fontSize: 18,color: Colors.black.withOpacity(0.8)),),
                                 ],
                               ),
                               SizedBox(height: 20,),
                               Container(
                                 child: MediaQuery.removePadding(
                                   context: context,
                                   removeTop: true,
                                   child: ListView.builder(
                                     itemCount: 3,
                                     physics: NeverScrollableScrollPhysics(),
                                     shrinkWrap: true,
                                     itemBuilder: (BuildContext context, int index){
                                       return Padding(
                                         padding: const EdgeInsets.only(bottom: 30),
                                         child: GestureDetector(
                                           onTap: (){
                                             Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: WorkoutExersizePage()));
                                           },
                                           child: Row(
                                             mainAxisAlignment: MainAxisAlignment.start,
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: [
                                               Container(
                                                 height: 100,
                                                 width: _width*0.35,
                                                 decoration: BoxDecoration(
                                                     borderRadius: BorderRadius.circular(5),
                                                     image: DecorationImage(
                                                       image: NetworkImage(
                                                         'https://images.pexels.com/photos/2294354/pexels-photo-2294354.jpeg?crop=entropy&cs=srgb&dl=pexels-li-sun-2294354.jpg&fit=crop&fm=jpg&h=427&w=640',
                                                       ),
                                                       fit: BoxFit.cover,
                                                     )
                                                 ),
                                               ),
                                               SizedBox(width: 15,),
                                               Column(
                                                 mainAxisAlignment: MainAxisAlignment.start,
                                                 crossAxisAlignment: CrossAxisAlignment.start,
                                                 children: [
                                                   SizedBox(height: 10,),
                                                   Text("Cross Leg Crunch - Left",style: TextStyle(fontSize: 15,color: Colors.black.withOpacity(0.5)),),
                                                   SizedBox(height: 10,),
                                                   Text("10 rps",style: TextStyle(fontSize: 12,color: Colors.black.withOpacity(0.5)),),
                                                 ],
                                               )
                                             ],
                                           ),
                                         ),
                                       );
                                     },
                                   ),
                                 ),
                               )
                             ],
                           );
                         },
                       ),
                     ),
                   )
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: MaterialButton(
                onPressed: (){},
                height: 50,
                color: Colors.red[300],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10,top: 10),
                  child: Text("Start Your Workout",style: GoogleFonts.lato(fontSize: 18,color:Colors.white,fontWeight: FontWeight.bold ),),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
