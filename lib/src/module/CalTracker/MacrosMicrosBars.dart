import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MacrosMicrosBars extends StatefulWidget {
  final String titel;
  final double percent;
  final String id;

  const MacrosMicrosBars({this.titel, this.percent, this.id});
  @override
  _MacrosMicrosBarsState createState() => _MacrosMicrosBarsState();
}

class _MacrosMicrosBarsState extends State<MacrosMicrosBars> {


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
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.titel,  style: GoogleFonts.lato(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("250 /1000mg",  style: GoogleFonts.lato(fontWeight: FontWeight.w500, fontSize: 12, color: Colors.black.withOpacity(0.7)),),
                  ],
                )
              ],
            ),
          ),
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                height: 10,
                width: _width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[200],
                ),
              ),
              Container(
                height: 10,
                width: (_width-30)*widget.percent,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: _get(id:widget.id ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
