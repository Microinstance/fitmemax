import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BattleGroundHome extends StatefulWidget {
  @override
  _BattleGroundHomeState createState() => _BattleGroundHomeState();
}

class _BattleGroundHomeState extends State<BattleGroundHome> {

  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }
  @override
  dispose(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: _height,
              width: _width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/battleground/battlegroundbackground.png"),
                    fit: BoxFit.cover,
                  )
              ),
            ),
            Column(
              children: [

              ],
            ),
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: _height*0.3,
                    width: _width*0.2,
                    decoration: BoxDecoration(
                        gradient: new LinearGradient(
                            colors: [
                             Color(0xFF034194),
                             Color(0xFF048ef6),
                             Color(0xFF048ef6),
                             Color(0xFF034194),
                            ],
                            begin: FractionalOffset.topCenter,
                            end: FractionalOffset.bottomCenter,
                        ),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  Container(
                    height: _height*0.3,
                    width: _width*0.2,
                    decoration: BoxDecoration(
                      gradient: new LinearGradient(
                        colors: [
                          Color(0xFF14838b),
                          Color(0xFF11e8d3),
                          Color(0xFF11e8d3),
                          Color(0xFF14838b),
                        ],
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  Container(
                    height: _height*0.3,
                    width: _width*0.2,
                    decoration: BoxDecoration(
                      gradient: new LinearGradient(
                        colors: [
                          Color(0xFFf37300),
                          Color(0xFFedae00),
                          Color(0xFFedae00),
                          Color(0xFFf37300),
                        ],
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ],
              ),
            )
          ],
        )
    );
  }
}
