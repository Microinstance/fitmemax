import 'package:fitmemax/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'YogaFilterOne.dart';


class YogaCategoryDetailPagePremium extends StatefulWidget {

  final bool  isPremium;
  const YogaCategoryDetailPagePremium({this.isPremium =  true});

  @override
  _YogaCategoryDetailPagePremiumState createState() => _YogaCategoryDetailPagePremiumState();
}

class _YogaCategoryDetailPagePremiumState extends State<YogaCategoryDetailPagePremium> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: _height*0.5,
                    child: Stack(
                      children: [
                        Container(
                          height: _height*0.6,
                          width: _width,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/yoga/yoga-model02.png"),
                              fit: BoxFit.cover
                            )
                          ),
                        ),
                        SizedBox(
                          height: _height*0.6,
                          width: _width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Text("FRONT SPLITS\nCHALLENGE",style: TextStyles.DisplayWhite,textAlign: TextAlign.center,),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Text("202 kcl/5 Workouts/Level 4",style: TextStyles.BodyWhite,),
                              ),
                              widget.isPremium?  Padding(
                                padding: const EdgeInsets.only(left: 30,right: 30,bottom:20, ),
                                child: Container(
                                  height: 50,
                                  width: _width-60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.5),
                                    color: Colors.deepPurpleAccent,
                                  ),
                                  child: Center(child: Text("Go Premium",style: TextStyles.BodyWhite,)),
                                ),
                              ) : SizedBox(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: SafeArea(
                      child: IconButton(
                        icon: Icon(Icons.arrow_back,color: CupertinoColors.white,size: 20,),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: SafeArea(
                      child: IconButton(
                        icon: Icon(
                          Icons.view_headline_rounded,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (BuildContext context) {
                              return YogaFilterOne();
                            },
                            isScrollControlled: true,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,top: 20,bottom: 20,right: 20),
                child: Row(
                  children: [
                    Text("SESSIONS",style: TextStyles.TitleBlack,),
                  ],
                ),
              ),
              Container(
                child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: ListView.builder(
                    itemCount: 10,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index){
                      return Padding(
                        padding: const EdgeInsets.only(right: 20,left: 20,bottom: 20),
                        child: Row(
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Container(
                                  height: 100,
                                  width: _width*0.4,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.5),
                                    image: DecorationImage(
                                      image: AssetImage("assets/yoga/yoga-model01.png"),
                                      fit: BoxFit.cover,
                                    )
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                      radius: 12,
                                      backgroundColor: Colors.black.withOpacity(0.4),
                                      child: Icon(Icons.play_arrow_sharp,color: Colors.white,size: 20,)),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Opacity(
                                    opacity:0.5,
                                    child: Text("01",style: TextStyles.BodyBlack,)),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Hamstring Stretch",style: TextStyles.RegulerBoldBlack,),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("18 min/51 kcl/Level 2",style: TextStyles.BodyBlack,),
                              ],
                            )

                          ],
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
