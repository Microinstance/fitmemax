import 'package:fitmemax/Graph/BarChart.dart';
import 'package:fitmemax/src/ListData/ListData.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActivitySleep extends StatefulWidget {
  @override
  _ActivitySleepState createState() => _ActivitySleepState();
}

class _ActivitySleepState extends State<ActivitySleep> {
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
          "Sleep",style: TextStyles.TitleWhite,
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
                          text: "8.5",
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
              listData: Data().Walking,
              color1:  ColorPalette.GrediantRed1,
              color2:  ColorPalette.GrediantRed2,
              Titel: "Sleep",
              Dec: "Sleep",
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 0,bottom: 50),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _detailBox(
                        count: "8.35",
                        dec: "hours",
                        imageIcon: "assets/icons/steps.png",
                        titel: "Total Sleep",
                        width: _width,
                      ),
                      _detailBox(
                        count: "15.65",
                        dec: "hours",
                        imageIcon: "assets/icons/distance.png",
                        titel: "Awake ",
                        width: _width,
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _detailBox(
                        count: "11:00",
                        dec: "pm",
                        imageIcon: "assets/icons/steps.png",
                        titel: "Sleep At",
                        width: _width,
                      ),
                      _detailBox(
                        count: "07:00",
                        dec: "am",
                        imageIcon: "assets/icons/distance.png",
                        titel: "Wake At",
                        width: _width,
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  //Padding(
                  //               padding: const EdgeInsets.only(left: 20,right: 20),
                  //               child: Container(
                  //                 decoration: BoxDecoration(
                  //                     color: ColorPalette.ActivityTrackerCard,
                  //                     borderRadius: borderRadious.secendaryRadious
                  //                 ),
                  //                 child: Padding(
                  //                   padding: const EdgeInsets.all(20),
                  //                   child: Row(
                  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                     children: [
                  //                       Column(
                  //                         crossAxisAlignment: CrossAxisAlignment.start,
                  //                         children: [
                  //                           Text("Total Steps",style: TextStyles.BodyGreyLightest,),
                  //                           SizedBox(height: 7,),
                  //                           Text("10,758",style: TextStyles.TitleWhite,),
                  //                         ],
                  //                       ),
                  //                       Stack(
                  //                         alignment: Alignment.center,
                  //                         children: [
                  //                           SizedBox(
                  //                             height:60,
                  //                             width: 60,
                  //                             child: CircularProgressIndicator(
                  //                               value: 0.31,
                  //                               strokeWidth: 3,
                  //                               backgroundColor: Colors.white.withOpacity(0.2),
                  //                               valueColor: AlwaysStoppedAnimation<Color>(ColorPalette.GrediantRed2),
                  //                             ),
                  //                           ),
                  //                           Text.rich(
                  //                             TextSpan(
                  //                               children: <TextSpan>[
                  //                                 TextSpan(
                  //                                   text: "31%",
                  //                                   style: TextStyles.ParaWhite,
                  //                                 ),
                  //                               ],
                  //                             ),
                  //                             textAlign: TextAlign.center,
                  //                           ),
                  //                         ],
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
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
