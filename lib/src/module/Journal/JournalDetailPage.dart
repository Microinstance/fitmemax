import 'package:fitmemax/Graph/BarChart.dart';
import 'package:fitmemax/src/ListData/ListData.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';

class JournalDetailPage extends StatefulWidget {

  @override
  _JournalDetailPageState createState() => _JournalDetailPageState();
}

class _JournalDetailPageState extends State<JournalDetailPage> {
  int selectedIndex2 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF191a1f),
      appBar: AppBar(
        backgroundColor: Color(0xFF191a1f),
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,color: Colors.white,size: 20,),
        ),
        title: Text("Bench Press",style: TextStyles.HeadingWhite,),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15,left: 30,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(2, (index) => Padding(
                  padding: EdgeInsets.only(right: (index==0)?20:0),
                  child: _graphButton(
                    isSelected:  selectedIndex2 == index ? true : false,
                    Titel:(index == 0 ) ?"Month" : "Year",
                    onTap: () {
                      print("object");
                      setState(() {
                        selectedIndex2 = index;
                      });
                    },
                  ),
                ),
                ),),
            ),
            JournalGRaph(
              listData: Data().Walking,
              Titel: "Weight",
              Dec: "Weight",
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 25),
              child: Row(
                children: [
                  Opacity(
                      opacity:0.5,
                      child: Text("History",style: TextStyles.ParaWhite,)),

                ],
              ),
            ),
            Column(
              children: List.generate(20, (index) => Padding(
                padding: const EdgeInsets.only(left: 15,right: 15,bottom: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Bench Press",style: TextStyles.RegulerBIGWhite,),
                            Opacity(
                                opacity: 0.5,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 3,top: 3),
                                  child: Text("11 December 2021",style: TextStyles.BodySmallWhite,),
                                )),
                          ],
                        ),
                        Spacer(),
                        Text("80 Kg",style: TextStyles.RegulerBIGWhite,),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Divider(
                      color: Colors.white.withOpacity(0.2),
                    ),
                  ],
                ),
              ),),
            )
          ],
        ),
      ),
    );
  }
  Widget _graphButton({bool isSelected,String Titel,Function onTap}){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Column(
          children: [
            Opacity(
                opacity:isSelected? 1 : 0.5,
                child: Text(Titel,style: TextStyles.ParaWhite,)),
            Padding(
              padding: const EdgeInsets.only(top: 7),
              child: Container(
                height: 4,
                width: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:  isSelected? ColorPalette.FluracentGreen : Colors.transparent,
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
