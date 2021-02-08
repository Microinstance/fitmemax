import 'package:fitmemax/src/module/Workout/Workout.dart';
import 'package:fitmemax/src/module/Workout/WorkoutDetailPage.dart';
import 'package:fitmemax/src/module/Workout/WorkoutExersizePage.dart';
import 'package:fitmemax/src/module/dashboard/Dashboard.dart';
import 'package:fitmemax/src/module/signin_signup/SignupPage.dart';
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