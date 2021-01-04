import 'package:flutter/material.dart';

class w_background extends StatelessWidget {
  final Widget child;
  final double value;
  w_background({this.child,this.value=1});
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Stack(
        children: [

          Container(
            width: _width,
            child: Image.asset('assets/background/signin_up.png',fit: BoxFit.fitWidth,),
          ),
          child,
          Align(
            alignment: Alignment.topLeft,
            child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Opacity(
                    opacity: value,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back,size: 25,color: Colors.white,),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
