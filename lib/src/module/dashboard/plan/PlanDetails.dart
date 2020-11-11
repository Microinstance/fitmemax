import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitmemax/src/module/dashboard/plan/CheckOut.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:page_transition/page_transition.dart';

class PlanDetails extends StatefulWidget {
  @override
  _PlanDetailsState createState() => _PlanDetailsState();
}

class _PlanDetailsState extends State<PlanDetails> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar:  AppBar(
        brightness: Brightness.light,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding:  EdgeInsets.only(right:10.0),
            child: Row(
              children: [
                Text("Need Help",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400,letterSpacing: 1,fontFamily: 'Roboto'),),
                SizedBox(width: 10,),
                Icon(Icons.help_outline_sharp,color: Colors.black,size: 25,)
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Balance",style: TextStyle(fontSize: 30,color: Colors.black,letterSpacing: 0.5,fontWeight: FontWeight.w500),),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("A Dedicated Team for your Specific Goals",style: TextStyle(fontSize: 16,color: Colors.black.withOpacity(0.7),letterSpacing: 0.5,fontWeight: FontWeight.w500),),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 5,
              width: _width*0.4,
              decoration: BoxDecoration(
                color: Colors.purple[400],
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 230.0,
                initialPage: 0,
                enlargeCenterPage: true,
                viewportFraction: 0.6,
                autoPlay: false,
                reverse: false,
                enableInfiniteScroll: false,
                scrollPhysics: BouncingScrollPhysics(),
                autoPlayInterval: Duration(seconds: 2),
                autoPlayAnimationDuration: Duration(milliseconds: 500),
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
              items: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: CheckOut()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 230,
                        width: _width*0.5,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 4,
                                spreadRadius: 4)
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      child: Column(
                        children: [
                          Container(
                           constraints: BoxConstraints(
                             maxHeight: 220 *0.22
                           ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                              color: Colors.purple[50],
                            ),
                            child: Center(
                              child: Text("6 Months",style: TextStyle(fontSize: 18,color: Colors.black,),),
                            ),
                          ),
                          Spacer(),
                          Text("33% Discount",style: TextStyle(fontSize: 15,color: Colors.black.withOpacity(0.5),),),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("₹2500/m",style: TextStyle(fontSize: 15,color: Colors.black.withOpacity(0.7),decoration: TextDecoration.lineThrough,fontFamily: 'Roboto',),),
                              SizedBox(width: 10,),
                              Text("₹1675/m",style: TextStyle(fontSize: 20,color: Colors.purple[700],fontFamily: 'Roboto',),),
                            ],
                          ),
                          Spacer(),
                          Container(
                            constraints: BoxConstraints(
                                maxHeight: 220 *0.22
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)),
                              color: Colors.purple.withOpacity(0.7),
                            ),
                            child: Center(
                              child: Text("Buy Now",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold,fontFamily: 'Roboto',),),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: CheckOut()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 230,
                      width: _width*0.5,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 4,
                              spreadRadius: 4)
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Column(
                        children: [
                          Container(
                            constraints: BoxConstraints(
                                maxHeight: 220 *0.22
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                              color: Colors.purple[50],
                            ),
                            child: Center(
                              child: Text("6 Months",style: TextStyle(fontSize: 18,color: Colors.black,),),
                            ),
                          ),
                          Spacer(),
                          Text("33% Discount",style: TextStyle(fontSize: 15,color: Colors.black.withOpacity(0.5),),),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("₹2500/m",style: TextStyle(fontSize: 15,color: Colors.black.withOpacity(0.7),decoration: TextDecoration.lineThrough,fontFamily: 'Roboto',),),
                              SizedBox(width: 10,),
                              Text("₹1675/m",style: TextStyle(fontSize: 20,color: Colors.purple[700],fontFamily: 'Roboto',),),
                            ],
                          ),
                          Spacer(),
                          Container(
                            constraints: BoxConstraints(
                                maxHeight: 220 *0.22
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)),
                              color: Colors.purple.withOpacity(0.7),
                            ),
                            child: Center(
                              child: Text("Buy Now",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold,fontFamily: 'Roboto',),),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: CheckOut()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 230,
                      width: _width*0.5,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 4,
                              spreadRadius: 4)
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Column(
                        children: [
                          Container(
                            constraints: BoxConstraints(
                                maxHeight: 220 *0.22
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                              color: Colors.purple[50],
                            ),
                            child: Center(
                              child: Text("6 Months",style: TextStyle(fontSize: 18,color: Colors.black,),),
                            ),
                          ),
                          Spacer(),
                          Text("33% Discount",style: TextStyle(fontSize: 15,color: Colors.black.withOpacity(0.5),),),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("₹2500/m",style: TextStyle(fontSize: 15,color: Colors.black.withOpacity(0.7),decoration: TextDecoration.lineThrough,fontFamily: 'Roboto',),),
                              SizedBox(width: 10,),
                              Text("₹1675/m",style: TextStyle(fontSize: 20,color: Colors.purple[700],fontFamily: 'Roboto',),),
                            ],
                          ),
                          Spacer(),
                          Container(
                            constraints: BoxConstraints(
                                maxHeight: 220 *0.22
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)),
                              color: Colors.purple.withOpacity(0.7),
                            ),
                            child: Center(
                              child: Text("Buy Now",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold,fontFamily: 'Roboto',),),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: CheckOut()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 230,
                      width: _width*0.5,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 4,
                              spreadRadius: 4)
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Column(
                        children: [
                          Container(
                            constraints: BoxConstraints(
                                maxHeight: 220 *0.22
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                              color: Colors.purple[50],
                            ),
                            child: Center(
                              child: Text("6 Months",style: TextStyle(fontSize: 18,color: Colors.black,),),
                            ),
                          ),
                          Spacer(),
                          Text("33% Discount",style: TextStyle(fontSize: 15,color: Colors.black.withOpacity(0.5),),),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("₹2500/m",style: TextStyle(fontSize: 15,color: Colors.black.withOpacity(0.7),decoration: TextDecoration.lineThrough,fontFamily: 'Roboto',),),
                              SizedBox(width: 10,),
                              Text("₹1675/m",style: TextStyle(fontSize: 20,color: Colors.purple[700],fontFamily: 'Roboto',),),
                            ],
                          ),
                          Spacer(),
                          Container(
                            constraints: BoxConstraints(
                                maxHeight: 220 *0.22
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)),
                              color: Colors.purple.withOpacity(0.7),
                            ),
                            child: Center(
                              child: Text("Buy Now",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold,fontFamily: 'Roboto',),),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.only(left:20,right: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Here's What you Get :",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,letterSpacing: 0.5),),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: (){
                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (BuildContext context) {
                          return _planDetails(context,0);
                        },
                        isScrollControlled: true,
                      );
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(right:15.0),
                          child: Icon(Icons.people,color: Colors.purple,),
                        ),
                        Text("2 Personal Coach",style: TextStyle(fontSize: 18,color: Colors.black.withOpacity(0.8)),),
                        Spacer(),
                        Padding(
                          padding:  EdgeInsets.only(top: 5),
                          child: Icon(Icons.keyboard_arrow_right,color: Colors.purple,size: 30,),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: (){
                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (BuildContext context) {
                          return _planDetails(context,1);
                        },
                        isScrollControlled: true,
                      );
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(right:15.0),
                          child: Icon(Icons.call,color: Colors.purple,),
                        ),
                        Text("4 Consultation Calls a month",style: TextStyle(fontSize: 18,color: Colors.black.withOpacity(0.8)),),
                        Spacer(),
                        Padding(
                          padding:  EdgeInsets.only(top: 5),
                          child: Icon(Icons.keyboard_arrow_right,color: Colors.purple,size: 30,),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: (){
                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (BuildContext context) {
                          return _planDetails(context,2);
                        },
                        isScrollControlled: true,
                      );
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(right:15.0),
                          child: Icon(Icons.chat_outlined,color: Colors.purple,),
                        ),
                        Text("Unlimited One-one Chat",style: TextStyle(fontSize: 18,color: Colors.black.withOpacity(0.8)),),
                        Spacer(),
                        Padding(
                          padding:  EdgeInsets.only(top: 5),
                          child: Icon(Icons.keyboard_arrow_right,color: Colors.purple,size: 30,),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: (){
                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (BuildContext context) {
                          return _planDetails(context,3);
                        },
                        isScrollControlled: true,
                      );
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(right:15.0),
                          child: Icon(Icons.fastfood
                            ,color: Colors.purple,),
                        ),
                        Text("Diet Plan",style: TextStyle(fontSize: 18,color: Colors.black.withOpacity(0.8)),),
                        Spacer(),
                        Padding(
                          padding:  EdgeInsets.only(top: 5),
                          child: Icon(Icons.keyboard_arrow_right,color: Colors.purple,size: 30,),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: (){
                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (BuildContext context) {
                          return _planDetails(context,4);
                        },
                        isScrollControlled: true,
                      );
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(right:15.0),
                          child: Icon(Icons.accessibility_rounded,color: Colors.purple,),
                        ),
                        Text("Workout Plan",style: TextStyle(fontSize: 18,color: Colors.black.withOpacity(0.8)),),
                        Spacer(),
                        Padding(
                          padding:  EdgeInsets.only(top: 5),
                          child: Icon(Icons.keyboard_arrow_right,color: Colors.purple,size: 30,),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: (){
                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (BuildContext context) {
                          return _planDetails(context,5);
                        },
                        isScrollControlled: true,
                      );
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(right:15.0),
                          child: Icon(Icons.group_add_outlined,color: Colors.purple,),
                        ),
                        Text("Group Plan",style: TextStyle(fontSize: 18,color: Colors.black.withOpacity(0.8)),),
                        Spacer(),
                        Padding(
                          padding:  EdgeInsets.only(top: 5),
                          child: Icon(Icons.keyboard_arrow_right,color: Colors.purple,size: 30,),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _planDetails(context,init){
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Container(
      // height: _height *0.7,
      height: 500,
      width: _width,
      color: Colors.transparent,
      child: Center(
        child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: PageView(
          scrollDirection: Axis.horizontal,
          controller: PageController(
          viewportFraction: 0.85,
          initialPage: init,
        ),
          onPageChanged: _onPageChanged,
          children: [
            Padding(
              padding:  EdgeInsets.only(right: _width*0.05,bottom: 30),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Column(
                  children: [
                    SizedBox(height:15,),
                    Text("2 Personal Coach",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,),),
                    SizedBox(height:20,),
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/plandetails/pd1.png"),
                          // fit: BoxFit.cover,
                        )
                      ),
                    ),
                    SizedBox(height:15,),
                    Spacer(),
                    Padding(
                      padding:  EdgeInsets.only(left: 15,right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(child: Text("Pick a nutritionist and a fitness trainer to jump start your journey to jump start your journey to a fitter you",style: TextStyle(fontSize: 18,),textAlign:  TextAlign.center,)),
                        ],
                      ),
                    ),
                    Spacer(),
                    MaterialButton(
                        onPressed: (){},
                      height: 40,
                      color: Colors.deepPurple.withOpacity(0.8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(" Buy Now at ₹1675 ",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(right: _width*0.05,bottom: 30),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Column(
                  children: [
                    SizedBox(height:15,),
                    Text("2 Personal Coach",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,),),
                    SizedBox(height:20,),
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/plandetails/pd1.png"),
                            // fit: BoxFit.cover,
                          )
                      ),
                    ),
                    SizedBox(height:15,),
                    Spacer(),
                    Padding(
                      padding:  EdgeInsets.only(left: 15,right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(child: Text("Pick a nutritionist and a fitness trainer to jump start your journey to jump start your journey to a fitter you",style: TextStyle(fontSize: 18,),textAlign:  TextAlign.center,)),
                        ],
                      ),
                    ),
                    Spacer(),
                    MaterialButton(
                      onPressed: (){},
                      height: 40,
                      color: Colors.deepPurple.withOpacity(0.8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(" Buy Now at ₹1675 ",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(right: _width*0.05,bottom: 30),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Column(
                  children: [
                    SizedBox(height:15,),
                    Text("2 Personal Coach",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,),),
                    SizedBox(height:20,),
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/plandetails/pd1.png"),
                            // fit: BoxFit.cover,
                          )
                      ),
                    ),
                    SizedBox(height:15,),
                    Spacer(),
                    Padding(
                      padding:  EdgeInsets.only(left: 15,right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(child: Text("Pick a nutritionist and a fitness trainer to jump start your journey to jump start your journey to a fitter you",style: TextStyle(fontSize: 18,),textAlign:  TextAlign.center,)),
                        ],
                      ),
                    ),
                    Spacer(),
                    MaterialButton(
                      onPressed: (){},
                      height: 40,
                      color: Colors.deepPurple.withOpacity(0.8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(" Buy Now at ₹1675 ",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(right: _width*0.05,bottom: 30),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Column(
                  children: [
                    SizedBox(height:15,),
                    Text("2 Personal Coach",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,),),
                    SizedBox(height:20,),
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/plandetails/pd1.png"),
                            // fit: BoxFit.cover,
                          )
                      ),
                    ),
                    SizedBox(height:15,),
                    Spacer(),
                    Padding(
                      padding:  EdgeInsets.only(left: 15,right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(child: Text("Pick a nutritionist and a fitness trainer to jump start your journey to jump start your journey to a fitter you",style: TextStyle(fontSize: 18,),textAlign:  TextAlign.center,)),
                        ],
                      ),
                    ),
                    Spacer(),
                    MaterialButton(
                      onPressed: (){},
                      height: 40,
                      color: Colors.deepPurple.withOpacity(0.8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(" Buy Now at ₹1675 ",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(right: _width*0.05,bottom: 30),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Column(
                  children: [
                    SizedBox(height:15,),
                    Text("2 Personal Coach",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,),),
                    SizedBox(height:20,),
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/plandetails/pd1.png"),
                            // fit: BoxFit.cover,
                          )
                      ),
                    ),
                    SizedBox(height:15,),
                    Spacer(),
                    Padding(
                      padding:  EdgeInsets.only(left: 15,right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(child: Text("Pick a nutritionist and a fitness trainer to jump start your journey to jump start your journey to a fitter you",style: TextStyle(fontSize: 18,),textAlign:  TextAlign.center,)),
                        ],
                      ),
                    ),
                    Spacer(),
                    MaterialButton(
                      onPressed: (){},
                      height: 40,
                      color: Colors.deepPurple.withOpacity(0.8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(" Buy Now at ₹1675 ",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(right: _width*0.05,bottom: 30),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Column(
                  children: [
                    SizedBox(height:15,),
                    Text("2 Personal Coach",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,),),
                    SizedBox(height:20,),
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/plandetails/pd1.png"),
                            // fit: BoxFit.cover,
                          )
                      ),
                    ),
                    SizedBox(height:15,),
                    Spacer(),
                    Padding(
                      padding:  EdgeInsets.only(left: 15,right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(child: Text("Pick a nutritionist and a fitness trainer to jump start your journey to jump start your journey to a fitter you",style: TextStyle(fontSize: 18,),textAlign:  TextAlign.center,)),
                        ],
                      ),
                    ),
                    Spacer(),
                    MaterialButton(
                      onPressed: (){},
                      height: 40,
                      color: Colors.deepPurple.withOpacity(0.8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(" Buy Now at ₹1675 ",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}

// class CustomSimulation extends Simulation {
//   final double initPosition;
//   final double velocity;
//
//   CustomSimulation({this.initPosition, this.velocity});
//
//   @override
//   double x(double time) {
//     var max =
//     math.max(math.min(initPosition, 0.0), initPosition + velocity * time);
//
//     print(max.toString());
//     return max;
//   }
//
//   @override
//   double dx(double time) {
//     print(velocity.toString());
//     return velocity;
//   }
//
//   @override
//   bool isDone(double time) {
//     return false;
//   }
// }
// class MyCustomScrollPhysics extends ScrollPhysics {
//   @override
//   ScrollPhysics applyTo(ScrollPhysics ancestor) {
//     return MyCustomScrollPhysics();
//   }
//
//   @override
//   Simulation createBallisticSimulation(
//       ScrollMetrics position, double velocity) {
//     return CustomSimulation(
//       initPosition: position.pixels,
//       velocity: velocity,
//     );
//   }
// }