
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';

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
      height: 600,
      decoration: BoxDecoration(
        color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 5,left: 10,right: 10),
              child: CalendarTimeline(
                initialDate: DateTime(2020, 11, 08),
                firstDate: DateTime(2020, 11, 01),
                lastDate: DateTime(2020, 11, 31),
                onDateSelected: (date) => print(date),
                leftMargin: 1,
                monthColor: Colors.redAccent,
                dayColor: Colors.red[500],
                activeDayColor: Colors.white,
                activeBackgroundDayColor:  Colors.red[500],
                dotsColor:Colors.white,
                selectableDayPredicate: (date) => date.day != 23,
                locale: 'en_ISO',
              ),
            ),
          ),


         Container(
           height: 415,
           child: MediaQuery.removePadding(
             context: context,
             removeTop: true,
             child: ListView(
               children: [
                 ExpansionTile(
                   title: Text(
                     "Morning Slot",
                     style: TextStyle(
                       color: Colors.black,
                       fontSize: 20,
                       letterSpacing: 1
                     ),
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
                 ),
                 SizedBox(height: 10,),
                 ExpansionTile(
                   title: Text(
                     "Morning Slot",
                     style: TextStyle(
                         color: Colors.black,
                         fontSize: 20,
                         letterSpacing: 1
                     ),
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
                 ),
                 SizedBox(height: 10,),
                 ExpansionTile(
                   title: Text(
                     "Morning Slot",
                     style: TextStyle(
                         color: Colors.black,
                         fontSize: 20,
                         letterSpacing: 1
                     ),
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
                 ),
                 SizedBox(height: 10,),
                 ExpansionTile(
                   title: Text(
                     "Morning Slot",
                     style: TextStyle(
                         color: Colors.black,
                         fontSize: 20,
                         letterSpacing: 1
                     ),
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
                 ),
               ],
             ),
           ),
         ),
          SizedBox(
            width: _width,
            height: 65,
            child: RaisedButton(
              onPressed: (){},
              // shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(15)),
              color: Colors.red[700],
              child: Text("Book A Free Call",style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.w500,fontFamily: 'Roboto'),),
            ),
          ),
        ],
      ),
    );
  }
}
