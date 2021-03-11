import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class CartItemNumber2 extends StatefulWidget {
  double initial;
  final String unit;

  CartItemNumber2({this.initial = 5, this.unit = 'ft'});
  @override
  _CartItemNumber2State createState() => _CartItemNumber2State();
}

class _CartItemNumber2State extends State<CartItemNumber2> {
  // double _itemNumber = widget.initial ;
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    msg: "Minimum Order Quantity 1",
                  );
                  print(widget.initial);
                }
              });
            },
            child: CircleAvatar(
                radius: 10,
                backgroundColor: Palette.primaryColor,
                child: Icon(Icons.remove,color: Colors.white,size: 16,))),
        Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: Text("${widget.initial.toStringAsFixed(2)} ${widget.unit}",style: GoogleFonts.lato(fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold),),
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
            child: CircleAvatar(
                radius: 10,
                backgroundColor: Palette.primaryColor,
                child: Icon(Icons.add,color: Colors.white,size: 16,))),
      ],
    );
  }
}
