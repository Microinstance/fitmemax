import 'package:fitmemax/src/data/data2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FastSettings extends StatefulWidget {
  @override
  _FastSettingsState createState() => _FastSettingsState();
}

class _FastSettingsState extends State<FastSettings> {
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
        title: Text("Settings",style: GoogleFonts.lato(fontSize: 22,color: Colors.white),),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,top: 15,bottom: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.5),
                  color: Color(0xFF1c1c1e),
                ),
                child: GridView.count(
                  shrinkWrap: true,
                  childAspectRatio: 2/1.3,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  scrollDirection: Axis.vertical,
                  children: List.generate(Data().FastDashboard.length, (index) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(Data().FastDashboard[index]['titel'],style: TextStyle(fontSize: 12,color: Colors.white60),),
                      SizedBox(
                        height: 5,
                      ),
                      Text(Data().FastDashboard[index]['Value'],style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                    ],
                  ))
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:15,right: 15,bottom: 20),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    height: 130,
                    width: _width-40,
                    decoration: BoxDecoration(
                      color:  Color(0xFF1c1c1e),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Upgrade to Premium",style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,),),
                          SizedBox(height: 7,),
                          SizedBox(
                            width: _width-40-30-50,
                            child: Row(
                              children: [
                                Flexible(
                                  child: Text("Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latiin Virginia",style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,),),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Image.asset("assets/calori/premium.gif",height: 80,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,bottom: 20),
              child: Row(
                children: [
                  Text("Recent Fast",style: TextStyle(fontSize: 18,color: Colors.white),),
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
                          child: Center(child: Text("5.8h",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),))),
                      title: Text("Circadian Rhythm TRF",style: TextStyle(fontSize: 16,color: Colors.white,),),
                      subtitle: Text("Start - 09:00",style: TextStyle(fontSize: 16,color: Colors.white,),),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
