import 'package:fitmemax/src/data/data2.dart';
import 'package:fitmemax/src/module/CalTracker/SearchFood.dart';
import 'package:fitmemax/src/widgets/CartItemNumber.dart';
import 'package:fitmemax/src/widgets/loginButtonTwo.dart';
import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class FoodAdd extends StatefulWidget {
  @override
  _FoodAddState createState() => _FoodAddState();
}

class _FoodAddState extends State<FoodAdd> {
  Color _get({String id}){
    if(id == 'Fiber'){
      return Colors.orangeAccent;
    } else if(id == 'Sugar'){
      return Colors.black45;
    }else if(id == 'Sodium'){
      return Colors.lightBlueAccent;
    }else if(id == 'Potassium'){
      return Colors.deepPurple;
    }
  }
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
                    Padding(
                      padding: const EdgeInsets.only(top: 10,bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.red[400],
                                    radius: 9,
                                  ),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  Text(
                                    "Protein",
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              SizedBox(height: 3,),
                              Text("1.85gm",style: GoogleFonts.roboto(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.yellow,
                                    radius: 9,
                                  ),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  Text(
                                    "Fat",
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              SizedBox(height: 3,),
                              Text("1.85gm",style: GoogleFonts.roboto(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.green,
                                    radius: 9,
                                  ),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  Text(
                                    "Carbs",
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              SizedBox(height: 3,),
                              Text("1.85gm",style: GoogleFonts.roboto(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10,),
                      child: Container(
                        child: GridView.count(
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 4,
                          shrinkWrap: true,
                          childAspectRatio: 1/0.4,
                          children: List.generate(Data().Micros.length, (index) =>
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 5,
                                          backgroundColor: _get(id:   Data().Micros[index]),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          Data().Micros[index],
                                          style: GoogleFonts.lato(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 3,),
                                    Row(
                                      children: [
                                        Text("1.85gm",style: GoogleFonts.roboto(fontSize: 12,color: Colors.black,fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20, bottom: 10, left: 5, right: 5),
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
