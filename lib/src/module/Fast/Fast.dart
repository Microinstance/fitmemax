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
        return Colors.purple[800] ;
        break;
      case 1:
        return Colors.blue[800];
        break;
      case 3:
        return Colors.pink[800];
        break;
      case 4:
        return Colors.deepOrange[800];
        break;
      case 5:
        return Palette.primaryColor;
        break;
      case 6:
        return Colors.cyanAccent[800];
        break;
      default:
        return Colors.amber[800];
    }
  }

  Color _colorsg(x) {
    switch (x) {
      case 0:
        return Colors.purple[300] ;
        break;
      case 1:
        return Colors.blue[300];
        break;
      case 3:
        return Colors.pink[300];
        break;
      case 4:
        return Colors.deepOrange[300];
        break;
      case 5:
        return Colors.green[300];
        break;
      case 6:
        return Colors.cyanAccent[300];
        break;
      default:
        return Colors.amber[300];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Color(0xFF1f1e23),
        elevation: 0,

        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined,color: Colors.white,size: 20,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text("Fast",style: GoogleFonts.lato(fontSize: 22,color: Colors.white),),
        actions: [
          IconButton(
            icon: Icon(Icons.settings,color: Colors.white,size: 20,),
            onPressed: (){

            },
          ),
        ],
      ),
      backgroundColor: Color(0xFF1f1e23),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 20, bottom: 15),
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
                  mainAxisSpacing: 20.0,
                  crossAxisSpacing: 20.0,
                  padding: EdgeInsets.only(left: 20, right: 20),
                  children: List.generate(Data().fast.length, (int index) {
                    return GestureDetector(
                      onTap: (){},
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  _colors(index),
                                  _colorsg(index),
                                ],
                                begin: FractionalOffset.topLeft,
                                end: FractionalOffset.bottomRight,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    Data().fast[index]['name'],
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 25),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: [
                                        Text(
                                          Data().fast[index]['time'],
                                          style: GoogleFonts.lato(
                                              fontWeight: FontWeight.w900,
                                              color: Colors.white,
                                              fontSize: 40),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 05),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Hours",
                                          style: GoogleFonts.lato(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Colors.white.withOpacity(0.8),
                                              fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.info_outline_rounded,
                                color: Colors.white,
                              ),
                              onPressed: () {})
                        ],
                      ),
                    );
                  })),
            ),
            SizedBox(
              height: 50,
            ),
            MaterialButton(
              height: 50,
              color: Colors.transparent,
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide(
                    color: Color(0xFFff7171),
                    width: 1,
                    style: BorderStyle.solid),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  "Create Your Fast Preset",
                  style: GoogleFonts.lato(
                      color: Color(0xFFff7171),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
