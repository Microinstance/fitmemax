import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';

class w_textfield extends StatelessWidget {
  final String hint;
  final String lable;
  final Function onChanged;
  final TextInputType textInputType;

  w_textfield({this.hint, this.lable, this.onChanged, this.textInputType});

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return TextField(
      onChanged: onChanged,
      autofocus: false,
      keyboardType: textInputType,
      cursorColor: Palette.primaryColor,
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w300,
        letterSpacing: 0.5,
      ),
      decoration: InputDecoration(
        // labelText: lable,
        labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w300, letterSpacing: 0.5),
        contentPadding: EdgeInsets.only(left: _width * 0.02, top: 15, bottom: 10, right: _width * 0.039),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Palette.primaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
        focusColor: Palette.primaryColor,
        hoverColor: Palette.primaryColor,
      ),
    );
  }
}
