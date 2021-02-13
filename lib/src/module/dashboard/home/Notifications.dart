import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Palette.primaryColor,
        brightness: Brightness.light,
        centerTitle: false,
        title:  Text("Notifications",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
        elevation: 0.5,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,size: 20,color: Colors.white,),
        ),
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15,top: 20,bottom: 5),
              child: Row(
                children: [
                  Text("New Notifications",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500),),
                ],
              ),
            ),
            Container(
              child: AnimationLimiter(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 2,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index){
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 1000),
                      child: SlideAnimation(
                        verticalOffset: 44.0,
                        child: FadeInAnimation(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10,bottom: 10,left: 15,right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Container(
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(7.5),
                                          color: Colors.pink[50],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 15,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: _width-(30+15+80),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Flexible(child: Text("Samsung Galaxy F41",style: TextStyle(color: Colors.black,fontSize: 18),)),
                                                ],
                                              ),
                                              SizedBox(height: 5,),
                                              Row(
                                                children: [
                                                  Flexible(child: Text("Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.",style: TextStyle(fontSize: 14,color: Colors.grey[500]),overflow: TextOverflow.ellipsis,maxLines: 3,)),
                                                ],
                                              ),
                                              SizedBox(height: 3,),
                                              Row(
                                                children: [
                                                  Flexible(child: Text("a few seconds ago",style: TextStyle(fontSize: 12,color: Colors.black26),)),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),


                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,top: 0,bottom: 5),
              child: Row(
                children: [
                  Text("Earlier Notifications",style: TextStyle(fontSize: 18,color: Colors.black),),
                ],
              ),
            ),
            Container(
              child: AnimationLimiter(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 12,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index){
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 1000),
                      child: SlideAnimation(
                        verticalOffset: 44.0,
                        child: FadeInAnimation(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10,bottom: 10,left: 15,right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Container(
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(7.5),
                                          color: Colors.pink[50],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 15,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: _width-(30+15+80),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Flexible(child: Text("Samsung Galaxy F41",style: TextStyle(color: Colors.black,fontSize: 18),)),
                                                ],
                                              ),
                                              SizedBox(height: 5,),
                                              Row(
                                                children: [
                                                  Flexible(child: Text("Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.",style:  TextStyle(fontSize: 14,color: Colors.grey[500]))),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),


                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
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
