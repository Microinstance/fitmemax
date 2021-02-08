import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkoutExersizePage extends StatefulWidget {
  @override
  _WorkoutExersizePageState createState() => _WorkoutExersizePageState();
}

class _WorkoutExersizePageState extends State<WorkoutExersizePage> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(

        children: [
          SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  height: _height*0.4,
                  width: _width,
                  color: Colors.grey[200],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
                  child: SizedBox(
                    child: Row(
                      children: [
                        Flexible(child: Text("Side-lying knee raise - left",style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 22),)),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15,top: 30),
                  child: SizedBox(
                    child: Row(
                      children: [
                        Flexible(child: Text("Tips",style: GoogleFonts.lato(fontWeight: FontWeight.w500,color: Colors.black.withOpacity(0.9),fontSize: 14),)),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: AnimationLimiter(
                      child: ListView.builder(
                        itemCount: 3,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index){
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 1000),
                            child: SlideAnimation(
                              verticalOffset: 44.0,
                              child: FadeInAnimation(
                                  child: _Tips()),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15,top: 20),
                  child: SizedBox(
                    child: Row(
                      children: [
                        Flexible(child: Text("Breathing",style: GoogleFonts.lato(fontWeight: FontWeight.w500,color: Colors.black.withOpacity(0.9),fontSize: 14),)),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: AnimationLimiter(
                      child: ListView.builder(
                        itemCount: 1,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index){
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 2000),
                            child: SlideAnimation(
                              verticalOffset: 44.0,
                              child: FadeInAnimation(
                                  child: _Tips()),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15,top: 5),
                  child: SizedBox(
                    child: Row(
                      children: [
                        Flexible(child: Text("Demo",style: GoogleFonts.lato(fontWeight: FontWeight.w500,color: Colors.black.withOpacity(0.9),fontSize: 14),)),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 400,
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: AnimationLimiter(
                      child: ListView.builder(
                        itemCount: 4,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index){
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 3000),
                            child: SlideAnimation(
                              // verticalOffset: 44.0,
                              child: FadeInAnimation(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15,right: 5,top: 10,bottom: 50),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 180,
                                          width: _width*0.8,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(7),
                                            color: Colors.grey[100]
                                          ),
                                        ),
                                        SizedBox(height: 15,),
                                        SizedBox(
                                          width: _width*0.8,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(top: 7),
                                                child: CircleAvatar(
                                                  radius: 3,
                                                  backgroundColor: Colors.black,
                                                ),
                                              ),
                                              SizedBox(width: 10,),
                                              Flexible(child: Text("Engage the outside of your glutets to draw your thigh as close to your abs as possible while raising the knee",style: GoogleFonts.lato(fontWeight: FontWeight.w500,color: Colors.black.withOpacity(0.9),fontSize: 14),)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SafeArea(
              child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: 20,
                color: Colors.black,
              ),
                  onPressed: (){
                Navigator.pop(context);
                  }
                  )
          )
        ],
      ),
    );
  }
  Widget _Tips(){
    return Padding(
      padding: const EdgeInsets.only(left: 15,right: 15,top: 30),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 7),
              child: CircleAvatar(
                radius: 3,
                backgroundColor: Colors.black,
              ),
            ),
            SizedBox(width: 10,),
            Flexible(child: Text("Engage the outside of your glutets to draw your thigh as close to your abs as possible while raising the knee",style: GoogleFonts.lato(fontWeight: FontWeight.w500,color: Colors.black.withOpacity(0.9),fontSize: 14),)),
          ],
        ),
      ),
    );
  }
}
