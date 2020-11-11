import 'package:fitmemax/src/module/dashboard/Dashboard.dart';
import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class PopUp extends StatefulWidget {

  @override
  _PopUpState createState() => _PopUpState();
}

class _PopUpState extends State<PopUp> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.4),
      body: Center(
        child: Stack(
          overflow: Overflow.visible,
          alignment: Alignment.topRight,
          children: [
            Container(
              width: _width * 0.8,
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  color: Colors.black.withOpacity(0.5),
                  width: 1,
                ),
              ),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                removeBottom: true,
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
             AspectRatio(
                 aspectRatio: 5/6.5,
                 child: GestureDetector(
                   onTap: (){
                     Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: Dashboard()));
                   },
                   child: Container(
                     width: _width * 0.8,
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.all(Radius.circular(10)),
                       image: DecorationImage(
                           image: AssetImage("assets/popup/popup1.png"),
                         fit: BoxFit.cover,
                       )
                     ),
                   ),
                 ),
             ),
                    SizedBox(
                      height: _height * 0.6*0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 120,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: Palette.primaryColor,
                            onPressed: (){},
                            child: Text("Book Now",style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Starting At ₹199"),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: -15,
              right: -15,
              child: GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Dashboard();
                      },
                    ),
                  );
                  Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: Dashboard()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 1,
                            spreadRadius: 1
                          )
                        ]
                      ),
                      child: Icon(Icons.cancel,size: 40,))
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
