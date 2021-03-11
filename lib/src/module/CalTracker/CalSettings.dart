import 'package:fitmemax/src/widgets/CartItemNumber2.dart';
import 'package:fitmemax/src/widgets/palette.dart';
import 'package:fitmemax/src/widgets/w_dropdown.dart';
import 'package:fitmemax/src/widgets/w_signin_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalSettings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<CalSettings> {

  bool isLoad = false;
  List _breckFastTime = [
    '06:00 -06:30am',
    '06:30 -07:00am',
    '07:00 -07:30am',
    '07:30 -08:00am',
    '08:00 -08:30am',
    '08:30 -09:00am',
    '08:30 -09:00am',
  ];
  String _breckFastTimeValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Palette.primaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined,size: 20,color: Colors.white,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text("Settings",style: GoogleFonts.roboto(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15,left: 15,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Update Height',
                    style: GoogleFonts.roboto(fontSize: 16, color: Colors.black,),
                  ),
                  CartItemNumber2(
                    initial: 5.7,
                    unit: "ft",
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15,left: 15,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Update Weight',
                    style: GoogleFonts.roboto(fontSize: 16, color: Colors.black,),
                  ),
                  CartItemNumber2(
                    initial: 70.2,
                    unit: "kg",
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15,left: 15,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Watter Consume',
                    style: GoogleFonts.roboto(fontSize: 16, color: Colors.black,),
                  ),
                  CartItemNumber2(
                    initial: 2.5,
                    unit: "lt",
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15,left: 15,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Daily Calori Target',
                    style: GoogleFonts.roboto(fontSize: 16, color: Colors.black,),
                  ),
                  CartItemNumber2(
                    initial: 1250,
                    unit: "kCal",
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30,left: 15,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Breckfast Time',
                    style: GoogleFonts.roboto(fontSize: 16, color: Colors.black,),
                  ),
                  Container(
                    child: w_dropdown(
                      hint: "${_breckFastTime[1].toString()}",
                      onChanged: (value) {
                        setState(() {
                          _breckFastTimeValue = value;
                        });
                      },
                      list: _breckFastTime,
                      select: _breckFastTimeValue,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15,left: 15,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Breckfast Calori contain',
                    style: GoogleFonts.roboto(fontSize: 16, color: Colors.black,),
                  ),
                  CartItemNumber2(
                    initial: 250.2,
                    unit: "kCal",
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30,left: 15,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Brunch Time',
                    style: GoogleFonts.roboto(fontSize: 16, color: Colors.black,),
                  ),
                  Container(
                    child: w_dropdown(
                      hint: "${_breckFastTime[1].toString()}",
                      onChanged: (value) {
                        setState(() {
                          _breckFastTimeValue = value;
                        });
                      },
                      list: _breckFastTime,
                      select: _breckFastTimeValue,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15,left: 15,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Brunch Calori contain',
                    style: GoogleFonts.roboto(fontSize: 16, color: Colors.black,),
                  ),
                  CartItemNumber2(
                    initial: 250.2,
                    unit: "kCal",
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30,left: 15,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Lunch Time',
                    style: GoogleFonts.roboto(fontSize: 16, color: Colors.black,),
                  ),
                  Container(
                    child: w_dropdown(
                      hint: "${_breckFastTime[1].toString()}",
                      onChanged: (value) {
                        setState(() {
                          _breckFastTimeValue = value;
                        });
                      },
                      list: _breckFastTime,
                      select: _breckFastTimeValue,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15,left: 15,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Lunch Calori contain',
                    style: GoogleFonts.roboto(fontSize: 16, color: Colors.black,),
                  ),
                  CartItemNumber2(
                    initial: 250.2,
                    unit: "kCal",
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30,left: 15,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Supper Time',
                    style: GoogleFonts.roboto(fontSize: 16, color: Colors.black,),
                  ),
                  Container(
                    child: w_dropdown(
                      hint: "${_breckFastTime[1].toString()}",
                      onChanged: (value) {
                        setState(() {
                          _breckFastTimeValue = value;
                        });
                      },
                      list: _breckFastTime,
                      select: _breckFastTimeValue,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15,left: 15,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Supper Calori contain',
                    style: GoogleFonts.roboto(fontSize: 16, color: Colors.black,),
                  ),
                  CartItemNumber2(
                    initial: 250.2,
                    unit: "kCal",
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30,left: 15,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Dinner Time',
                    style: GoogleFonts.roboto(fontSize: 16, color: Colors.black,),
                  ),
                  Container(
                    child: w_dropdown(
                      hint: "${_breckFastTime[1].toString()}",
                      onChanged: (value) {
                        setState(() {
                          _breckFastTimeValue = value;
                        });
                      },
                      list: _breckFastTime,
                      select: _breckFastTimeValue,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15,left: 15,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Dinner Calori contain',
                    style: GoogleFonts.roboto(fontSize: 16, color: Colors.black,),
                  ),
                  CartItemNumber2(
                    initial: 250.2,
                    unit: "kCal",
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 100,top: 20),
              child: MaterialButton(
                onPressed: (){},
                height: 50,
                color: Palette.primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15,bottom: 10,top: 10),
                  child: Text("Save Changes",style: GoogleFonts.lato(fontSize: 18,color:Colors.white,fontWeight: FontWeight.bold ),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
