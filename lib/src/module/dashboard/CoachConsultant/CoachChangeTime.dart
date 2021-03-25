import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_date_picker_timeline/flutter_date_picker_timeline.dart';

class CoachChangeTime extends StatefulWidget {
  @override
  _CoachChangeTimeState createState() => _CoachChangeTimeState();
}

class _CoachChangeTimeState extends State<CoachChangeTime> {

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Container(
     constraints: BoxConstraints(
       maxHeight: _height*0.7,
     ),
      decoration: BoxDecoration(
        color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(7.5),topRight: Radius.circular(7.5))
      ),
      child: ListView(
        shrinkWrap: true,
        children: [
          Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.only(top: 11, bottom: 11),
              decoration: BoxDecoration(
                color: ColorPalette.GreyLightest,
              ),
              child: FlutterDatePickerTimeline(
                startDate: DateTime(2021, 01, 01),
                endDate: DateTime(2021, 12, 00),
                initialSelectedDate: DateTime.now(),
                selectedItemBackgroundColor: ColorPalette.PrimaryColor,
                selectedItemTextStyle: TextStyles.RegulerBIGWhite,
                onSelectedDateChange: (DateTime dateTime) {
                  print(dateTime);
                },
              ),
          ),
          Container(
           child: MediaQuery.removePadding(
             context: context,
             removeTop: true,
             child: ListView(
               physics: NeverScrollableScrollPhysics(),
               shrinkWrap: true,
               children: List.generate(4, (index) => ExpansionTile(
                 title: Text(
                   "Morning Slot",
                   style: TextStyles.RegulerBlack
                 ),
                 children: [
                   ListView.builder(
                       physics :NeverScrollableScrollPhysics(),
                       shrinkWrap: true,
                       itemCount: 5,
                       itemBuilder: (BuildContext context, int index){
                         return   ListTile(
                           title: Text("08:05 am -08:20am"),
                           trailing: Checkbox(
                             value: false,
                             onChanged: (x){},
                             activeColor: Colors.red,
                             checkColor: Colors.white,
                             // focusColor: Colors.red,
                           ),
                         );
                       }
                   )
                 ],
               ),)
             ),
           ),
         ),
          // SizedBox(
          //   width: _width,
          //   height: 65,
          //   child: RaisedButton(
          //     onPressed: (){},
          //     // shape: RoundedRectangleBorder(
          //     //     borderRadius: BorderRadius.circular(15)),
          //     color: Colors.red[700],
          //     child: Text("Book A Free Call",style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.w500,fontFamily: 'Roboto'),),
          //   ),
          // ),
        ],
      ),
    );
  }
}
