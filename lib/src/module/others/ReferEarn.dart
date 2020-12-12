import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReferEarn extends StatefulWidget {
  @override
  _ReferEarnState createState() => _ReferEarnState();
}

class _ReferEarnState extends State<ReferEarn> {

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Invite Friends",style: GoogleFonts.roboto(color: Colors.white,fontSize: 22),),
        backgroundColor: Color(0xFF2948f8),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded,color: Colors.white,size: 25,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25,right: 25,top: 30,bottom: 25),
              child: Image.asset("assets/others/refer.png",height: _height*0.28),
            ),
            Padding(
              padding: const EdgeInsets.only(left:35,right: 35,bottom: 25 ),
              child: Text("Invite your friends\nReward yourself",style: GoogleFonts.lato(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
            ),
            Padding(
              padding: const EdgeInsets.only(left:35,right: 35, ),
              child: Text("For every Referral you & your friend both will get 50 Fit-Coins",style: GoogleFonts.lato(color: Colors.black.withOpacity(0.7),fontSize: 18),textAlign: TextAlign.center,),
            ),
            SizedBox(height: _height*0.05,),
            Container(
              width: 180,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.grey[100],
                ),
                child: Center(child: Text("FGJ456BV",style: GoogleFonts.montserrat(color: Color(0xFF2948f8),fontSize: 18,fontWeight: FontWeight.bold,letterSpacing: 1),textAlign: TextAlign.center,))),
            SizedBox(height: 15,),
            Text("Your invite code",style: GoogleFonts.lato(color: Colors.black.withOpacity(0.5),fontSize: 18),textAlign: TextAlign.center,),
            SizedBox(height: _height*0.05,),
            SizedBox(
              height: 60,
              width: _width-60,
              child: FlatButton(
                  onPressed: (){},
                color:  Color(0xFF2948f8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Invite Now",style: GoogleFonts.lato(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
                ),
              ),
            ),
            SizedBox(height: _height*0.1,),
          ],
        ),
      ),
    );
  }
}
