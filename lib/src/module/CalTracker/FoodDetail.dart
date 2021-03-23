import 'package:fitmemax/src/ListData/ListData.dart';
import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'MacrosMicrosBars.dart';

class FoodDetail extends StatefulWidget {
  @override
  _FoodDetailState createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
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
                     image: AssetImage("assets/calori/chicken.png"),
                     fit: BoxFit.cover,
                   ),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))
                  ),
                ),
               Padding(
                 padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
                 child: Column(
                   children: [
                     Padding(
                       padding: const EdgeInsets.only(left: 0,top: 3),
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
                       padding: const EdgeInsets.only(left: 0,top: 5,bottom: 5),
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
                     ListView.builder(
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
                   ],
                 ),

               ),
                SizedBox(
                  height: 100,
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
