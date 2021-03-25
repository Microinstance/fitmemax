import 'package:fitmemax/Objects/ButtonOne.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';


class CoachDetailPage extends StatefulWidget {
  @override
  _CoachDetailPageState createState() => _CoachDetailPageState();
}

class _CoachDetailPageState extends State<CoachDetailPage> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/coachs/coach1.png"),
                        fit: BoxFit.fitHeight,
                      ),
                      color: ColorPalette.GreyLightest,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(7.5),
                          bottomLeft: Radius.circular(7.5))),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              "Shweta Dube",
                              style: TextStyles.TitleBlack,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              "Your Premium Fitness Coach",
                              style: TextStyles.RegulerPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                 Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
                    child: Row(
                      children: [
                        Icon(Icons.language,size: 20,),
                        SizedBox(
                          width: 7,
                        ),
                        SizedBox(
                          width: _width - (10+30+20),
                          child: Wrap(
                            children: [
                              Text("Speaks : ",style: TextStyles.BodyBlack,),
                               ...List.generate(3, (index) => Padding(
                                 padding: const EdgeInsets.only(left: 5),
                                 child: Text("English",style: TextStyles.BodyBlack,),
                               ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
                    child: Row(
                      children: [
                        Icon(Icons.work_rounded,size: 20,),
                        SizedBox(
                          width: 7,
                        ),
                        Text("Work : ",style: TextStyles.BodyBlack,),
                        Text("10:00am - 07:00pm",style:TextStyles.BodyBlack,),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
                    child:
                    Text("Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word",style: TextStyles.BodyGrey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
                    child: Row(
                      children: [
                        Icon(Icons.wb_incandescent,size: 20,),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Specialization : ",style: TextStyles.BodyBlack,),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
                      child: Wrap(
                        children: [
                        ...List.generate(3, (index) =>   Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: ColorPalette.GreyLightest,
                                child: Center(
                                  child: Icon(
                                    Icons.wine_bar,color: ColorPalette.Pink,size: 20,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5,bottom: 5),
                                child: Text("Stemina",style: TextStyles.BodyBlack),
                              ),
                            ],
                          ),
                        ),)
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
                    child: Row(
                      children: [
                        Icon(Icons.equalizer,size: 25,),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Qualification : ",style: TextStyles.BodyBlack),
                      ],
                    ),
                  ),
                  Column(
                    children: List.generate(3, (index) => Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 7,right: 15),
                            child: CircleAvatar(
                              radius: 3,
                              backgroundColor: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: _width -(30+25),
                            child: Wrap(
                              children: [
                                Text("Contrary to popul ratur a Latin professor at Hampden-Sydney College in Virgin",
                                  style: TextStyles.BodyBlack,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                  ),
                SizedBox(
                  height: 150,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: ButtonOne(
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     PageTransition(
                    //         type: PageTransitionType.fade,
                    //         child: CoachCurrent()));
                  },
                  colors: ColorPalette.PrimaryColor,
                  title: "Select Coach",
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, top: 5),
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    backgroundColor: Colors.white,
                    elevation: 1,
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
