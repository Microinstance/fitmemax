import 'package:fitmemax/Graph/BarChart.dart';
import 'package:fitmemax/src/ListData/ListData.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActivityCalBurnt extends StatefulWidget {
  @override
  _ActivityCalBurntState createState() => _ActivityCalBurntState();
}

class _ActivityCalBurntState extends State<ActivityCalBurnt> {
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
          "Caloric Burnt",style: TextStyles.TitleWhite,
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
                          text: "160",
                          style: TextStyles.DisplayWhite,
                        ),
                        TextSpan(
                          text: "   kCal",
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
              Dec: "kCal",
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,),
              child: Container(
                width: _width-40,
                decoration: BoxDecoration(
                    color: ColorPalette.ActivityTrackerCard,
                    borderRadius: borderRadious.secendaryRadious
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Total Caloric burnt",
                            style: TextStyles.RegulerBIGWhite,
                          ),
                          TextSpan(
                            text: "\n160",
                            style: TextStyles.TitleWhite,
                          ),
                          TextSpan(
                            text: "  kCal",
                            style: TextStyles.BodySmallWhite,
                          ),
                        ],

                      ),
                      textAlign: TextAlign.start,
                    ),
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(
                          value: 0.85,
                          strokeWidth: 5,
                          backgroundColor: Colors.white.withOpacity(0.2),
                          valueColor: AlwaysStoppedAnimation<Color>(ColorPalette.GrediantRed2),
                        ),
                      ),
                  ],),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 50),
              child: Column(
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _detailBox(
                        count: "45",
                        dec: "min",
                        imageIcon: "assets/icons/steps.png",
                        titel: "Workout",
                        width: _width,
                      ),
                      _detailBox(
                        count: "1600",
                        dec: "kCal",
                        imageIcon: "assets/icons/distance.png",
                        titel: "Cal. Eaten",
                        width: _width,
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _detailBox(
                        count: "120",
                        dec: "kCal",
                        imageIcon: "assets/icons/distance.png",
                        titel: "Cal. Burnt",
                        width: _width,
                      ),
                      _detailBox(
                        count: "3650",
                        dec: "",
                        imageIcon: "assets/icons/steps.png",
                        titel: "Steps",
                        width: _width,
                      ),

                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("High Today",style: TextStyles.RegulerBIGWhite,),
                      Text("100 kCal",style: TextStyles.BodySmallWhite,),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Low Today",style: TextStyles.RegulerBIGWhite,),
                      Text("40 kCal",style: TextStyles.BodySmallWhite,),
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
