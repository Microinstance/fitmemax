import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';

class w_signin_button extends StatelessWidget {

  final String title;
  final Function onPressed;

  const w_signin_button({ this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return MaterialButton(
      height: 50,
      minWidth: _width *0.65,
      splashColor: Colors.green[200],
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)),
      onPressed: onPressed,
      color: Palette.primaryColor,
      child: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            fontSize: 20,
            color: Colors.white),
      ),
    );
  }
}
