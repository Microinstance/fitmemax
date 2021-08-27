import 'package:fitmemax/Objects/TextFieldOne.dart';
import 'package:fitmemax/src/module/dashboard/FeedBack.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class CorporatePlan extends StatefulWidget {
  @override
  _CorporatePlanState createState() => _CorporatePlanState();
}

class _CorporatePlanState extends State<CorporatePlan> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView(
            children: [
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset("assets/blog/blog1.png",fit: BoxFit.cover,height: 200,width: _width,),
                          Container(
                            height: 200,width: _width,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black.withOpacity(0.5),
                                  Colors.black.withOpacity(0.2),
                                ]
                              )
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text("Fitmemax\nCorporate Plan",style: TextStyles.TitleWhite,),
                      ),
                    ],
                  ),
                  SafeArea(child: Padding(
                    padding: const EdgeInsets.only(top: 15,left: 5),
                    child: IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back,size: 20,color: Colors.white,),
                    ),
                  ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15,top: 15,right: 15),
                child: Row(
                  children: [
                    Image.asset("assets/logo/logo-transparent_black.png",height: 35,fit: BoxFit.cover,),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '  |  ',
                            style: TextStyles.TitlePrimery,
                          ),
                          TextSpan(
                            text: 'Corporate Wellness',
                            style: TextStyles.TitlePrimery,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15,top: 15,right: 15),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                        style: TextStyles.ParaBlack,
                      ),
                      TextSpan(
                        text: '\nFor more Information Visit',
                        style: TextStyles.TitleBlack,
                      ),
                      TextSpan(
                        text: '\nfitmemax.com/plan',
                        style: TextStyles.TitlePrimery,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20,top: 15),
                child: TextFieldOne(
                  hint: 'Enter your corporate email id ?',
                  onChanged: (v) {
                    print(v);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20,top: 15),
                child: TextFieldOne(
                  hint: 'Your contact number ?',
                  onChanged: (v) {
                    print(v);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20,top: 15),
                child: TextFieldOne(
                  hint: 'Number of employees?',
                  onChanged: (v) {
                    print(v);
                  },
                ),
              ),
            ],
            ),
          ),
          SizedBox(
              width: _width,
              child: MaterialButton(
                  height: 50,
                  onPressed: (){
                    // Navigator.push(
                    //     context,
                    //     PageTransition(
                    //         type: PageTransitionType.fade,
                    //         child: CorporatePlanDetailPage()));
                  },
                color: ColorPalette.PrimaryColor,
                child: Text("Submit",style: TextStyles.TitleWhite,),
              )),
        ],
      ),
    );
  }
}
