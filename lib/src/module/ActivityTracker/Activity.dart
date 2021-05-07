import 'package:fitmemax/Graph/BarChart.dart';
import 'package:fitmemax/src/ListData/ListData.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Activity extends StatefulWidget {
  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
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
          "Activity",style: TextStyles.TitleWhite,
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
                      isSelected: true,
                      Titel: "Day"
                  ),
                  _graphButton(
                      isSelected: false,
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
                          text: "620",
                          style: TextStyles.DisplayWhite,
                        ),
                        TextSpan(
                          text: "   Hours",
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
              listData: Data().Activity,
              color1:  ColorPalette.GrediantRed1,
              color2:  ColorPalette.GrediantRed2,
              Titel: "Activity",
              Dec: "Activity",
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 0,bottom: 50),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _detailBox(
                        count: "200",
                        dec: "hr",
                        imageIcon: "assets/icons/steps.png",
                        titel: "FitBook",
                        width: _width,
                      ),
                      _detailBox(
                        count: "240",
                        dec: "hr",
                        imageIcon: "assets/icons/steps.png",
                        titel: "Workout",
                        width: _width,
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _detailBox(
                        count: "140",
                        dec: "hr",
                        imageIcon: "assets/icons/steps.png",
                        titel: "Caloric",
                        width: _width,
                      ),
                      _detailBox(
                        count: "40",
                        dec: "hr",
                        imageIcon: "assets/icons/steps.png",
                        titel: "Steps",
                        width: _width,
                      ),
                    ],
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
