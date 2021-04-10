import 'package:fitmemax/src/module/Authentication/SigninPage.dart';
import 'package:fitmemax/src/module/Run/Run.dart';
import 'package:fitmemax/src/module/Run/RunDetails.dart';
import 'package:fitmemax/src/module/dashboard/Dashboard.dart';
import 'package:fitmemax/src/module/dashboard/profile/Profile.dart';
import 'package:fitmemax/src/module/dashboard/profile/ProfileHome.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return SigninPage();
  }
}
