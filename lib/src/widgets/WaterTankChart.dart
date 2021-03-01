import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waveprogressbar_flutter/waveprogressbar_flutter.dart';

class WaterTankChart extends StatefulWidget {
  @override
  _WaterTankChartState createState() => _WaterTankChartState();
}

class _WaterTankChartState extends State<WaterTankChart> {
  double waterHeight = 1;
  WaterController waterController = WaterController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding widgetsBinding = WidgetsBinding.instance;
    widgetsBinding.addPostFrameCallback((callback) {
      waterController.changeWaterHeight(0.62);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Palette.primaryColor.withOpacity(0.15),
                radius: 18,
                child: Icon(
                  Icons.accessibility,
                  color: Palette.primaryColor,
                  size: 23,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Water Tank",
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 30.0),
                child: Center(
                  child: WaveProgressBar(
                    strokeCircleColor: Colors.blue,
                    flowSpeed: 1.0,
                    waveDistance: 25.0,
                    waterColor: Colors.blue,
                    heightController: waterController,
                    percentage: waterHeight,
                    size: Size(100, 100),
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
