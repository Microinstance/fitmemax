import 'package:fitmemax/src/data/data2.dart';
import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MicrosCharts extends StatefulWidget {
  @override
  _MicrosChartsState createState() => _MicrosChartsState();
}

class _MicrosChartsState extends State<MicrosCharts> {
  List timeLineOne = ['Weekly', 'Monthly'];
  String _timeLineOneValue = 'Weekly';
  String _timeLineTwoValue = 'Weekly';

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Palette.primaryColor.withOpacity(0.15),
                      radius: 18,
                      child: Icon(
                        Icons.accessibility,
                        color: Palette.primaryColor,
                        size: 23,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Micros",
                      style: GoogleFonts.lato(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                    ),
                  ],
                ),
                _dropdownButtonTwo()
              ],
            ),
          ),
          Container(
            child: GridView.count(
              crossAxisCount: 4,
              shrinkWrap: true,
              childAspectRatio: 1/0.4,
              children: List.generate(Data().Micros.length, (index) =>
                  Container(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 5,
                      backgroundColor: _get(id:   Data().Micros[index]),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      Data().Micros[index],
                      style: GoogleFonts.lato(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
              ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: Data().Micros.length,
              itemBuilder: (BuildContext context, int index){
            return Micros(
                width: _width,
                id: Data().Micros[index],
                percent: (index/10)+0.4,
            );
          }
          )
        ],
      ),
    );
  }

  Color _get({String id}){
    if(id == 'Fiber'){
      return Colors.orangeAccent;
    } else if(id == 'Sugar'){
      return Colors.black45;
    }else if(id == 'Sodium'){
      return Colors.lightBlueAccent;
    }else if(id == 'Potassium'){
      return Colors.deepPurple;
    }
  }
  Widget _dropdownButtonTwo() {
    double _height = MediaQuery.of(context).size.height;
    return Container(
      height: 35,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton(
            icon: Icon(
              Icons.keyboard_arrow_down,
              size: 25,
              color: Colors.black,
            ),
            isDense: true,
            hint: Text(
              "Weekly",
              style: GoogleFonts.lato(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
            ),
            value: _timeLineTwoValue,
            items: timeLineOne.map((value) {
              return DropdownMenuItem(
                value: value,
                child: Text(
                  value,
                  style: GoogleFonts.lato(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _timeLineTwoValue = value;
              });
              print(_timeLineTwoValue);
              // print(_timeLineOneFlag);
            },
          ),
        ),
      ),
    );
  }
  Widget Micros({double width,double percent,String id}){
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            height: 10,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[200],
            ),
          ),
          Container(
            height: 10,
            width: (width-30)*percent,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: _get(id:id ),
            ),
          ),
        ],
      ),
    );
  }
}
