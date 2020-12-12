import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileOfferDetails extends StatefulWidget {
  @override
  _ProfileOfferDetailsState createState() => _ProfileOfferDetailsState();
}

class _ProfileOfferDetailsState extends State<ProfileOfferDetails> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Palette.profileColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width:  _width,
                  height: _height*0.45,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/banner/banner1.png"),
                      fit: BoxFit.cover,
                    )
                  ),
                ),
                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.only(left: 15,bottom: 10,right: 15),
                  child: Row(
                    children: [
                      Flexible(child: Text("Get Flat 15% Off Site-Wide",style: GoogleFonts.roboto(fontWeight: FontWeight.w500,color: Colors.white,fontSize: 25),)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15,bottom: 15,right: 15),
                  child: Row(
                    children: [
                      Flexible(child: Text("Grab the world's firts plant-based vitamins with nstant coffee made with ethiopian arabica beans. Turbochange your day! Rafe Coggee helps You.." ,style: GoogleFonts.roboto(fontWeight: FontWeight.w400,color: Colors.white.withOpacity(0.7),fontSize: 18),)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: SafeArea(child: Padding(
              padding: const EdgeInsets.only(left: 15,top: 5),
              child: CircleAvatar(
                radius: 21,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.black,
                  child: Center(
                    child: IconButton(
                      icon:  Icon(Icons.arrow_back_rounded,color: Colors.white,size: 22,),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ),
            )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 110,
              width: _width,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10))
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Icon(Icons.monetization_on,color: Colors.white,),
                          ],
                        ),
                        Text("49",style: GoogleFonts.roboto(fontSize: 50,color: Palette.x1Color,fontWeight: FontWeight.w500,fontStyle: FontStyle.italic),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                       MaterialButton(
                         shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(10)),
                         color: Colors.white,
                         height: 40,
                         onPressed: (){},
                         child: Padding(
                           padding: const EdgeInsets.only(left: 30,top: 15,bottom: 15,right: 30),
                           child: Text("Redeem Now",style: GoogleFonts.openSans(fontSize: 22,color: Colors.black,fontWeight: FontWeight.w600),),
                         ),
                       )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
