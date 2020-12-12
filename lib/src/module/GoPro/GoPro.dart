import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitmemax/src/data/data2.dart';
import 'package:fitmemax/src/module/dashboard/plan/PlanDetails.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class GoPro extends StatefulWidget {
  @override
  _GoProState createState() => _GoProState();
}

class _GoProState extends State<GoPro> {

  int _current = 0;
  bool _select =  true;
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(icon: Icon(Icons.close,color: Colors.black87,size: 30,), onPressed: (){
              Navigator.pop(context);
            }),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 15),
              child: Row(
                children: [
                  Text("Unlock\nUnlimited Access",style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold,fontSize: 35,color: Colors.black),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 0,bottom: 20),
              child: Row(
                children: [
                  Text("to your Go Pro plan",style: GoogleFonts.aBeeZee(fontSize: 20,color: Colors.black.withOpacity(0.5)),),
                ],
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                initialPage: 0,
                enlargeCenterPage: true,
                autoPlay: true,
                reverse: false,
                enableInfiniteScroll: true,
                autoPlayInterval: Duration(seconds: 2),
                autoPlayAnimationDuration: Duration(milliseconds: 2000),
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
              items: List.generate(Data().gopro.length, (index) {
                return  GestureDetector(
                  onTap: (){
                    Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: PlanDetails()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Container(
                        height: 200,
                        width: _width - (_width * 0.05) * 2,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 3,
                                spreadRadius: 1)
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          image: DecorationImage(
                            image: AssetImage("assets/gopro/gopro1.png"),
                            fit: BoxFit.cover,
                          )
                        ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20,bottom: 20),
                          child: Text("Perfect Body",style: GoogleFonts.raleway(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                        ),
                      ),
                       ),
                  ),
                );
              }

              )
            ),
            SizedBox(height: 30,),
            Stack(
              alignment: Alignment.topRight,
              children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      if(_select ==  true){
                        _select =  false;
                      }else{
                        _select =  true;
                      }
                    });
                  },
                  child: Container(
                    height: 80,
                    width: _width-50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      border: Border.all(color: _select ? Color(0xFF28c794) : Colors.transparent ,width: _select ? 2 : 0),
                    ),
                    child: Row(
                      children: [
                        _select ?
                        Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          child: Icon(Icons.check_circle_rounded,size: 35,color: Color(0xFF28c794),),
                        ) :
                        Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          child: Icon(Icons.radio_button_unchecked_rounded,size: 35,color: Colors.black.withOpacity(0.2),),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('\$119.99 / Year',style: GoogleFonts.openSans(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                            SizedBox(height: 1,),
                            Text('\$9.99 / Month billed annually ',style: GoogleFonts.openSans(fontSize: 15,color: Colors.black.withOpacity(0.5)),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                _select ? Positioned(
                  top: -5,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Icon(Icons.bookmark,size: 40,color: Color(0xFF28c794),),
                  ),
                ) : SizedBox(),
              ],
            ),
            SizedBox(height: 20,),
            Stack(
              alignment: Alignment.topRight,
              children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      if(_select ==  true){
                        _select =  false;
                      }else{
                        _select =  true;
                      }
                    });
                  },
                  child: Container(
                    height: 80,
                  width: _width-50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      border: Border.all(color: _select ? Colors.transparent : Color(0xFF28c794),width: _select ? 0 :2),
                    ),
                    child: Row(
                      children: [
                       _select ? Padding(
                         padding: const EdgeInsets.only(left: 20,right: 20),
                         child: Icon(Icons.radio_button_unchecked_rounded,size: 35,color: Colors.black.withOpacity(0.2),),
                       ) :  Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          child: Icon(Icons.check_circle_rounded,size: 35,color: Color(0xFF28c794),),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('\$7 Day Free Trial',style: GoogleFonts.openSans(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                            SizedBox(height: 1,),
                            Text('\$14.99 / Month after 1 week ',style: GoogleFonts.openSans(fontSize: 15,color: Colors.black.withOpacity(0.5)),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
               _select ? SizedBox() :Positioned(
                  top: -5,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Icon(Icons.bookmark,size: 40,color: Color(0xFF28c794),),
                  ),
                ),
              ],
            ),
            SizedBox(height: 35,),
            Padding(
              padding: const EdgeInsets.only(left: 25,right: 25),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                height: 65,
                minWidth: _width-50,
                color: Color(0xFF28c794),
                onPressed: (){},
                child: Center(child: Text('CONTINUE',style: GoogleFonts.openSans(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),)),
              ),
            ),
            SizedBox(height: 35,),
            Text('Restore purchase',style: TextStyle(fontSize: 17,color: Colors.black87),),
            SizedBox(height: 15,),
            SizedBox(
              width: _width-40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(child: Text("Unless you cancel at least 24 hours before the end of the 1 week you will bw automatically charged \$14.99 for a month subscription.",
                      style: TextStyle(fontSize: 13,color: Colors.black45),
                  )),
                ],
              ),
            ),
            SizedBox(height: 40,),
          ],
        ),
      ),
    );
  }
}