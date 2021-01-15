import 'package:fitmemax/src/module/BattleGround/BattleGroundHome.dart';
import 'package:fitmemax/src/module/BattleGround/BattleGroundLoading.dart';
import 'package:fitmemax/src/module/dashboard/Dashboard.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Dashboard();
  }
}
