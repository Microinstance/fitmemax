import 'dart:async';
import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinning_wheel/flutter_spinning_wheel.dart';

class BattleGroundSpin extends StatefulWidget {

  @override
  _BattleGroundSpinState createState() => _BattleGroundSpinState();
}

class _BattleGroundSpinState extends State<BattleGroundSpin> {
  final StreamController _dividerController = StreamController<int>();

  final _wheelNotifier = StreamController<double>();

  @override
  void dispose() {
    _dividerController.close();
    _wheelNotifier.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      // DeviceOrientation.landscapeRight,
    ]);
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    double _generateRandomAngle() => Random().nextDouble() * pi * 2;
    double _generateRandomVelocity() => (Random().nextDouble() * 6000) + 2000;
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
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SpinningWheel(
                        Image.asset('assets/battleground/mod-redef copy.png'),
                        width: 310,
                        height: 310,
                        initialSpinAngle: _generateRandomAngle(),
                        spinResistance: 0.6,
                        canInteractWhileSpinning: false,
                        dividers: 16,
                        onUpdate: _dividerController.add,
                        onEnd: _dividerController.add,
                        secondaryImage:
                        Image.asset('assets/battleground/2.png',),
                        secondaryImageHeight: 110,
                        secondaryImageWidth: 110,
                        shouldStartOrStop: _wheelNotifier.stream,
                      ),
                      GestureDetector(
                        onTap:(){
                          _wheelNotifier.sink.add(_generateRandomVelocity());
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          color: Colors.transparent,
                        ),
                      )
                    ],
                  ),
                  StreamBuilder(
                    stream: _dividerController.stream,
                    builder: (context, snapshot) =>
                    snapshot.hasData ? RouletteScore(snapshot.data) : Container(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class RouletteScore extends StatelessWidget {
  final int selected;

  final Map<int, String> labels = {
    1: '1\$',
    2: '2\$',
    3: '3\$',
    4: '4\$',
    5: '5\$',
    6: '6\$',
    7: '7\$',
    8: '8\$',
    9: '9\$',
    10: '10\$',
    11: '11\$',
    12: '12\$',
    13: '13\$',
    14: '14\$',
    15: '15\$',
    16: '16\$',
  };

  RouletteScore(this.selected);

  @override
  Widget build(BuildContext context) {
    return Text('${labels[selected]}',
        style: TextStyle(fontStyle: FontStyle.italic, fontSize: 24.0));
  }
}