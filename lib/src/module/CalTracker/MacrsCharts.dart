import 'package:fitmemax/src/data/data2.dart';
import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MacrsCharts extends StatefulWidget {
  @override
  _MacrsChartsState createState() => _MacrsChartsState();
}

class _MacrsChartsState extends State<MacrsCharts> {
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
                      "Macros",
                      style: GoogleFonts.lato(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                    ),
                  ],
                ),
                _dropdownButtonTwo()
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.red[400],
                    radius: 9,
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Text(
                    "Protein",
                    style: GoogleFonts.lato(fontWeight: FontWeight.w500, fontSize: 18, color: Colors.black),
                  ),
                ],
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.yellow,
                    radius: 9,
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Text(
                    "Fat",
                    style: GoogleFonts.lato(fontWeight: FontWeight.w500, fontSize: 18, color: Colors.black),
                  ),
                ],
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 9,
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Text(
                    "Carbs",
                    style: GoogleFonts.lato(fontWeight: FontWeight.w500, fontSize: 18, color: Colors.black),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Container(
              height: 350,
              width: _width - 20,
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15, top: 15),
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                      height: 320,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(11, (index) {
                              var x = index * 10;
                              var y = -(x - 100);
                              return Row(
                                children: [
                                  Text(
                                    '${y}',
                                    style: GoogleFonts.lato(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              );
                            })),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: SizedBox(
                        height: 317,
                        width: _width - 75,
                        child: ListView.builder(
                          itemCount: Data().mmWeekly.length,
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            var p_position = "${Data().mmWeekly[index]['P_position']}";
                            double p = double.parse(p_position);

                            var f_position = "${Data().mmWeekly[index]['F_position']}";
                            double f = double.parse(f_position);

                            var c_position = "${Data().mmWeekly[index]['C_position']}";
                            double c = double.parse(c_position);

                            return pfcBar(
                              name: Data().mmWeekly[index]['name'],
                              P_position: p,
                              F_position: f,
                              C_position: c,
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
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

  Widget pfcBar({String name = "Mon", double P_position = 0.6, double F_position = 0.6, double C_position = 0.6}) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    double xheight = 297;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 4,
                height: xheight * P_position,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    gradient: LinearGradient(
                      colors: [
                        Colors.red,
                        Colors.red[300],
                      ],
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                    )),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                width: 4,
                height: xheight * F_position,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    gradient: LinearGradient(
                      colors: [
                        Colors.yellow,
                        Colors.yellow[300],
                      ],
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                    )),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                width: 4,
                height: xheight * C_position,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    gradient: LinearGradient(
                      colors: [
                        Colors.green,
                        Colors.green[300],
                      ],
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                    )),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
          width: 45,
          child: Row(
            children: [
              Flexible(
                  child: Text(
                name,
                style: GoogleFonts.lato(fontSize: 12, color: Colors.black),
              )),
            ],
          ),
        ),
      ],
    );
  }
}
