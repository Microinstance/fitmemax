import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';

class PasswordFieldOne extends StatefulWidget {
  final String hint;
  final Function onChanged;

  PasswordFieldOne({this.hint,this.onChanged});
  @override
  _PasswordFieldOneState createState() => _PasswordFieldOneState();
}

class _PasswordFieldOneState extends State<PasswordFieldOne> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: _width-60,
      child: TextField(
        onChanged: widget.onChanged,
        autofocus: false,
        obscureText: _obscureText ? true : false,
        style: TextStyles.BodyBlack,
        cursorColor: ColorPalette.PrimaryColor,
        decoration: InputDecoration(
            isDense: true,
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
            suffixIcon: GestureDetector(
                onTap: (){
                  setState(() {
                    _obscureText ? _obscureText = false : _obscureText = true;
                  });
                },
                child: Icon(Icons.remove_red_eye,color: ColorPalette.Grey,size: 20,)),
            filled: true,
            fillColor: ColorPalette.GreyLightest,
            contentPadding: EdgeInsets.only(top: 0,right: 10,left: 10,bottom: 0)
        ),
      ),
    );
  }
}
