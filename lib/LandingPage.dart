import 'package:fitmemax/src/module/BattleGround/BattleGroundGroup/BattleGroundGroup.dart';
import 'package:fitmemax/src/module/BattleGround/BattleGroundSolo/BattleGroundSolo.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}
class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return BattleGroundGroup();
  }
}
