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

  List _listData = Data().Weight;

  List _getWeightList(){
    List WeightData = [];
    for(int i  = 0 ; i < _listData.length; i++ ){
      WeightData.add(double.parse(_listData[i]['weight']));
    }
    WeightData.sort();
    return WeightData;
  }
  List getList(double end){
    int start = 0;
    int _new = end.toInt();
    var arr = List(11);

    while(_new%10!=0) {
      _new = _new+1;
    }
    int no = (_new/10).toInt();
    for(int i=0;i<arr.length;i++){
      arr[i]=start;
      start=(start+no);
    }
    return arr.toList();
  }

  Widget _buildYaxixs(){
    Iterable x = getList(_getWeightList().last).reversed;
    List y = x.toList();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(y.length, (index) {
        return Text("${y[index]}",style: TextStyle(fontSize: 10,color: Colors.white,fontWeight: FontWeight.bold),);
      }),
    );
  }

Widget _buildXAxis({double weight,String date}){
   double xMax =  300;
   int xLast = getList(_getWeightList().last).last;
   return Padding(
     padding: const EdgeInsets.only(right: 15),
     child: Tooltip(
       message: '${weight}',
       child: Column(
         mainAxisAlignment: MainAxisAlignment.end,
         children: [
           Container(
             width: 10,
             height: 300*weight/xLast,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(7.5),
               color: Color(0xFFff7171),
             ),
           ),
           SizedBox(
             height: 20,
             child: Column(
               children: [
                 Spacer(),
                 Text(
                    "${date}",style: TextStyle(fontSize: 10,color: Colors.white,fontWeight: FontWeight.bold),),
               ],
             ),
           )
         ],
       ),
     ),
   );
}
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
              padding: const EdgeInsets.only(left: 15,bottom: 20),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xFFffbb92).withOpacity(0.15),
                    radius: 18,
                    child: Icon(Icons.stacked_bar_chart,color: Color(0xFFffbb92),size: 23,),
                  ),
                  SizedBox(width: 10,),
                  Text("Weight Progress",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
                ],
              ),
            ),
            // Container(
            //   height: 132,
            //   width: _width-40,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.all(Radius.circular(15)),
            //     color: Color(0xFF1c1c1e),
            //   ),
            //   child: Padding(
            //     padding: const EdgeInsets.only(top: 10,right: 10,left: 10,bottom: 10),
            //     child: Column(
            //       children: [
            //         Row(
            //           children: [
            //             Text("Current Weight",style: GoogleFonts.lato(fontSize: 15,color: Colors.white.withOpacity(0.8)),),
            //           ],
            //         ),
            //         SizedBox(height: 5,),
            //         Row(
            //           children: [
            //             Text("82 kg",style: GoogleFonts.lato(fontSize: 30,color: Color(0xFFff7171),),),
            //           ],
            //         ),
            //         SizedBox(height: 12,),
            //         Stack(
            //           alignment: Alignment.centerLeft,
            //           children: [
            //             Container(
            //               width: _width-60,
            //               height: 7,
            //               decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.all(Radius.circular(15)),
            //                 color: Colors.white.withOpacity(0.2),
            //               ),
            //             ),
            //             Container(
            //               width: (_width-60)*(1-((82-55)/82)),
            //               height: 7,
            //               decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.all(Radius.circular(15)),
            //                   gradient: LinearGradient(
            //                     colors: [
            //                       Color(0xFFff7171),
            //                       Color(0xFFffbb92),
            //                     ],
            //                     begin: FractionalOffset.centerLeft,
            //                     end: FractionalOffset.centerRight,
            //
            //                   )
            //               ),
            //             ),
            //           ],
            //         ),
            //         SizedBox(height: 5,),
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.end,
            //           children: [
            //           Text("55",style: GoogleFonts.lato(fontSize: 18,color:   Color(0xFFffbb92),),),
            //           Text(" kg",style: GoogleFonts.lato(fontSize: 12,color:   Color(0xFFffbb92),),),
            //         ],)
            //       ],
            //     ),
            //   ),
            // ),
            //
            // SizedBox(height: 30,),

            // Container(
            //   height: 400,
            //   width: _width-40,
            //   decoration: BoxDecoration(
            //     color:   Color(0xFF1c1c1e),
            //     borderRadius: BorderRadius.all(Radius.circular(15)),
            //   ),
            //   child: Stack(
            //     children: [
            //       Padding(
            //         padding: const EdgeInsets.only(top: 130,bottom: 40,left: 0,right: 50),
            //         child: Sparkline(
            //           data: data,
            //           sharpCorners: true,
            //           // lineColor: Color(0xFFffbb92),
            //           pointsMode: PointsMode.none,
            //           pointSize: 8.0,
            //           fillMode: FillMode.below,
            //           lineGradient: LinearGradient(
            //             begin: Alignment.centerLeft,
            //             end: Alignment.centerRight,
            //             colors: [
            //               Color(0xFFffbb92),
            //               Color(0xFFff7171),
            //             ],
            //           ),
            //           fillGradient:  LinearGradient(
            //             begin: Alignment.topCenter,
            //             end: Alignment.bottomCenter,
            //             colors: [
            //               Color(0xFF59473c),
            //               Color(0xFF201f20),
            //             ],
            //           ),
            //         ),
            //       ),
            //       Align(
            //         alignment: Alignment.topCenter,
            //         child: SizedBox(
            //           width: _width-40,
            //           child: Padding(
            //             padding: const EdgeInsets.only(top: 15,left: 18,right: 16),
            //             child: Column(
            //               children: [
            //                 Row(
            //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                   children: [
            //                     Text("Weight Change History",style: GoogleFonts.lato(fontSize: 15,color: Colors.white.withOpacity(0.9)),),
            //                     Row(
            //                       mainAxisAlignment: MainAxisAlignment.end,
            //                       children: [
            //                         Text("Update Weight ",style: GoogleFonts.lato(fontSize: 15,color: Colors.white.withOpacity(0.5)),),
            //                         Icon(Icons.arrow_forward,color:Colors.white.withOpacity(0.5),size: 15,)
            //                       ],
            //                     ),
            //                   ],
            //                 ),
            //                 SizedBox(height: 25,),
            //                 Stack(
            //                   alignment: Alignment.bottomCenter,
            //                   children: [
            //                     Row(
            //                       mainAxisAlignment: MainAxisAlignment.center,
            //                       children: [
            //                         Padding(
            //                           padding: const EdgeInsets.only(left: 15,right: 15),
            //                           child: Column(
            //                             children: [
            //                               Text("ALL",style: GoogleFonts.lato(fontSize: 15,color: Colors.white.withOpacity(0.5),fontWeight: FontWeight.bold),),
            //                               SizedBox(height: 10,),
            //                               Container(
            //                                 height: 4,width: 25,
            //                                 decoration: BoxDecoration(
            //                                   // color: Color(0xFFffbb92),
            //                                   borderRadius: BorderRadius.circular(15),
            //                                   color: Colors.transparent,
            //                                 ),
            //                               )
            //                             ],
            //                           ),
            //                         ),
            //                         Padding(
            //                           padding: const EdgeInsets.only(left: 15,right: 15),
            //                           child: Column(
            //                             children: [
            //                               Text("Month",style: GoogleFonts.lato(
            //                                   fontSize: 15 ,
            //                                   // color: Colors.white.withOpacity(0.5),
            //                                 color:  Color(0xFFffbb92),
            //                                   fontWeight: FontWeight.bold,
            //                               ),
            //                               ),
            //                               SizedBox(height: 10,),
            //                               Container(
            //                                 height: 4,width: 25,
            //                                 decoration: BoxDecoration(
            //                                   color: Color(0xFFffbb92),
            //                                   borderRadius: BorderRadius.circular(15),
            //                                 ),
            //                               )
            //                             ],
            //                           ),
            //                         ),
            //                         Padding(
            //                           padding: const EdgeInsets.only(left: 15,right: 15),
            //                           child: Column(
            //                             children: [
            //                               Text("ALL",style: GoogleFonts.lato(fontSize: 15,color: Colors.white.withOpacity(0.5),fontWeight: FontWeight.bold),),
            //                               SizedBox(height: 10,),
            //                               Container(
            //                                 height: 4,width: 25,
            //                                 decoration: BoxDecoration(
            //                                   // color: Color(0xFFffbb92),
            //                                   color: Colors.transparent,
            //                                   borderRadius: BorderRadius.circular(15),
            //                                 ),
            //                               )
            //                             ],
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                     Container(
            //                       color: Colors.white.withOpacity(0.1),
            //                       height: 1,
            //                       width: _width-150,
            //                     )
            //                   ],
            //                 )
            //               ],
            //             ),
            //           ),
            //         ),
            //       ),
            //       Align(
            //         alignment: Alignment.bottomLeft,
            //         child: Padding(
            //           padding: const EdgeInsets.only(left: 15,bottom: 15,right: 50),
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Text("5.9",style: GoogleFonts.lato(color: Colors.white.withOpacity(0.4),fontWeight: FontWeight.bold,fontSize: 14),),
            //               Text("12.9",style: GoogleFonts.lato(color: Colors.white.withOpacity(0.4),fontWeight: FontWeight.bold,fontSize: 14),),
            //               Text("13.9",style: GoogleFonts.lato(color: Colors.white.withOpacity(0.4),fontWeight: FontWeight.bold,fontSize: 14),),
            //               Text("14.9",style: GoogleFonts.lato(color: Colors.white.withOpacity(0.4),fontWeight: FontWeight.bold,fontSize: 14),),
            //               Text("15.9",style: GoogleFonts.lato(color: Colors.white.withOpacity(0.4),fontWeight: FontWeight.bold,fontSize: 14),),
            //               Text("16.9",style: GoogleFonts.lato(color: Colors.white.withOpacity(0.4),fontWeight: FontWeight.bold,fontSize: 14),),
            //             ],
            //           ),
            //         ),
            //       ),
            //       Align(
            //         alignment: Alignment.centerRight,
            //         child: Padding(
            //           padding: const EdgeInsets.only(top: 100,right: 15,bottom: 30),
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Text("100",style: GoogleFonts.lato(color: Colors.white.withOpacity(0.4),fontWeight: FontWeight.bold,fontSize: 14),),
            //               Text("96",style: GoogleFonts.lato(color: Colors.white.withOpacity(0.4),fontWeight: FontWeight.bold,fontSize: 14),),
            //               Text("92",style: GoogleFonts.lato(color: Colors.white.withOpacity(0.4),fontWeight: FontWeight.bold,fontSize: 14),),
            //               Text("88",style: GoogleFonts.lato(color: Colors.white.withOpacity(0.4),fontWeight: FontWeight.bold,fontSize: 14),),
            //               Text("84",style: GoogleFonts.lato(color: Colors.white.withOpacity(0.4),fontWeight: FontWeight.bold,fontSize: 14),),
            //             ],
            //           ),
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: Container(
                width: _width-30,
                height: 320,
                color: Colors.black,
                child: Row(
                  children: [
                    SizedBox(
                      height: 320,
                      width: 30,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: _buildYaxixs(),
                      ),
                    ),
                    SizedBox(
                      height: 320,
                      width: _width-60,
                      child: ListView.builder(
                        itemCount: _listData.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index){
                          return _buildXAxis(
                            weight: double.parse(_listData[index]['weight']),
                            date: _listData[index]['date'],
                          );
                        },
                      )
                    ),
                  ],
                ),
              ),
            ),



            SizedBox(height: 100,),

          ],
        ),
      ),
    );
  }

}

