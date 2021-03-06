import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waveprogressbar_flutter/waveprogressbar_flutter.dart';

class WaterTankChart extends StatefulWidget {
  @override
  _WaterTankChartState createState() => _WaterTankChartState();
}

class _WaterTankChartState extends State<WaterTankChart> {
  double waterHeight = 0.4;
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
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text("As per your BMI you have to drink 10 glass of watter every day",style: GoogleFonts.lato(fontSize: 18,color: Colors.black.withOpacity(0.5),),),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20.0,bottom: 20),
                    child: Center(
                      child: WaveProgressBar(
                        strokeCircleColor: Colors.blue,
                        flowSpeed: 1.0,
                        waveDistance: 50.0,
                        waterColor: Colors.blue,
                        heightController: waterController,
                        percentage: waterHeight,
                        size: Size(200, 200),
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
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15,bottom: 20),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(icon: Icon(Icons.remove,size: 30,color: Colors.red,), onPressed: (){}),
                    IconButton(icon: Icon(Icons.add,size: 30,color: Colors.blue,), onPressed: (){}),
           ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
