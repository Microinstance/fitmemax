import 'dart:io';

import 'package:fitmemax/src/widgets/AssetVideoPlayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OneoOneChallange extends StatefulWidget {
  File video;
  OneoOneChallange({this.video});
  @override
  _OneoOneChallangeState createState() => _OneoOneChallangeState();
}

class _OneoOneChallangeState extends State<OneoOneChallange> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    final Duration initialDelay = Duration(milliseconds: 1000);
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
            Container(
              height: _height,
              width: _width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Container(
                      height: _height-100,
                      width: _height-100,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(color: Colors.white,width: 1),
                        borderRadius: BorderRadius.circular(7.5),
                      ),
                      child: (widget.video == null) ? Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: SizedBox(
                            height: 30,
                            width: 30,
                            child: CircularProgressIndicator(
                            )),
                      ) : AssetVideoPlayer(
                        play: true,
                        url: widget.video.path,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
