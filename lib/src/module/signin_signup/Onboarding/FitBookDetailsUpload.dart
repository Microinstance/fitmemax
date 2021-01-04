import 'package:fitmemax/src/module/dashboard/Dashboard.dart';
import 'package:fitmemax/src/widgets/palette.dart';
import 'package:fitmemax/src/widgets/w_background.dart';
import 'package:fitmemax/src/widgets/w_signin_button.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class FitBookDetailsUpload extends StatefulWidget {
  @override
  _FitBookDetailsUploadState createState() => _FitBookDetailsUploadState();
}

class _FitBookDetailsUploadState extends State<FitBookDetailsUpload> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return w_background(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(left: _width * 0.02, right: _width * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: _height * 0.06,
            ),
            Container(
              width: _width * 0.6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                      child: Image.asset(
                        'assets/logo/splash-Screen.png',
                        fit: BoxFit.fitWidth,
                      )),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.all(_width*0.05),
              child: Container(
                width: _width,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 5.0,
                      spreadRadius: 5.0
                  ),
                ],
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      SizedBox(height: 25,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('FitBook Details',style: TextStyle(fontSize: 30,color: Colors.black,letterSpacing: 0.2),),
                        ],
                      ),
                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              CircleAvatar(
                                radius: 80,
                                backgroundColor: Palette.primaryColor.withOpacity(0.4),
                                child: CircleAvatar(
                                  radius: 77,
                                  backgroundImage: AssetImage("images/userImage5.jpeg"),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: CircleAvatar(
                                    radius: 18,
                                    backgroundColor: Colors.black,
                                    child: Icon(Icons.add,color: Colors.white,size: 25,)),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 25,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          w_signin_button(
                            title: 'Finish',
                            onPressed: (){
                              Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: Dashboard()));
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 25,),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      value: 0.0,
    );
  }
}
