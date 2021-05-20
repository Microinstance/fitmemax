import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';
import 'LandingPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus.unfocus();
        }
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
