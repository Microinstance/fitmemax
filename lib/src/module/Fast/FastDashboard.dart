import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Fast.dart';
import 'FastSettings.dart';
import 'FastStatistic.dart';

class FastDashboard extends StatefulWidget {
  @override
  _FastDashboardState createState() => _FastDashboardState();
}

class _FastDashboardState extends State<FastDashboard> {
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
        controller: _pageController,
        onPageChanged: (page) {
          setState(() {
            currentIndex = page;
          });
        },
        children: <Widget>[
         Fast(),
         FastStatistic(),
         FastSettings(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        iconSize: 30,
        selectedFontSize: 18,
        showUnselectedLabels: false,
        selectedLabelStyle: GoogleFonts.lato(fontSize: 16,),
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.4),
        currentIndex: currentIndex,
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
            label: 'Fast',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.insights_rounded),
            backgroundColor: Colors.black,
              label: 'Statistic'
          ),
          BottomNavigationBarItem(
               icon: Icon(Icons.insert_chart_outlined_rounded),
               backgroundColor: Colors.black,
               label: 'Settings'
          ),
        ],
      ),
    );
  }
}

