import 'package:fitmemax/Graph/BarChart.dart';
import 'package:fitmemax/src/ListData/ListData.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';



class Mood extends StatefulWidget {
  @override
  _MoodState createState() => _MoodState();
}

class _MoodState extends State<Mood> {
  int selectedIndex = 3;
  int selectedIndex2 = 0;
  bool showText = false;
  bool showText2 = false;
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFf6f6f6),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 200,
                  width: _width,
                  decoration: BoxDecoration(
                    color: Color(0xFF5a4fd8),
                  ),
                ),
                Positioned(
                  top: -10,
                    left: -1,
                    child: Image.asset("assets/others/o01.png",height: 170,fit: BoxFit.contain,)),
                Positioned(
                  bottom: -1,
                    right: -1,
                    child: Image.asset("assets/others/o02.png",height: 170,fit: BoxFit.contain,)),
                SafeArea(
                  child: IconButton(onPressed: (){
                    Navigator.pop(context);
                  },
                      icon: Icon(Icons.arrow_back,color: Colors.white,size: 20,)),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Mood Tracker",style: TextStyles.HeadingWhite,),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: -80,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30,right: 30),
                    child: Container(
                      height: 180,
                      width: _width-60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: borderRadious.secendaryRadious,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.06),
                            blurRadius: 15,
                            spreadRadius: 10,
                          )
                        ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Hi Richa,\nHow is your mood this morning?",style: TextStyles.TitleBlack,),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: List.generate(4, (index) => emotionMood(
                                  face: index,
                                  isSelected: selectedIndex == index ? true : false,
                                  onTap: () {
                                    print("object");
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                    showModalBottomSheet(
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      isDismissible: true,
                                      isScrollControlled: true,
                                      builder: (BuildContext context) {
                                        return Padding(
                                          padding: MediaQuery.of(context).viewInsets,
                                          child: _textData(),
                                        );
                                      },

                                    );
                                  },
                                ))
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
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
            MoodGraph(
              listData: Data().mood,
              color1:  ColorPalette.GrediantRed1,
              color2:  ColorPalette.GrediantRed2,
              Titel: "BPM",
              Dec: "Bpm",
            ),
            Padding(
              padding: const EdgeInsets.only(left:30,right: 30,top: 0),
              child: Text("Today Check",style: TextStyles.TitleBlack,),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Container(
                width: _width-60,
                decoration: BoxDecoration(
                  borderRadius: borderRadious.secendaryRadious,
                  color: Color(0xFFfe9669),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15,bottom: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Morning Check In : Very Good",style: TextStyles.RegulerBIGWhite,),
                            GestureDetector(
                                onTap: (){
                                  setState(() {
                                    showText ? showText = false : showText = true;
                                  });
                                },
                                child: Icon(Icons.arrow_circle_down_rounded ,color: Colors.white,)),
                          ],
                        ),
                      ),
                      showText? Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text("lThe Morning Review is your first look at the headlines in today's daily paper, The Spokesman-Review, which has been covering Spokane for 135 years.",style: TextStyles.ParaWhite,),
                      ) : SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25,bottom: 30),
              child: Container(
                width: _width-60,
                decoration: BoxDecoration(
                  borderRadius: borderRadious.secendaryRadious,
                  color: Color(0xFF574ed0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15,bottom: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Evening Check In : Very Good",style: TextStyles.RegulerBIGWhite,),
                            GestureDetector(
                                onTap: (){
                                  setState(() {
                                    showText2 ? showText2 = false : showText2 = true;
                                  });
                                },
                                child: Icon(Icons.arrow_circle_down_rounded ,color: Colors.white,)),
                          ],
                        ),
                      ),
                      showText2? Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text("lThe Morning Review is your first look at the headlines in today's daily paper, The Spokesman-Review, which has been covering Spokane for 135 years.",style: TextStyles.ParaWhite,),
                      ) : SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _graphButton({bool isSelected,String Titel,Function onTap}){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        decoration: BoxDecoration(
            borderRadius: borderRadious.secendaryRadious,
          color: isSelected ? Color(0xFF5a4fd8) :Colors.white,
          border: Border.all(
            color: isSelected ? Colors.transparent:  Color(0xFF5a4fd8),
          )
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 6,bottom: 8,left: 15,right: 15),
          child: Text(Titel,style: isSelected ? TextStyles.ParaWhite :TextStyles.ParaBlack,textAlign: TextAlign.center,),
        ),
      ),
    );
  }
}
class emotionMood extends StatefulWidget {

  bool isSelected;
  int face;
  Function onTap;

  emotionMood({this.face,this.isSelected,this.onTap});

  @override
  _emotionMoodState createState() => _emotionMoodState();
}

class _emotionMoodState extends State<emotionMood> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:  widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: borderRadious.secendaryRadious,
          color:widget.isSelected? Color(0xFF5a4fd8) : Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:  _column(widget.face),
        ),
      ),
    );
  }
 Widget _column(int x) {

    switch (x) {
      case 0:
     return Column(
       children: [
         Text("Very Bad",style: widget.isSelected? TextStyles.BodyWhite : TextStyles.BodyBlack,),
         Padding(
           padding: const EdgeInsets.only(top: 5),
           child: Icon(
             Icons.sentiment_very_dissatisfied,
             color: Colors.red,
             size: 35,
           ),
         ),
       ],
     );
        break;
      case 1:
        return Column(
          children: [
            Text("Very Bad",style: widget.isSelected? TextStyles.BodyWhite : TextStyles.BodyBlack,),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Icon(
                Icons.sentiment_neutral,
                color: Colors.amber,
                size: 35,
              ),
            ),
          ],
        );
        break;
      case 2:
        return Column(
          children: [
            Text("Bad",style: widget.isSelected? TextStyles.BodyWhite : TextStyles.BodyBlack,),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Icon(
                Icons.sentiment_satisfied,
                color: Colors.lightGreen,
                size: 35,
              ),
            ),
          ],
        );
        break;
      case 3:
        return Column(
          children: [
            Text("Very Good",style: widget.isSelected? TextStyles.BodyWhite : TextStyles.BodyBlack,),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Icon(
                Icons.sentiment_very_satisfied,
                color: Colors.green,
                size: 35,
              ),
            ),
          ],
        );
        break;
    }
  }
}
class _textData extends StatefulWidget {

  @override
  _textDataState createState() => _textDataState();
}

class _textDataState extends State<_textData> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.black,
      constraints: BoxConstraints(
        maxHeight: _height*0.7,
      ),
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 30, top: 10),
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: (_width - 80) / 2, right: (_width - 80) / 2, bottom: 15),
            child: Container(
              height: 7,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Text(
            "Exercise Category",
            style: TextStyles.RegulerBIGWhite,
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: _width-40,
            height: 45,
            child: Container(
              padding: EdgeInsets.only(
                top: 8,
                bottom: 8,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.white.withOpacity(0.5),
                ),
                borderRadius: borderRadious.primeryRadious,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: TextField(
                  onChanged: (x) {},
                  autofocus: false,

                  style: TextStyles.ParaWhite,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      isDense: true,
                      hintText: 'Enter Experience',
                      hintStyle: TextStyles.RegulerBIGWhite,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 15,right: 15,top: 6,bottom: 5)
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20,bottom: 0),
            child: MaterialButton(
                height: 45,
                child: Text("Save",style: TextStyles.RegulerBIGWhite,),
                color: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.5),
                ),
                onPressed:(){
                  Navigator.pop(context);
                } ),
          ),
          SafeArea(child: SizedBox()),
        ],
      ),
    );
  }
}
