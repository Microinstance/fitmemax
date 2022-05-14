import 'package:fitmemax/Graph/BarChart.dart';
import 'package:fitmemax/Objects/line_chart_sample1.dart';
import 'package:fitmemax/src/module/HealthLog/BloodPressureBarGraph.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:fitmemax/src/ListData/ListData.dart';

class HealthLogDetails extends StatefulWidget {
  @override
  _HealthLogDetailsState createState() => _HealthLogDetailsState();
}

class _HealthLogDetailsState extends State<HealthLogDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        brightness: Brightness.dark,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,bottom: 30),
              child: Row(
                children:[
                  SingleChildScrollView(
                    child: BloodPressueBarGraph(
                      listData: Data().BloodPressure,
                      color1:  ColorPalette.GrediantRed1,
                      color2:  ColorPalette.GrediantRed2,
                      Titel: "Steps",
                      Dec: "Steps",
                    ),
                  ),
                ]
              ),
              // child: CustomLineCharts(),
            ),
            MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: Container(
                height: 230,
                child: ListView.builder(
                  itemCount: 3,
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index){
                    if(index == 0){
                      return Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: GestureDetector(
                          onTap: (){
                            // Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: HealthLogDetails()));
                          },
                          child: Container(
                            height: 230,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: borderRadious.primeryRadious,
                                color: Colors.blue,
                                gradient: LinearGradient(
                                  colors: [
                                    ColorPalette.GrediantRed2,
                                    ColorPalette.GrediantRed1,
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                )
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                      radius: 22,
                                      backgroundColor: Colors.white.withOpacity(0.1),
                                      child: Center(child: Image.asset("assets/icon/watter.png",height: 25))),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Text("Blood Presure",style: TextStyles.TitleWhite,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text("30%",style: TextStyles.BodyWhite,),
                                  ),
                                  Spacer(),
                                  Text("141/91 mmhg",style: TextStyles.BodyWhite,),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    } else return Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        height: 230,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: borderRadious.primeryRadious,
                          color: Colors.white.withOpacity(0.05),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                  radius: 22,
                                  backgroundColor: Colors.white.withOpacity(0.1),
                                  child: Center(child: Image.asset("assets/icon/watter.png",height: 25))),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text("Blood Presure",style: TextStyles.TitleWhite,),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text("30%",style: TextStyles.BodyWhite,),
                              ),
                              Spacer(),
                              Text("141/91 mmhg",style: TextStyles.BodyWhite,),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
