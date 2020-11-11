import 'package:flutter/material.dart';
import 'LandingPage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FitMeMax',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Raleway',
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('es'),
        const Locale('en'),
      ],
      home: LandingPage(),
    );
  }
}
