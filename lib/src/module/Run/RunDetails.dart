import 'package:fitmemax/Objects/ButtonOne.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RunDetails extends StatefulWidget {
  @override
  _RunDetailsState createState() => _RunDetailsState();
}

class _RunDetailsState extends State<RunDetails> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Stack(
              children: [
                Container(
                  width: _width,
                  height: _height*0.5,
                  color: Colors.black,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: _height*0.2,left: 15,right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 110,
                          child:  MaterialButton(
                            height: 35,
                            elevation: 0,
                            splashColor: ColorPalette.Grediantblue1.withOpacity(0.2),
                            shape: RoundedRectangleBorder(
                                borderRadius: borderRadious.primeryRadious),
                            onPressed:(){},
                            color: ColorPalette.Grediantblue1,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10,bottom: 10,left: 5,right: 5),
                              child: Text(
                                "Pause",
                                style: TextStyles.BodyWhite,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "8.5 km",
                          style: TextStyles.TitleWhite,
                        ),
                        SizedBox(
                          width: 110,
                          child:  MaterialButton(
                            height: 35,
                            elevation: 0,
                            splashColor: ColorPalette.Grediantblue1.withOpacity(0.2),
                            shape: RoundedRectangleBorder(
                                borderRadius: borderRadious.primeryRadious),
                            onPressed:(){},
                            color: ColorPalette.Grediantblue2,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10,bottom: 10,left: 5,right: 5),
                              child: Text(
                                "Complete",
                                style: TextStyles.BodyWhite,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 2,left: 5),
                child: IconButton(
                  icon: Icon(Icons.arrow_back,color: Colors.white,size: 20,),
                  onPressed: (){},
                ),
              ),
            )
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: _width,
              height: _height*0.55,
             decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15),)
             ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10,bottom: 20),
                    child: Container(
                      height: 5,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: borderRadious.primeryRadious,
                        color: ColorPalette.Grey.withOpacity(0.4),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15,left: 15),
                    child: Row(
                      children: [
                        Text(
                          "24 May, 2021",
                          style: TextStyles.BodySmallBlack,
                        ),

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15,left: 15,top: 5),
                    child: Row(
                      children: [
                        Text(
                          "Running Analytics",
                          style: TextStyles.RegulerBlack,
                        ),

                      ],
                    ),
                  ),
                  Spacer(),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15,bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 185/2-10,
                            width: ((_width-40)/2)-10,
                            decoration: BoxDecoration(
                              borderRadius: borderRadious.primeryRadious,
                              color: Colors.grey.withOpacity(0.12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text("480",style: TextStyles.TitleBlack,),
                                      SizedBox(height: 3,),
                                      Text("Steps",style: TextStyles.BodySmallBlack,),
                                    ],
                                  ),
                                  Icon(CupertinoIcons.chart_bar,size: 30,color: ColorPalette.Grediantblue1,),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 20,),
                          Container(
                            height: 185/2-10,
                            width: ((_width-40)/2)-10,
                            decoration: BoxDecoration(
                              borderRadius: borderRadious.primeryRadious,
                              color: Colors.grey.withOpacity(0.12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text("325",style: TextStyles.TitleBlack,),
                                      SizedBox(height: 3,),
                                      Text("Calories",style: TextStyles.BodySmallBlack,),
                                    ],
                                  ),
                                  Icon(Icons.accessibility_new_rounded,size: 30,color: ColorPalette.Teal,),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
