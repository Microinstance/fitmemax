import 'package:fitmemax/src/module/ActivityTracker/ActivityCalBurnt.dart';
import 'package:fitmemax/src/module/ActivityTracker/ActivityTracker.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}
class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return ActivityCalBurnt();
  }
}
