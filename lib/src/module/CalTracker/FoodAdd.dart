import 'package:fitmemax/src/ListData/ListData.dart';
import 'package:fitmemax/src/module/CalTracker/SearchFood.dart';
import 'package:fitmemax/src/widgets/CartItemNumber.dart';
import 'package:fitmemax/src/widgets/loginButtonTwo.dart';
import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import 'MacrosMicrosBars.dart';

class FoodAdd extends StatefulWidget {
  @override
  _FoodAddState createState() => _FoodAddState();
}

class _FoodAddState extends State<FoodAdd> {
  @override
  Widget build(BuildContext context) {

    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: SearchFood()));
        },
        backgroundColor: Palette.primaryColor,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 25,
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Palette.primaryColor,
        title: Text(
          "Lunch",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
        ),
      ),
      body: ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding:
                const EdgeInsets.only(right: 15, left: 15, top: 10, bottom: 10),
            child: Container(
              width: _width,
              decoration: BoxDecoration(
                color: Palette.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5,top: 3),
                      child: Row(
                        children: [
                          Flexible(
                              child: Text(
                            "Chicken Shawarma Roll",
                            style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                letterSpacing: 1),
                          )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5,top: 5,bottom: 5),
                      child: Row(
                        children: [
                          Flexible(
                              child: Text(
                            "100gm per serving",
                            style: GoogleFonts.roboto(
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 12,
                                letterSpacing: 1),
                          )),
                        ],
                      ),
                    ),
                    FoodAddMicrosMacros(),
                    // Padding(
                    //   padding: const EdgeInsets.only(bottom: 5,top: 20),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Row(
                    //         children: [
                    //           CircleAvatar(
                    //             backgroundColor: Palette.primaryColor.withOpacity(0.15),
                    //             radius: 18,
                    //             child: Icon(
                    //               Icons.accessibility,
                    //               color: Palette.primaryColor,
                    //               size: 23,
                    //             ),
                    //           ),
                    //           SizedBox(
                    //             width: 10,
                    //           ),
                    //           Text(
                    //             "Macros & Micros",
                    //             style: GoogleFonts.lato(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                    //           ),
                    //         ],
                    //       ),
                    //       IconButton(icon: isShow ? Icon(Icons.keyboard_arrow_down,size: 20,color: Colors.black,) : Icon(Icons.keyboard_arrow_up,size: 20,color: Colors.black,), onPressed: (){
                    //         setState(() {
                    //           if(isShow == true){
                    //             isShow = false;
                    //           }else{
                    //             isShow = true;
                    //           }
                    //         });
                    //       })
                    //     ],
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 15,right: 5,left: 5),
                    //   child: ListView.builder(
                    //       physics: NeverScrollableScrollPhysics(),
                    //       shrinkWrap: true,
                    //       itemCount: Data().Nutrition.length,
                    //       itemBuilder: (BuildContext context, int index){
                    //         return MacrosMicrosBars(
                    //           id: Data().Nutrition[index]['titel'],
                    //           percent: double.parse(Data().Nutrition[index]['percentage']),
                    //           titel: Data().Nutrition[index]['titel'],
                    //         );
                    //       }
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 7, left: 5, right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: loginButtonTwo(
                              title: "Remove",
                              onPressed: () {},
                              colors: Colors.red,
                            ),
                          ),
                          CartItemNumber(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class FoodAddMicrosMacros extends StatefulWidget {
  @override
  _FoodAddMicrosMacrosState createState() => _FoodAddMicrosMacrosState();
}

class _FoodAddMicrosMacrosState extends State<FoodAddMicrosMacros> {
  bool isShow = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5,top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Palette.primaryColor.withOpacity(0.15),
                    radius: 18,
                    child: Icon(
                      Icons.accessibility,
                      color: Palette.primaryColor,
                      size: 23,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Macros & Micros",
                    style: GoogleFonts.lato(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
              IconButton(icon: isShow ? Icon(Icons.keyboard_arrow_down,size: 20,color: Colors.black,) : Icon(Icons.keyboard_arrow_up,size: 20,color: Colors.black,), onPressed: (){
                if(isShow == true){
                  setState(() {
                    isShow = false;
                  });
                } else{
                  setState(() {
                    isShow = true;
                  });
                }
              })
            ],
          ),
        ),
        isShow ? Padding(
          padding: const EdgeInsets.only(top: 15,right: 5,left: 5),
          child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: Data().Nutrition.length,
              itemBuilder: (BuildContext context, int index){
                return MacrosMicrosBars(
                  id: Data().Nutrition[index]['titel'],
                  percent: double.parse(Data().Nutrition[index]['percentage']),
                  titel: Data().Nutrition[index]['titel'],
                );
              }
          ),
        ) : SizedBox(),
      ],
    );
  }
}
