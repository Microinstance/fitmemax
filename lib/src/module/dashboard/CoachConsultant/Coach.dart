import 'dart:ui';

import 'package:fitmemax/src/module/dashboard/CoachConsultant/CoachChange.dart';
import 'package:fitmemax/src/module/dashboard/CoachConsultant/CoachChangeTime.dart';
import 'package:fitmemax/src/module/dashboard/CoachConsultant/CoachCurrent.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Coach extends StatefulWidget {
  @override
  _CoachState createState() => _CoachState();
}

class _CoachState extends State<Coach> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor:Colors.white,
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              NestedScrollView(
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      backgroundColor: Colors.white,
                      centerTitle: false,
                      pinned: false,
                      expandedHeight: 230,
                      floating: false,
                      flexibleSpace: FlexibleSpaceBar(
                          background: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage("assets/coachs/coach1.png"),
                                          fit: BoxFit.fitHeight,
                                        ),
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30))
                                    ),
                                  ),
                                  SafeArea(
                                    child: Padding(
                                      padding:  EdgeInsets.only(right:20.0,top: 5),
                                      child: GestureDetector(
                                        onTap: (){
                                          showModalBottomSheet(
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (BuildContext context) {
                                              return CoachChange();
                                            },
                                            isScrollControlled: true,
                                          );
                                        },
                                        child: Container(
                                          height: 35,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius: BorderRadius.all(Radius.circular(40)),
                                            border: Border.all(width:1,color:Colors.red[700]),
                                          ),
                                          child: Center(child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Icon(Icons.face,size: 18,),
                                              Text("Change",style: TextStyle(fontSize: 15,color:Colors.red[700],fontWeight: FontWeight.w500,letterSpacing: 0.5),),
                                            ],
                                          ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // Container(
                              //   height: 30,
                              //   decoration: BoxDecoration(
                              //       color:Colors.white,
                              //       borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50),)
                              //   ),
                              // ),
                            ],
                          )
                      ),
                    ),
                  ];
                },
                body: SafeArea(
                  top: true,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              "Shweta Dube",
                              style: TextStyle(fontSize: 22,color: Colors.red[700],fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              "Your Fitness Coach For 7 Days",
                              style: TextStyle(fontSize: 18,color: Colors.red[700],fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Expanded(
                        child: Container(
                          child: MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            child: ListView(
                              shrinkWrap: true,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left:20.0,right: 20),
                                  child: Container(
                                    height: 65,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius: BorderRadius.all(Radius.circular(15)),
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left:5.0,right: 5),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Icon(Icons.calendar_today,size: 30,),

                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text("Your Coach will call you on",style: TextStyle(fontSize: 15,color: Colors.black.withOpacity(0.6),letterSpacing: 1),),
                                                Text("09:30 am, 6 Dec",style: TextStyle(fontSize: 20,color: Colors.black),),
                                              ],
                                            ),
                                            GestureDetector(
                                                onTap: (){
                                                  showModalBottomSheet(
                                                    backgroundColor: Colors.transparent,
                                                    context: context,
                                                    builder: (BuildContext context) {
                                                      return CoachChangeTime();
                                                    },
                                                    isScrollControlled: true,
                                                  );
                                                },
                                                child: Icon(Icons.edit_outlined,size: 33,)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 25,),
                                Padding(
                                  padding: const EdgeInsets.only(left:20.0,right: 20),
                                  child: Container(
                                    height: 65,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius: BorderRadius.all(Radius.circular(15)),
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left:15.0,right: 15),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(Icons.call,size: 30,),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text("Your Number",style: TextStyle(fontSize: 15,color: Colors.black.withOpacity(0.6),letterSpacing: 1),),
                                                Text("8250414042",style: TextStyle(fontSize: 20,color: Colors.black),),
                                              ],
                                            ),
                                            Icon(Icons.edit_outlined,size: 33,),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Padding(
                                  padding:  EdgeInsets.only(right: 10,left: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Get Reminder On Whatsapp",style: TextStyle(fontSize: 18,),),
                                      Checkbox(
                                          value: true,
                                          onChanged: (value){},
                                        activeColor: Colors.red[400],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 15,),
                                Padding(
                                  padding:  EdgeInsets.only(right: 10,left: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(Icons.card_giftcard_outlined,color:Colors.red[700],),
                                      SizedBox(width: 20,),
                                      Text("What you Get Free For Free",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 30,),
                                Container(
                                  height: 240,
                                  child: ListView(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,

                                    children: [
                                      Padding(
                                        padding:  EdgeInsets.only(left: 25),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 180,
                                              width: 300,
                                              decoration: BoxDecoration(image: DecorationImage(
                                                  image: AssetImage("assets/Coach/coacvector3.png"),
                                                fit: BoxFit.fitHeight,
                                              ),
                                                color: Colors.grey[100],
                                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                              ),
                                            ),
                                            SizedBox(height: 10,),
                                            Text("1 Consultation Coach Call",style: TextStyle(fontSize: 20,color: Colors.black),),
                                            SizedBox(height: 5,),
                                            Text("Personalize Coach Call",style: TextStyle(fontSize: 15,color: Colors.black.withOpacity(0.6),letterSpacing: 1),),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.only(left: 25),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 180,
                                              width: 300,
                                              decoration: BoxDecoration(image: DecorationImage(
                                                image: AssetImage("assets/Coach/coacvector2.png"),
                                                fit: BoxFit.fitHeight,
                                              ),
                                                color: Colors.grey[100],
                                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                              ),
                                            ),
                                            SizedBox(height: 10,),
                                            Text("Diet Plan",style: TextStyle(fontSize: 20,color: Colors.black),),
                                            SizedBox(height: 5,),
                                            Text("To get a Healthy Version You",style: TextStyle(fontSize: 15,color: Colors.black.withOpacity(0.6),letterSpacing: 1),),


                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.only(left: 25,right: 20),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 180,
                                              width: 300,
                                              decoration: BoxDecoration(image: DecorationImage(
                                                image: AssetImage("assets/Coach/coacvector1.png"),
                                                fit: BoxFit.fitHeight,
                                              ),
                                                color: Colors.grey[100],
                                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                              ),
                                            ),
                                            SizedBox(height: 10,),
                                            Text("Workout Plan",style: TextStyle(fontSize: 20,color: Colors.black),),
                                            SizedBox(height: 5,),
                                            Text("To meet your Fitness Goal",style: TextStyle(fontSize: 15,color: Colors.black.withOpacity(0.6),letterSpacing: 1),),

                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 150,),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: MaterialButton(
                  height: 50,
                  onPressed: (){
                    Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: CoachCurrent()));
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Colors.red[700],
                  child: Text("  Activate Free Trial  ",style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.w500,fontFamily: 'Roboto'),),
                ),
              )
            ],
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: IconButton(
                  icon: Icon(Icons.arrow_back,color: Colors.red[700],size: 30,),
                  onPressed: (){
                    Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),

    );
  }
}
