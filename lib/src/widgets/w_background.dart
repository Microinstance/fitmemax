import 'package:flutter/material.dart';

class w_background extends StatelessWidget {
  final Widget child;
  w_background({this.child});
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Stack(
        children: [
          Container(
            width: _width,
            child: Image.asset('assets/background/signin_up.png',fit: BoxFit.fitWidth,),
          ),
          child,
        ],
      ),
    );
  }
}
