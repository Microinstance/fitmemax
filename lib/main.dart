import 'package:fitmemax/src/module/Authentication/SigninPage.dart';
import 'package:fitmemax/src/module/BattleGround/SquadManagement/squad_management.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';
import 'LandingPage.dart';
import 'src/module/BattleGround/BattleGroundSpin.dart';
import 'src/module/BattleGround/MyClub/MyClub.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // FocusScopeNode currentFocus = FocusScope.of(context);
        // if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
        //   FocusManager.instance.primaryFocus.unfocus();
        // }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FitMeMax',
        theme: ThemeData(
          primaryColor : ColorPalette.PrimaryColor,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Lato',
        ),
        home: LandingPage(),
      ),
    );
  }
}
