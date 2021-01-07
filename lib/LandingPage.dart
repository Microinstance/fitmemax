import 'package:fitmemax/src/module/dashboard/Dashboard.dart';
import 'package:fitmemax/src/module/signin_signup/SigninPage.dart';
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
