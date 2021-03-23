import 'package:fitmemax/src/ListData/ListData.dart';
import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NutritionCharts extends StatefulWidget {
  @override
  _NutritionChartsState createState() => _NutritionChartsState();
}

class _NutritionChartsState extends State<NutritionCharts> {
  List timeLine = ['Weekly', 'Monthly','Daily'];
  String _timeLineValue = 'Weekly';

  Color _getColor({String id}) {
    if (id == 'Fiber') {
      return Colors.orangeAccent;
    } else if (id == 'Sugar') {
      return Colors.black45;
    } else if (id == 'Sodium') {
      return Colors.lightBlueAccent;
    } else if (id == 'Potassium') {
      return Colors.deepPurple;
    } else if (id == 'Protein') {
      return Colors.red;
    } else if (id == 'Fat') {
      return Colors.yellow;
    } else if (id == 'Carbs') {
      return Colors.green;
    }
  }
  List _getTimeLine(position) {
    if (position == 'Weekly') {
      return Data().WeekName;
    } else if (position == 'Monthly') {
      return Data().MonthName;
    } else if (position == 'Daily') {
      return Data().DateName;
    }
  }

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
                      "Nutrition Charts",
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ],
                ),
                _dropdownButtonTwo()
              ],
            ),
          ),
          Container(
            child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              shrinkWrap: true,
              childAspectRatio: 1 / 0.4,
              children: List.generate(
                Data().Nutrition.length,
                (index) => Container(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 5,
                        backgroundColor: _getColor(id: Data().Nutrition[index]['titel']),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        Data().Nutrition[index]['titel'],
                        style: GoogleFonts.lato(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
                                    style: GoogleFonts.lato(
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
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
                          itemCount: _getTimeLine(_timeLineValue).length,
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return NutritionBars(
                              name: _getTimeLine(_timeLineValue)[index],
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
              style: GoogleFonts.lato(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            value: _timeLineValue,
            items: timeLine.map((value) {
              return DropdownMenuItem(
                value: value,
                child: Text(
                  value,
                  style: GoogleFonts.lato(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _timeLineValue = value;
              });
              print(_timeLineValue);
              // print(_timeLineOneFlag);
            },
          ),
        ),
      ),
    );
  }

  Widget NutritionBars(
      {
        String name = "Mon",
      }) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    double xheight = 297;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: List.generate(
              Data().Nutrition.length,
              (index) => Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Container(
                  width: 4,
                  height: xheight * double.parse(Data().Nutrition[index]['percentage']),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: _getColor(id:  Data().Nutrition[index]['titel']),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
          // width: 50,
          child: Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: GoogleFonts.lato(fontSize: 12, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
