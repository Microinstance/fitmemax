import 'package:fitmemax/Objects/InnerShadow.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OneoOneVs extends StatefulWidget {

  @override
  _OneoOneVsState createState() => _OneoOneVsState();
}

class _OneoOneVsState extends State<OneoOneVs> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: _height,
              width: _width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/battleground/background.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            InnerShadow(
              blur: 5,
              color: Colors.black.withOpacity(0.5),
              offset: const Offset(5, 5),
              child: Container(
                height: _height,
                width: _width,
                // decoration: BoxDecoration(
                //   image:
                // ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 300,
                      width: 100,
                      decoration: BoxDecoration(

                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
