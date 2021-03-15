import 'package:fitmemax/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class IncrementDecrement extends StatefulWidget {
  double initial;
  final String unit;

  IncrementDecrement({this.initial = 5, this.unit = 'ft'});
  @override
  _IncrementDecrementState createState() => _IncrementDecrementState();
}

class _IncrementDecrementState extends State<IncrementDecrement> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
            onTap: (){
              setState(() {
                if(widget.initial >  1){
                  widget.initial = (widget.initial - 0.05);
                  print(widget.initial);
                }
                else{
                  Fluttertoast.showToast(
                    msg: "Minimum Weight",
                  );
                  print(widget.initial);
                }
              });
            },
            child: Icon(Icons.remove,color: Color(0xFFffbb92),size: 25,)),
        Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Text("${widget.initial.toStringAsFixed(2)} ${widget.unit}",style: GoogleFonts.lato(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
        ),
        GestureDetector(
            onTap: (){
              setState(() {
                if(widget.initial >=  1){
                  widget.initial = (widget.initial + 0.05);
                  print(widget.initial);
                }
                else{
                  Fluttertoast.showToast(
                    msg: "Minimum Order Quantity 1",
                  );
                }
              });
            },
            child: Icon(Icons.add,color: Color(0xFFff7171),size: 16,)),
      ],
    );
  }
}
