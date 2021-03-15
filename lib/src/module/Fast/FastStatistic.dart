import 'package:fitmemax/Graph/BarChart.dart';
import 'package:fitmemax/src/data/data2.dart';
import 'package:fitmemax/src/module/CalTracker/NutritionCharts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:google_fonts/google_fonts.dart';

class FastStatistic extends StatefulWidget {
  @override
  _FastStatisticState createState() => _FastStatisticState();
}

class _FastStatisticState extends State<FastStatistic> {
  //
  // List _listData = Data().Weight;
  //
  // List _getWeightList(){
  //   List WeightData = [];
  //   for(int i  = 0 ; i < _listData.length; i++ ){
  //     WeightData.add(double.parse(_listData[i]['weight']));
  //   }
  //   WeightData.sort();
  //   return WeightData;
  // }
  // List getList(double end){
  //   int start = 0;
  //   int _new = end.toInt();
  //   var arr = List(11);
  //
  //   while(_new%10!=0) {
  //     _new = _new+1;
  //   }
  //   int no = (_new/10).toInt();
  //   for(int i=0;i<arr.length;i++){
  //     arr[i]=start;
  //     start=(start+no);
  //   }
  //   return arr.toList();
  // }
  //
  // Widget _buildYaxixs(){
  //   Iterable x = getList(_getWeightList().last).reversed;
  //   List y = x.toList();
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: List.generate(y.length, (index) {
  //       return Text("${y[index]}",style: TextStyle(fontSize: 10,color: Colors.white,fontWeight: FontWeight.bold),);
  //     }),
  //   );
  // }

  List _monthsList = ['March 21', 'April 21', 'May 21', 'June 21'];
  String _monthsValue;
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
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
        title: Text("Statistic",style: GoogleFonts.lato(fontSize: 22,color: Colors.white),),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 15,bottom: 25),
              child: Row(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                         gradient: LinearGradient(
                          colors: [
                            Color(0xFFff7171),
                            Color(0xFFffbb92),
                          ],
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter,

                        )
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 47,
                        child: CircleAvatar(
                          radius: 44,
                          backgroundImage: AssetImage("images/userImage5.jpeg"),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: _width-140,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 18,bottom: 15),
                          child: Row(
                            children: [
                              Text("Jasmin Decosta",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 18,bottom: 15,right: _width*0.1),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                             Row(
                               children: [
                                 Icon(Icons.check_circle_outline_rounded,color: Color(0xFFffbb92),size: 25,),
                                 SizedBox(width: 5,),
                                 Text("12",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),),
                               ],
                             ),
                             Spacer(),
                             Row(
                               children: [
                                 Icon(Icons.alarm,color: Color(0xFFffbb92),size: 25,),
                                 SizedBox(width: 5,),
                                 Text("12",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),),
                               ],
                             ),
                             Spacer(),
                             Row(
                               children: [
                                 Icon(Icons.accessibility,color: Color(0xFFffbb92),size: 25,),
                                 SizedBox(width: 3,),
                                 Text("12",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),),
                                 Text("  kg",style: GoogleFonts.lato(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.white),),
                               ],
                             ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,bottom: 25,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0xFFffbb92).withOpacity(0.15),
                        radius: 15,
                        child: Icon(Icons.stacked_bar_chart,color: Color(0xFFffbb92),size: 20,),
                      ),
                      SizedBox(width: 10,),
                      Text("Weight Progress",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
                    ],
                  ),
                  Container(
                    height: 30,
                    color: Colors.black,
                    child: Theme(
                      data: Theme.of(context).copyWith(
                          canvasColor: Colors.black,
                      ),
                      child: DropdownButtonHideUnderline(
                        child: ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButton(
                            isDense: true,
                            hint:   Text("March 21",style: TextStyle(fontSize: 15,color: Colors.white),),
                            value: _monthsValue,
                            items: _monthsList.map((value) {
                              return DropdownMenuItem(
                                value: value,
                                child:Text(value,style: TextStyle(fontSize: 15,color: Colors.white),),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _monthsValue = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BarChart(
              listData: Data().Weight,
            ),
            SizedBox(height: 100,),
          ],
        ),
      ),
    );
  }

}

