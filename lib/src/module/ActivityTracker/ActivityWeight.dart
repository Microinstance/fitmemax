import 'package:fitmemax/Graph/BarChart.dart';
import 'package:fitmemax/src/ListData/ListData.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActivityWeight extends StatefulWidget {
  @override
  _ActivityWeightState createState() => _ActivityWeightState();
}

class _ActivityWeightState extends State<ActivityWeight> {

  Color _getColor({int index, int count}){
    int xCount = (count/6).round();
    if(index <= xCount) {
      return ColorPalette.BMIColor1;
    }if(index <= xCount*2.2) {
      return ColorPalette.BMIColor2;
    }if(index <= xCount*3.5) {
      return ColorPalette.BMIColor3;
    } else return ColorPalette.BMIColor4;
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    double _boxspace = (_width-80);
    double _bmi = 24.14;
    double _bmiNet = _bmi-10;
    int _BMI = _bmiNet.round();
    int barCount = (_boxspace/6).toInt();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.white,size: 20,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        title: Text(
          "Weight",style: TextStyles.TitleWhite,
        ),
        brightness: Brightness.dark,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15,left: 15,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _graphButton(
                      isSelected: false,
                      Titel: "Day"
                  ),
                  _graphButton(
                      isSelected: true,
                      Titel: "Week"
                  ),
                  _graphButton(
                      isSelected: false,
                      Titel: "Month"
                  ),
                ],),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20,bottom: 20,left: 15,right: 15),
              child: Row(
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "72",
                          style: TextStyles.DisplayWhite,
                        ),
                        TextSpan(
                          text: "   kg",
                          style: TextStyles.BodySmallWhite,
                        ),
                      ],

                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            BarChart(
              listData: Data().Walking,
              color1:  ColorPalette.GrediantRed1,
              color2:  ColorPalette.GrediantRed2,
              Titel: "Weight",
              Dec: "Weight",
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                children: [
                  Text("BMI Calculater",style: TextStyles.RegulerBIGWhite,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
              child: Container(
                width: _width-40,
                decoration: BoxDecoration(
                  borderRadius: borderRadious.secendaryRadious,
                  color: ColorPalette.ActivityTrackerCard,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "23.14",
                                  style: TextStyles.TitleWhite,
                                ),
                                TextSpan(
                                  text: "   You are healthy",
                                  style: TextStyles.BodySmallFluracentGreen,
                                ),
                              ],

                            ),
                            textAlign: TextAlign.start,
                          ),
                          Row(
                            children: List.generate(3, (index) => Padding(
                              padding: const EdgeInsets.only(left: 2),
                              child: CircleAvatar(radius: 2,backgroundColor: ColorPalette.Grediantblue1,),
                            )),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: _boxspace,
                        child: Column(
                          children: [
                            Row(
                              children: List.generate(barCount, (index) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 1.5,right: 1.5),
                                  child: Container(
                                    height: (index == _BMI) ? 35 : 20,
                                    width: 3,
                                    decoration: BoxDecoration(
                                      borderRadius: borderRadious.secendaryRadious,
                                      color: _getColor(count: barCount,index: index),
                                    ),
                                  ),
                                );
                              }

                              ),
                            ),
                            SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(6, (index) => Text("${15 + index*5}",style: TextStyles.BodySmallGrediantblue1,)),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                children: [
                  Text("Your Progress",style: TextStyles.RegulerBIGWhite,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: _width-40,
                decoration: BoxDecoration(
                  borderRadius: borderRadious.secendaryRadious,
                  color: ColorPalette.ActivityTrackerCard,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text("Current",style: TextStyles.BodySmallWhite,),
                              SizedBox(
                                height: 5,
                              ),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "80",
                                      style: TextStyles.TitleWhite,
                                    ),
                                    TextSpan(
                                      text: "  kg",
                                      style: TextStyles.BodyGreyLightest,
                                    ),
                                  ],

                                ),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Target",style: TextStyles.BodySmallWhite,),
                              SizedBox(
                                height: 5,
                              ),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "65",
                                      style: TextStyles.TitleWhite,
                                    ),
                                    TextSpan(
                                      text: "  kg",
                                      style: TextStyles.BodyGreyLightest,
                                    ),
                                  ],

                                ),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Current",style: TextStyles.BodySmallWhite,),
                              SizedBox(
                                height: 5,
                              ),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "78",
                                      style: TextStyles.TitleWhite,
                                    ),
                                    TextSpan(
                                      text: "  kg",
                                      style: TextStyles.BodyGreyLightest,
                                    ),
                                  ],

                                ),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Container(
                            width: _width-80,
                            height: 7,
                            decoration: BoxDecoration(
                              borderRadius: borderRadious.secendaryRadious,
                              color: Colors.white.withOpacity(0.15),
                            ),
                          ),
                          Container(
                            width: (_width-80)*0.3,
                            height: 7,
                            decoration: BoxDecoration(
                              borderRadius: borderRadious.secendaryRadious,
                                gradient: new LinearGradient(
                                    colors: [
                                      ColorPalette.GrediantRed1,
                                      ColorPalette.GrediantRed2,
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                )
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
  Widget _graphButton({bool isSelected,String Titel}){
    return Container(
      width: 80,
      decoration: BoxDecoration(
          borderRadius: borderRadious.secendaryRadious,
          gradient: LinearGradient(
            colors: [
              isSelected ? ColorPalette.GrediantRed2 : Colors.white.withOpacity(0.1),
              isSelected ? ColorPalette.GrediantRed1 : Colors.white.withOpacity(0.1),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          )
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 6,bottom: 8,left: 15,right: 15),
        child: Text(Titel,style: TextStyles.ParaWhite,textAlign: TextAlign.center,),
      ),
    );
  }

  Widget _detailBox({double width,String titel,String imageIcon,String count,String dec }){
    return Container(
      width: ((width-40)/2)-10,
      decoration: BoxDecoration(
          color: ColorPalette.ActivityTrackerCard,
          borderRadius: borderRadious.secendaryRadious
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(titel,style: TextStyles.ParaWhite,),
                Image.asset(imageIcon,height: 20,color: ColorPalette.GrediantRed1,),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(count,style: TextStyles.TitleWhite,),
                Text("  ${dec}",style: TextStyles.BodySmallWhite,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
