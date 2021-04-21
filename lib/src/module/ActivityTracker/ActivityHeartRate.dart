import 'package:fitmemax/Graph/BarChart.dart';
import 'package:fitmemax/src/ListData/ListData.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActivityHeartRate extends StatefulWidget {
  @override
  _ActivityHeartRateState createState() => _ActivityHeartRateState();
}

class _ActivityHeartRateState extends State<ActivityHeartRate> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
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
          "Heart Rate",style: TextStyles.TitleWhite,
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
                          text: "102",
                          style: TextStyles.DisplayWhite,
                        ),
                        TextSpan(
                          text: "   Bpm",
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
              Titel: "BPM",
              Dec: "Bpm",
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 0,bottom: 50),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _detailBox(
                        count: "60-100",
                        dec: "bpm",
                        imageIcon: "assets/icons/steps.png",
                        titel: "Bpm Range",
                        width: _width,
                      ),
                      _detailBox(
                        count: "40",
                        dec: "bpm",
                        imageIcon: "assets/icons/distance.png",
                        titel: "Rasting",
                        width: _width,
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text("High Today",style: TextStyles.RegulerBIGWhite,),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15,bottom: 20),
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Container(
                          width: _width-40,
                          height: 15,
                          decoration: BoxDecoration(
                            borderRadius: borderRadious.secendaryRadious,
                            color: Colors.white.withOpacity(0.2),
                          ),
                        ),
                        Container(
                          width: (_width-40)*0.75,
                          height: 15,
                          decoration: BoxDecoration(
                            borderRadius: borderRadious.secendaryRadious,
                            color: ColorPalette.GrediantRed2
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text("Low Today",style: TextStyles.RegulerBIGWhite,),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15,bottom: 50),
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Container(
                          width: _width-40,
                          height: 15,
                          decoration: BoxDecoration(
                            borderRadius: borderRadious.secendaryRadious,
                            color: Colors.white.withOpacity(0.2),
                          ),
                        ),
                        Container(
                          width: (_width-40)*0.75,
                          height: 15,
                          decoration: BoxDecoration(
                              borderRadius: borderRadious.secendaryRadious,
                              color: ColorPalette.GrediantRed1
                          ),
                        ),
                      ],
                    ),
                  ),
                ],),
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
