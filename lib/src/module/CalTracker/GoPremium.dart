import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GoPremium extends StatefulWidget {
  @override
  _GoPremiumState createState() => _GoPremiumState();
}

class _GoPremiumState extends State<GoPremium> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            height: 130,
            width: _width-40,
            decoration: BoxDecoration(
              color: Palette.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Upgrade to Premium",style: GoogleFonts.lato(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      letterSpacing: 1),),
                  SizedBox(height: 10,),
                  SizedBox(
                    width: _width-40-30-50,
                    child: Row(
                      children: [
                        Flexible(
                          child: Text("Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latiin Virginia",style: GoogleFonts.lato(
                              color: Colors.black.withOpacity(0.7),
                              fontSize: 12,
                              letterSpacing: 1),),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Image.asset("assets/calori/premium.gif",height: 80,),
        ],
      ),
    );
  }
}
