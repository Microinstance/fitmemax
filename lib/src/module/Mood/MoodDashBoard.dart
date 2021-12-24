import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Mood.dart';
import 'MoodArticle.dart';

class MoodDashBoard extends StatefulWidget {
  @override
  _MoodDashBoardState createState() => _MoodDashBoardState();
}

class _MoodDashBoardState extends State<MoodDashBoard> {
  PageController _pageController = PageController(
    initialPage: 0,
  );
  int currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF1f1e23),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (page) {
          setState(() {
            currentIndex = page;
          });
        },
        children: <Widget>[
          Mood(),
          MoodArticle(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        iconSize: 30,
        selectedFontSize: 18,
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyles.RegulerBlack,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.withOpacity(0.8),
        currentIndex: currentIndex,
        selectedIconTheme: IconThemeData(opacity: 0.0, size: 0),
        unselectedIconTheme: IconThemeData(opacity: 0.0, size: 0),
        onTap: (value) {
          currentIndex = value;
          _pageController.animateToPage(
            value,
            duration: Duration(milliseconds: 300),
            curve: Curves.linear,
          );
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time_rounded),
            backgroundColor: Colors.black,
            label: 'Hoom',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.insights_rounded),
              backgroundColor: Colors.black,
              label: 'Articles'
          ),
        ],
      ),
    );
  }
}
