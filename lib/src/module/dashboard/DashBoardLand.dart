import 'package:fitmemax/src/module/dashboard/Dashboard.dart';
import 'package:fitmemax/src/module/dashboard/PopUp.dart';
import 'package:flutter/material.dart';

class DashBoardLand extends StatefulWidget {
  @override
  _DashBoardLandState createState() => _DashBoardLandState();
}

class _DashBoardLandState extends State<DashBoardLand> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Dashboard(),
        PopUp(),
      ],
    );
  }
}
