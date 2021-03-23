import 'package:fitmemax/src/ListData/ListData.dart';
import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'MacrosMicrosBars.dart';

class MacrosMicros extends StatefulWidget {
  @override
  _MacrosMicrosState createState() => _MacrosMicrosState();
}

class _MacrosMicrosState extends State<MacrosMicros> {

  Color _get({String id}) {
    if (id == 'Fiber') {
      return Colors.orangeAccent;
    } else if (id == 'Sugar') {
      return Colors.black45;
    } else if (id == 'Sodium') {
      return Colors.lightBlueAccent;
    } else if (id == 'Potassium') {
      return Colors.deepPurple;
    } else if (id == 'Protein') {
      return Colors.red;
    } else if (id == 'Fat') {
      return Colors.yellow;
    } else if (id == 'Carbs') {
      return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
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
              ],
            ),
          ),
          SizedBox(height: 10,),
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
          )
        ],
      ),
    );
  }
}
