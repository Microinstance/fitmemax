import 'package:fitmemax/src/module/ActivityTracker/ActivityTracker.dart';
import 'package:fitmemax/src/module/HealthLog/HealthLog.dart';
import 'package:fitmemax/src/module/Run/Run.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}
class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return ActivityTracker();
  }
}
