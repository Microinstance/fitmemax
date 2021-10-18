import 'package:blinking_text/blinking_text.dart';
import 'package:fitmemax/src/module/Yoga/YogaCategoryDetailPage.dart';
import 'package:fitmemax/src/module/Yoga/YogaCategoryViewAll.dart';
import 'package:fitmemax/src/module/Yoga/YogaSearchPage.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'YogaCategoryDetailPagePremium.dart';

class Yoga extends StatefulWidget {
  @override
  _YogaState createState() => _YogaState();
}

class _YogaState extends State<Yoga> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,color: Colors.white,size: 20,),
        ),
        centerTitle: false,
        title: Text("Yoga",style: TextStyles.HeadingWhite,),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15,bottom: 15,right: 10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: borderRadious.primeryRadious,
                color: Colors.orange[800]
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 5,right: 5,bottom: 2),
                child: Center(child: BlinkText('Get Premium',style: TextStyles.ParaWhite,
                    beginColor: Colors.white,
                    endColor: Colors.orange[800],
                )),
              ),
            ),
          ),
          IconButton(
            onPressed: (){
              Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: YogaSearchPage()));
            },
            icon: Icon(Icons.search,color: Colors.white,size: 20,),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,top: 15,bottom: 15),
              child: Row(
                children: [
                  Text("BUCKET",style: TextStyles.TitleBlack,),
                ],
              ),
            ),
            Container(
              height: 205,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index){
                  return Padding(
                    padding: EdgeInsets.only(right: 15,left: (index==0) ? 15 : 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 150,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: borderRadious.primeryRadious,
                            image: DecorationImage(
                              image: AssetImage("assets/yoga/yoga-model01.png"),
                              fit: BoxFit.cover,
                            )
                          ),
                          child: Center(
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.black.withOpacity(0.3),
                              child: Icon(Icons.play_arrow_sharp,color: Colors.white,size: 20,),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text("New Coming",style: TextStyles.RegulerOrrange,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text("Easy Backbend",style: TextStyles.BodyBlack,),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,top: 20,bottom: 15),
              child: Row(
                children: [
                  Text("RECORD",style: TextStyles.TitleBlack,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,bottom: 15),
              child: Container(
                width: _width-30,
                height: 110,
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.2),
                  borderRadius: borderRadious.primeryRadious,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10,bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.access_time,color: Colors.orange[700],size: 20,),
                          Text("20",style: TextStyles.HeadingOrange,),
                          Text("Minutes",style: TextStyles.ParaOrange,),

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10,bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.wb_sunny_outlined,color: Colors.orange[700],size: 20,),
                          Text("6",style: TextStyles.HeadingOrange,),
                          Text("Days",style: TextStyles.ParaOrange,),

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10,bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.anchor_rounded,color: Colors.orange[700],size: 20,),
                          Text("1",style: TextStyles.HeadingOrange,),
                          Text("Streak",style: TextStyles.ParaOrange,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("CATEGORY",style: TextStyles.TitleBlack,),
                  GestureDetector(
                      onTap: (){
                        Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: YogaCategoryViewAll()));
                      },
                      child: Text("View all",style: TextStyles.BodyBlack,)),
                ],
              ),
            ),
            Container(
              height: 220,
              child: GridView.count(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 15),
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 10,
                childAspectRatio: 0.8/1.2,
                children: List.generate(10, (index) => GestureDetector(
                  onTap: (){
                    (index == 0 ) ? Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: YogaCategoryDetailPagePremium(
                      isPremium: false,
                    ))) : Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: YogaCategoryDetailPagePremium(
                      isPremium: true,
                    )));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/yoga/yoga-model01.png"),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: borderRadious.primeryRadious,
                          ),
                          child: Center(
                            child: Text("Health Care",style: TextStyles.HeadingWhite,),
                          ),
                        ),
                        (index == 0 ) ? SizedBox() :  Positioned(
                            top: -7,
                            right: -7,
                            child: Image.asset("assets/yoga/premium-quality.png",height: 25,fit: BoxFit.contain,)),
                      ],
                    ),
                  ),
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("LEG STRENGTH",style: TextStyles.TitleBlack,),
                  Text("View all",style: TextStyles.BodyBlack,),
                ],
              ),
            ),
            Container(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index){
                  return Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 90,
                          width: 160,
                          decoration: BoxDecoration(
                              borderRadius: borderRadious.primeryRadious,
                              image: DecorationImage(
                                image: AssetImage("assets/yoga/yoga-model01.png"),
                                fit: BoxFit.cover,
                              )
                          ),
                          child: Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.black.withOpacity(0.3),
                                  child: Icon(Icons.play_arrow_sharp,color: Colors.white,size: 20,),
                                ),
                              )
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0,bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: (_width-215),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Flexible(child: Text("Ashtanga Primary Series",style: TextStyles.ParaBoldBlack,)),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Opacity(
                                  opacity: 0.6,
                                  child: Text("9 Workouts",style: TextStyles.BodyBlack,)),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,top: 20,bottom: 15),
              child: Container(
                  height: 200,
                  width: _width-30,
                  decoration: BoxDecoration(
                      borderRadius: borderRadious.primeryRadious,
                      image: DecorationImage(
                        image: AssetImage("assets/yoga/yoga-model01.png"),
                        fit: BoxFit.cover,
                      )
                  ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,bottom: 15),
              child: Container(
                  height: 50,
                  width: _width-30,
                  decoration: BoxDecoration(
                      borderRadius: borderRadious.primeryRadious,
                      color: Colors.orange[600]
                  ),
                child: Center(child: Text("Unlock",style:TextStyles.HeadingWhite,)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,top: 15,bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("RECENT",style: TextStyles.TitleBlack,),
                  Text("View all",style: TextStyles.BodyBlack,),
                ],
              ),
            ),
            Container(
              height: 120,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index){
                  return Padding(
                    padding: EdgeInsets.only(right: 15,left: (index==0) ? 15 : 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 90,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: borderRadious.primeryRadious,
                              image: DecorationImage(
                                image: AssetImage("assets/yoga/yoga-model01.png"),
                                fit: BoxFit.cover,
                              )
                          ),
                          child: Center(
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.black.withOpacity(0.3),
                              child: Icon(Icons.play_arrow_sharp,color: Colors.white,size: 20,),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text("New Coming",style: TextStyles.ParaBlack,),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,top: 15,bottom: 15),
              child: Row(
                children: [
                  Text("YOU MAY LIKE",style: TextStyles.TitleBlack,),
                ],
              ),
            ),
            Container(
              height: 205,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index){
                  return Padding(
                    padding: EdgeInsets.only(right: 15,left: (index==0) ? 15 : 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 150,
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: borderRadious.primeryRadious,
                              image: DecorationImage(
                                image: AssetImage("assets/yoga/yoga-model01.png"),
                                fit: BoxFit.cover,
                              )
                          ),
                          child:Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("FREE COLLECTION\nFOR YOU",style: TextStyles.HeadingWhite,),
                            ),
                          )
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text("New Coming",style: TextStyles.RegulerBlack,),
                        ),
                      ],
                    ),
                  );
                },
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
}
