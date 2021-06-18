import 'package:fitmemax/src/module/BattleGround/BattleGround.dart';
import 'package:fitmemax/src/module/BattleGround/BattleGroundCash.dart';
import 'package:fitmemax/src/module/BattleGround/BattleGroundCoins.dart';
import 'package:fitmemax/src/module/BattleGround/BattleGroundFriends.dart';
import 'package:fitmemax/src/module/BattleGround/BattleGroundLeaderBoard.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}
class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return BattleGround();
  }
}
