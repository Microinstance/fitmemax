import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';

class Backgrounds extends StatefulWidget {
  final Widget child;
  Backgrounds({this.child});
  @override
  _BackgroundsState createState() => _BackgroundsState();
}

class _BackgroundsState extends State<Backgrounds> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorPalette.GreyLightest,
      body: Stack(
        children: [
          Container(
            width: _width,
            child: Image.asset('assets/background/signin_up.png',fit: BoxFit.fitWidth,color: ColorPalette.PrimaryColor,),
          ),
          widget.child,
        ],
      ),
    );
  }
}
