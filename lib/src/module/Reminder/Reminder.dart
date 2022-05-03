import 'package:fitmemax/src/module/Reminder/TrackReminder.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Reminder extends StatefulWidget {
  @override
  _ReminderState createState() => _ReminderState();
}

class _ReminderState extends State<Reminder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,size: 20,color: ColorPalette.PrimaryColor,), onPressed: () {  },
        ),
        title: Text("Reminders",style: TextStyles.RegulerBlack,),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child:Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 10),
                    child: Row(
                      children: [
                        Text("Active Reminders",style: TextStyles.ParaBoldBlack,),
                      ],
                    ),
                  ),
                  ListView.builder(
                    itemCount: 6,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index){
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey[100],
                          radius: 22,
                        ),
                        title: Text("Sanitize Hand",style: TextStyles.RegulerBlack,),
                        subtitle: Text("3 times in a day",style: TextStyles.BodyBlack,),
                        trailing: GestureDetector(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      child: TrackReminder()));
                            },
                            child: Text("Edit",style: TextStyle(fontSize: 20,color: Colors.orange[700],fontWeight: FontWeight.bold),)),
                      );
                    },
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 25,
              color: Colors.black.withOpacity(0.05),
            ),
            Container(
              child:Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 10),
                    child: Row(
                      children: [
                        Text("Active Reminders",style: TextStyles.ParaBoldBlack,),
                      ],
                    ),
                  ),
                  ListView.builder(
                    itemCount: 6,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index){
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey[100],
                          radius: 22,
                        ),
                        title: Text("Sanitize Hand",style: TextStyles.RegulerBlack,),
                        subtitle: Text("3 times in a day",style: TextStyles.BodyBlack,),
                        trailing: Text("Edit",style: TextStyle(fontSize: 20,color: Colors.orange[700],fontWeight: FontWeight.bold),),
                      );
                    },
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),

          ],
        ),
      ),
    );
  }
}
