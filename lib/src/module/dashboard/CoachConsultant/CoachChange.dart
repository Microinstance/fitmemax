import 'dart:async';

import 'package:fitmemax/Objects/ButtonOne.dart';
import 'package:fitmemax/styles.dart';
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
      height: 350,
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
            children: List.generate(5, (index) =>  Padding(
              padding:  EdgeInsets.only(right: 30,bottom: 30),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: borderRadious.primeryRadious
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15,bottom: 15),
                      child: Container(
                        width: 154,
                        height: 154,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorPalette.Pink,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            width: 150,
                            height: 150,
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
                    ),
                    Text("Abhinav Shekh",style: TextStyles.TitleBlack),
                    Padding(
                      padding:  EdgeInsets.only(left: 15,right: 15,top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(child: Text("Your Fitness Coach For 7 Days",style: TextStyles.BodyBlack),)
                        ],
                      ),
                    ),
                    Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15,bottom: 15),
                    child: ButtonOne(
                      title: "Select Coach",
                      colors: ColorPalette.PrimaryColor,
                      onPressed: (){},
                    ),
                  )
                  ],
                ),
              ),
            ),)
          ),
        ),
      ),
    );
  }
}
