import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';

class TextFieldOne extends StatefulWidget {
  final String hint;
  final Function onChanged;

  TextFieldOne({this.hint, this.onChanged});
  @override
  _TextFieldOneState createState() => _TextFieldOneState();
}

class _TextFieldOneState extends State<TextFieldOne> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      autofocus: false,
      style: TextStyles.BodyBlack,
      cursorColor: ColorPalette.PrimaryColor,
      decoration: InputDecoration(
          isDense: false,
          hintText: widget.hint,
          hintStyle: TextStyles.BodyBlack,
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(5.0),
            ),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          fillColor: ColorPalette.GreyLightest,
          contentPadding: EdgeInsets.only(top: 12,right: 10,left: 10,bottom: 12)
      ),
    );
  }
}
