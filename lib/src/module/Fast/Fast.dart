import 'package:fitmemax/src/data/data2.dart';
import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Fast extends StatefulWidget {
  @override
  _FastState createState() => _FastState();
}

class _FastState extends State<Fast> {
  Color _colors(x) {
    switch (x) {
      case 0:
        return Colors.purple;
        break;
      case 1:
        return Colors.blue[900];
        break;
      case 3:
        return Colors.pink;
        break;
      case 4:
        return Colors.deepOrange;
        break;
      case 5:
        return Palette.primaryColor;
        break;
      case 6:
        return Colors.cyanAccent;
        break;
      default:
        return Colors.amber[800];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1f1e23),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 30, bottom: 15),
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                        child: Text(
                      "Start A New Fast",
                      style: GoogleFonts.lato(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 0, bottom: 30),
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                        child: Text(
                      "385,55 peoples are fasting now",
                      style: GoogleFonts.lato(
                          fontSize: 15, color: Colors.white.withOpacity(0.4)),
                    )),
                  ],
                ),
              ),
            ),
            Container(
              height: 370,
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                mainAxisSpacing: 25.0,
                crossAxisSpacing: 25.0,
                padding: EdgeInsets.only(left: 25,right: 25),
                children: List.generate(Data().fast.length, (int index) {
                  return Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: _colors(index),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  Data().fast[index]['name'],style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 25),
                              ),
                              SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      Data().fast[index]['time'],style: GoogleFonts.lato(fontWeight: FontWeight.w900,color: Colors.white,fontSize: 40),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 3,),
                              Padding(
                                padding: const EdgeInsets.only(left: 05),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Hours",style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.white.withOpacity(0.8),fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      IconButton(icon: Icon(Icons.info_outline_rounded,color: Colors.white,), onPressed: (){})
                    ],
                  );
                })
              ),
            ),
            SizedBox(height: 60,),
            MaterialButton(
              height: 50,
              color: Colors.transparent,
              onPressed: (){},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                side: BorderSide(
                    color:Color(0xFFff7171),
                    width: 1,
                    style: BorderStyle.solid
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Text("Create Your Fast Preset",style: GoogleFonts.lato(color: Color(0xFFff7171),fontSize: 20,fontWeight: FontWeight.bold),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
