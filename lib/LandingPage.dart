import 'package:fitmemax/src/module/signin_signup/SigninPage.dart';
import 'package:flutter/material.dart';
import 'package:fitmemax/shared/shared.dart';
import 'package:page_transition/src/page_transition.dart';
import 'package:page_transition/src/enum.dart';
import 'package:fitmemax/src/module/dashboard/Dashboard.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool isSetLoginRout = false;

  @override
  void initState() {
    super.initState();
    checkToken();
  }

  checkToken() async {
    String token = await MySharedPreferences().gettoken();
    if (token != null && token != "") {
      Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.fade,
          child: Dashboard(),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.fade,
          child: SigninPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(),
    );
  }
}
