import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class CartItemNumber extends StatefulWidget {
  @override
  _CartItemNumberState createState() => _CartItemNumberState();
}

class _CartItemNumberState extends State<CartItemNumber> {
  int _itemNumber = 1 ;
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Container(
        height: 40,
        width: 120,
        decoration: BoxDecoration(
          color: Palette.primaryColor.withOpacity(0.8),
          borderRadius: BorderRadius.circular(7.5),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: (){
                    setState(() {
                      if(_itemNumber >  1){
                        _itemNumber = (_itemNumber - 1);
                        print(_itemNumber);
                      }
                      else{
                        Fluttertoast.showToast(
                          msg: "Minimum Order Quantity 1",
                        );
                        print(_itemNumber);
                      }
                    });
                  },
                  child: Icon(Icons.remove,color: Colors.white,size: 16,)),
              Text(_itemNumber.toString(),style: GoogleFonts.lato(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
              GestureDetector(
                  onTap: (){
                    setState(() {
                      if(_itemNumber >=  1){
                        _itemNumber = (_itemNumber + 1);
                        print(_itemNumber);
                      }
                      else{
                        Fluttertoast.showToast(
                          msg: "Minimum Order Quantity 1",
                        );
                      }
                    });
                  },
                  child: Icon(Icons.add,color: Colors.white,size: 20,)),
            ],
          ),
        ),
      ),
    );
  }
}