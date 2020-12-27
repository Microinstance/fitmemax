import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class FastDetailsPage extends StatefulWidget {
  final String titel;
  final String hours;
  final String desc;
  FastDetailsPage({this.titel = "Circadian Rhythm TRF",this.hours = '13',this.desc = "Based on the research of scientist Dr.Satchin Panda, this time-restricted feeding (TRF) fast emulates the time-restricted feeding (TRF) fast emulates the body's natural clock by fasting roughly after sunset until morning."});
  @override
  _FastDetailsPageState createState() => _FastDetailsPageState();
}
class _FastDetailsPageState extends State<FastDetailsPage> {

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF1f1e23),
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined,color: Colors.white,size: 20,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text(widget.titel,style: GoogleFonts.lato(fontSize: 22,color: Colors.white),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20,bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SleekCircularSlider(
                    appearance: CircularSliderAppearance(
                      customWidths: CustomSliderWidths(trackWidth: 5, progressBarWidth: 12, shadowWidth: 18),
                      customColors: CustomSliderColors(
                          dotColor: Colors.black,
                          trackColor: Color(0xFF292b2c),
                          progressBarColors: [Color(0xFFff7171),Color(0xFFffbb92),],
                          shadowColor: Colors.grey[50],
                          shadowMaxOpacity: 0.05),
                      infoProperties: InfoProperties(
                          bottomLabelStyle: TextStyle(
                              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
                          bottomLabelText: 'Hours',
                          mainLabelStyle: TextStyle(
                              color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.w600),
                          modifier: (double value) {
                            final time = widget.hours;
                            return '$time';
                          }),
                      // startAngle: 120,
                      // angleRange: 300,
                      size: 120.0,
                    ),
                    initialValue: 100,
                    min: 0,
                    max: 100,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
              child: Text(widget.desc,style: GoogleFonts.lato(fontSize: 18,color: Colors.white.withOpacity(0.5)),textAlign: TextAlign.center,),
            ),
            MaterialButton(
              onPressed: (){},
              color: Color(0xFFff7171),
              height: 40,
              child: Padding(
                padding: const EdgeInsets.only(left: 15,right: 15,bottom: 2),
                child: Text("Prepare fast",style: GoogleFonts.lato(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
            ),
            SizedBox(height: 50,),
            Text("-- Tips to Prepare for this fast --",style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 15),textAlign: TextAlign.center,),
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.only(left: _width *0.05,right: _width*0.05,bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                 Image.asset("assets/fast/glasswater.png",height: 70,width: 70 ,fit: BoxFit.fitHeight,),
                  SizedBox(width: 5,),
                  SizedBox(
                    width: _width*0.65,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(child: Text("Hydrate with water before, during and after the fast.",style: GoogleFonts.lato(color: Colors.white,fontSize: 15),)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: _width *0.05,right: _width*0.05,bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset("assets/fast/fastfood.png",height: 60,width: 60 ,fit: BoxFit.fitHeight,),
                  SizedBox(width: 15,),
                  SizedBox(
                    width: _width*0.65,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(child: Text("Avoid processed and unhealthy foods before and after fasting.",style: GoogleFonts.lato(color: Colors.white,fontSize: 15),)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: _width *0.05,right: _width*0.05,bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset("assets/fast/vegitable.png",height: 60,width: 60 ,fit: BoxFit.fitHeight,),
                  SizedBox(width: 15,),
                  SizedBox(
                    width: _width*0.65,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(child: Text("Prepare healthy, fresh foods for your first meal after the fast.",style: GoogleFonts.lato(color: Colors.white,fontSize: 15),)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 50,),
          ],
        ),
      ),
    );
  }
}
