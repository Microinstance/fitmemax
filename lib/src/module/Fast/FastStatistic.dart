import 'package:fitmemax/Graph/BarChart.dart';
import 'package:fitmemax/src/ListData/ListData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FastStatistic extends StatefulWidget {
  @override
  _FastStatisticState createState() => _FastStatisticState();
}

class _FastStatisticState extends State<FastStatistic> {

  List _monthsListWeight = ['March 21', 'April 21', 'May 21', 'June 21'];
  List _monthsListSleep = ['March 21', 'April 21', 'May 21', 'June 21'];
  String _monthsValueWeight;
  String _monthsValueSleep;
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
              padding: const EdgeInsets.only(left: 20,right: 20,top: 15,bottom: 15),
              child: Row(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 90,
                        width: 90,
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
                        radius: 42,
                        child: CircleAvatar(
                          radius: 39,
                          backgroundColor: Colors.black,
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
                          padding: const EdgeInsets.only(left: 15,bottom: 5),
                          child: Row(
                            children: [
                              Text("Jasmin Decosta",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.white),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15,bottom: 15,right: _width*0.1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              MaterialButton(
                                onPressed: (){},
                                height: 25,
                                color: Color(0xFFff7171),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5,right: 2,bottom: 7,top: 7),
                                  child: Row(
                                    children: [
                                      Text("Go Premium",style: GoogleFonts.lato(fontSize: 14,color:Colors.white,fontWeight: FontWeight.bold ),),
                                      SizedBox(width: 7,),
                                      Icon(Icons.whatshot,color: Colors.white,size: 22,),
                                    ],
                                  ),
                                ),
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
              padding: const EdgeInsets.only(left: 15,right: 15,top: 0,bottom: 25),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.5),
                  color: Colors.transparent,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15,right: 10),
                  child: GridView.count(
                      shrinkWrap: true,
                      childAspectRatio: 2/1.3,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 3,
                      scrollDirection: Axis.vertical,
                      children: List.generate(Data().FastDashboard.length, (index) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(Data().FastDashboard[index]['titel'],style: TextStyle(fontSize: 14,color: Colors.white),),
                          SizedBox(
                            height: 5,
                          ),
                          Text(Data().FastDashboard[index]['Value'],style: TextStyle(fontSize: 22,color:  Color(0xFFffbb92),fontWeight: FontWeight.bold),),
                        ],
                      ))
                  ),
                ),
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
                            value: _monthsValueWeight,
                            items: _monthsListWeight.map((value) {
                              return DropdownMenuItem(
                                value: value,
                                child:Text(value,style: TextStyle(fontSize: 15,color: Colors.white),),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _monthsValueWeight = value;
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
            Padding(
              padding: const EdgeInsets.only(left: 15,bottom: 25,right: 15,top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.cyanAccent.withOpacity(0.15),
                        radius: 15,
                        child: Icon(Icons.stacked_bar_chart,color: Colors.cyanAccent,size: 20,),
                      ),
                      SizedBox(width: 10,),
                      Text("Sleep Hours",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
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
                            value: _monthsValueSleep,
                            items: _monthsListSleep.map((value) {
                              return DropdownMenuItem(
                                value: value,
                                child:Text(value,style: TextStyle(fontSize: 15,color: Colors.white),),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _monthsValueSleep = value;
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
              color1: Colors.cyanAccent,
              color2: Colors.cyan,
              Dec: "Sleep Hours",
              Titel: "Sleep",
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,bottom: 25,right: 15,top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.greenAccent.withOpacity(0.15),
                        radius: 15,
                        child: Icon(Icons.stacked_bar_chart,color: Colors.greenAccent,size: 20,),
                      ),
                      SizedBox(width: 10,),
                      Text("Glucose Levels",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
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
                            value: _monthsValueSleep,
                            items: _monthsListSleep.map((value) {
                              return DropdownMenuItem(
                                value: value,
                                child:Text(value,style: TextStyle(fontSize: 15,color: Colors.white),),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _monthsValueSleep = value;
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
              color1: Colors.greenAccent,
              color2: Colors.lightGreenAccent,
              Dec: "Glucose Level",
              Titel: "Glucose",
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,bottom: 15,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0xFFffbb92).withOpacity(0.15),
                        radius: 15,
                        child: Icon(Icons.history,color: Color(0xFFffbb92),size: 20,),
                      ),
                      SizedBox(width: 10,),
                      Text("Fast History",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 6,
                itemBuilder: (BuildContext context, int index){
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: ListTile(
                      leading: CircleAvatar(
                          radius: 25,
                          backgroundColor: Color(0xFF1c1c1e),
                          child: Center(child: Text("5.8h",style: TextStyle(fontSize: 16,color: Color(0xFFffbb92),fontWeight: FontWeight.bold),))),
                      title: Text("Circadian Rhythm TRF",style: TextStyle(fontSize: 16,color: Colors.white,),),
                      subtitle: Text("Start - 09:00 02:06:21",style: TextStyle(fontSize: 12,color: Colors.white,),),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 100,),
          ],
        ),
      ),
    );
  }

}

