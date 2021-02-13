import 'package:fitmemax/src/module/dashboard/CoachConsultant/CoachPick.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';


class CoachCurrent extends StatefulWidget {
  @override
  _CoachCurrentState createState() => _CoachCurrentState();
}

class _CoachCurrentState extends State<CoachCurrent> {
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
                                ],
                              ),
                            ],
                          )
                      ),
                    ),
                  ];
                },
                body:
                SafeArea(
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
                                        padding: const EdgeInsets.only(left:20.0,right: 5),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Icon(Icons.chat,size: 30,),
                                            SizedBox(width: 20,),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [

                                                Text("Massage Shweta Dube",style: TextStyle(fontSize: 18,color: Colors.black),),
                                                Text("Balance Plan - Redefine yourself",style: TextStyle(fontSize: 12,color: Colors.black.withOpacity(0.6),letterSpacing: 1),),
                                              ],
                                            ),
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
                                        padding: const EdgeInsets.only(left:15.0,right: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Icon(Icons.call,size: 30,),
                                            SizedBox(width: 15,),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text("No Upcoming Consultation Call",style: TextStyle(fontSize: 17,color: Colors.black),),
                                              ],
                                            ),
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
                                        padding: const EdgeInsets.only(left:20.0,right: 5),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Icon(Icons.fastfood_sharp,size: 30,),
                                            SizedBox(width: 20,),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text("Diet Plan",style: TextStyle(fontSize: 18,color: Colors.black),),
                                                Text("Click Here to access Diet plan ",style: TextStyle(fontSize: 12,color: Colors.black.withOpacity(0.6),letterSpacing: 1),),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
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
                padding: const EdgeInsets.only(bottom: 50),
                child: Container(
                  width: _width*0.85,
                  height: 80,
                  decoration: BoxDecoration(
                 color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 3,
                        spreadRadius: 3,
                      )
                    ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: _width*0.85*0.7,
                          child: Row(
                            children: [
                              Flexible(child: Text("3 Days Remaining on your Free Trial, Go Premium Now",style: TextStyle(color: Colors.black,fontSize: 16),)),
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: (){
                              Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: CoachPick()));
                            },
                            icon: Icon(Icons.arrow_forward_rounded,size: 20,)),
                      ],
                    ),
                  ),
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
