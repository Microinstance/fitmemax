import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';

class ButtonOne extends StatefulWidget {
  final String title;
  final Function onPressed;
  final Color colors;

  ButtonOne({this.title, this.onPressed,this.colors});
  @override
  _ButtonOneState createState() => _ButtonOneState();
}

class _ButtonOneState extends State<ButtonOne> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 40,
      elevation: 0,
      splashColor: widget.colors.withOpacity(0.2),
      shape: RoundedRectangleBorder(
          borderRadius: borderRadious.primeryRadious),
      onPressed: widget.onPressed,
      color: widget.colors,
      child: Padding(
        padding: const EdgeInsets.only(top: 10,bottom: 10,left: 30,right: 30),
        child: Text(
          widget.title,
          style: TextStyles.TitleWhite,
        ),
      ),
    );
  }
}
