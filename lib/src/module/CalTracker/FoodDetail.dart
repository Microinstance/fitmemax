import 'package:fitmemax/src/data/data2.dart';
import 'package:fitmemax/src/widgets/CartItemNumber.dart';
import 'package:fitmemax/src/widgets/loginButtonTwo.dart';
import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodDetail extends StatefulWidget {
  @override
  _FoodDetailState createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
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
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(right: 15, left: 15, top: 15, bottom: 10),
                  child: Column(
                    children: [
                      Row(
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
                        padding: const EdgeInsets.only(top: 10,bottom: 0),
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
                        padding: const EdgeInsets.only(top: 0,),
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
                    ],
                  ),
                ),
              ],
            ),
          ),
          SafeArea(child: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: IconButton(icon: Icon(Icons.arrow_back_outlined,size: 20,color: Colors.black,), onPressed: (){
              Navigator.pop(context);
            }),
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: MaterialButton(
                  onPressed: (){},
                  height: 50,
                  color: Palette.primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10,top: 10),
                    child: Text("Add Food",style: GoogleFonts.lato(fontSize: 18,color:Colors.white,fontWeight: FontWeight.bold ),),
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
