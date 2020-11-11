import 'dart:async';

import 'package:flutter/material.dart';

class CoachChange extends StatefulWidget {
  @override
  _CoachChangeState createState() => _CoachChangeState();
}

class _CoachChangeState extends State<CoachChange> {
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
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Container(
      height: 400,
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
              viewportFraction: 0.8,
              initialPage: 0,
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
                      SizedBox(height:20,),
                      Container(
                        width: 204,
                        height: 204,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          color: Colors.pinkAccent.withOpacity(0.5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage("assets/coachs/coachs5.png"),
                                  // fit: BoxFit.cover,
                                )
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height:15,),
                      Text("Abhinav Shekh",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,),),
                      Spacer(),
                      Padding(
                        padding:  EdgeInsets.only(left: 15,right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(child: Text("Your Fitness Coach For 7 Days",style: TextStyle(fontSize: 18,),textAlign:  TextAlign.center,)),
                          ],
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                        width: _width,
                        child: MaterialButton(
                          onPressed: (){},
                          height: 50,
                          color: Colors.deepPurple.withOpacity(0.8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))
                          ),
                          child: Text(" Select Your Coach ",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                        ),
                      ),
                      // SizedBox(height: 15),
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
                      SizedBox(height:20,),
                      Container(
                        width: 204,
                        height: 204,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.pinkAccent.withOpacity(0.5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage("assets/coachs/coachs5.png"),
                                  // fit: BoxFit.cover,
                                )
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height:15,),
                      Text("Abhinav Shekh",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,),),
                      Spacer(),
                      Padding(
                        padding:  EdgeInsets.only(left: 15,right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(child: Text("Your Fitness Coach For 7 Days",style: TextStyle(fontSize: 18,),textAlign:  TextAlign.center,)),
                          ],
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                        width: _width,
                        child: MaterialButton(
                          onPressed: (){},
                          height: 50,
                          color: Colors.deepPurple.withOpacity(0.8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))
                          ),
                          child: Text(" Select Your Coach ",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                        ),
                      ),
                      // SizedBox(height: 15),
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
                      SizedBox(height:20,),
                      Container(
                        width: 204,
                        height: 204,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.pinkAccent.withOpacity(0.5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage("assets/coachs/coachs5.png"),
                                  // fit: BoxFit.cover,
                                )
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height:15,),
                      Text("Abhinav Shekh",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,),),
                      Spacer(),
                      Padding(
                        padding:  EdgeInsets.only(left: 15,right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(child: Text("Your Fitness Coach For 7 Days",style: TextStyle(fontSize: 18,),textAlign:  TextAlign.center,)),
                          ],
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                        width: _width,
                        child: MaterialButton(
                          onPressed: (){},
                          height: 50,
                          color: Colors.deepPurple.withOpacity(0.8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))
                          ),
                          child: Text(" Select Your Coach ",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                        ),
                      ),
                      // SizedBox(height: 15),
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
                      SizedBox(height:20,),
                      Container(
                        width: 204,
                        height: 204,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.pinkAccent.withOpacity(0.5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage("assets/coachs/coachs5.png"),
                                  // fit: BoxFit.cover,
                                )
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height:15,),
                      Text("Abhinav Shekh",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,),),
                      Spacer(),
                      Padding(
                        padding:  EdgeInsets.only(left: 15,right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(child: Text("Your Fitness Coach For 7 Days",style: TextStyle(fontSize: 18,),textAlign:  TextAlign.center,)),
                          ],
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                        width: _width,
                        child: MaterialButton(
                          onPressed: (){},
                          height: 50,
                          color: Colors.deepPurple.withOpacity(0.8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))
                          ),
                          child: Text(" Select Your Coach ",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                        ),
                      ),
                      // SizedBox(height: 15),
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
                      SizedBox(height:20,),
                      Container(
                        width: 204,
                        height: 204,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.pinkAccent.withOpacity(0.5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage("assets/coachs/coachs5.png"),
                                  // fit: BoxFit.cover,
                                )
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height:15,),
                      Text("Abhinav Shekh",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,),),
                      Spacer(),
                      Padding(
                        padding:  EdgeInsets.only(left: 15,right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(child: Text("Your Fitness Coach For 7 Days",style: TextStyle(fontSize: 18,),textAlign:  TextAlign.center,)),
                          ],
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                        width: _width,
                        child: MaterialButton(
                          onPressed: (){},
                          height: 50,
                          color: Colors.deepPurple.withOpacity(0.8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))
                          ),
                          child: Text(" Select Your Coach ",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                        ),
                      ),
                      // SizedBox(height: 15),
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
                      SizedBox(height:20,),
                      Container(
                        width: 204,
                        height: 204,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.pinkAccent.withOpacity(0.5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage("assets/coachs/coachs5.png"),
                                  // fit: BoxFit.cover,
                                )
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height:15,),
                      Text("Abhinav Shekh",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,),),
                      Spacer(),
                      Padding(
                        padding:  EdgeInsets.only(left: 15,right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(child: Text("Your Fitness Coach For 7 Days",style: TextStyle(fontSize: 18,),textAlign:  TextAlign.center,)),
                          ],
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                        width: _width,
                        child: MaterialButton(
                          onPressed: (){},
                          height: 50,
                          color: Colors.deepPurple.withOpacity(0.8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))
                          ),
                          child: Text(" Select Your Coach ",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                        ),
                      ),
                      // SizedBox(height: 15),
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
