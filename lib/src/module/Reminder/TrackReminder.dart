import 'package:fitmemax/src/widgets/palette.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrackReminder extends StatefulWidget {

  @override
  _TrackReminderState createState() => _TrackReminderState();
}

class _TrackReminderState extends State<TrackReminder> {
  bool _switchValue=true;
  bool isChecked = false;
  TimeOfDay selectedTime = TimeOfDay.now();
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay picked_s = await showTimePicker(
        context: context,
        initialTime: selectedTime, builder: (BuildContext context, Widget child) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
        child: child,
      );});

    if (picked_s != null && picked_s != selectedTime )
      setState(() {
        selectedTime = picked_s;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,size: 20,color: ColorPalette.PrimaryColor,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text("Track Meal Reminder",style: TextStyles.RegulerBlack,),
        actions: [
          Transform.scale(
            scale: 0.8,
            child: CupertinoSwitch(
              value: _switchValue,
              activeColor: ColorPalette.PrimaryColor,

              onChanged: (value) {
                setState(() {
                  _switchValue = value;
                });
              },
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child:Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 10),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: 'Get reminded to track your meals',style: TextStyles.ParaBoldBlack),
                                TextSpan(text: '\n',style: TextStyles.BodyBlack),
                                TextSpan(text: '\nFood tracking reminders work best when set for 30 min post meal times.Get into habit of having 5 or nore meals daily',style: TextStyles.BodyBlack),
                              ],
                            ),
                          )
                      ),
                      ListView.builder(
                        itemCount: 6,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index){
                          return ListTile(
                            leading: Checkbox(
                              checkColor: Colors.white,
                              activeColor: ColorPalette.PrimaryColor,
                              value: isChecked,
                              onChanged: (value) {
                                setState(() {
                                  isChecked = value;
                                });
                              },
                            ),
                            title: Text("Sanitize Hand",style: TextStyles.RegulerBlack,),
                            subtitle: Text("3 times in a day",style: TextStyles.BodyBlack,),
                            trailing: GestureDetector(
                                onTap: (){
                                  _selectTime(context);
                                  setState(() {

                                  });
                                },
                                child: Text(
                                  "${selectedTime.hour} : ${selectedTime.minute}",style: TextStyle(fontSize: 15,color: Colors.orange[700],fontWeight: FontWeight.bold),)),
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
                  child: ListView.builder(
                    itemCount: 2,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index){
                      return ListTile(
                        leading: Checkbox(
                          checkColor: Colors.white,
                          activeColor: ColorPalette.PrimaryColor,
                          value: isChecked,
                          onChanged: (value) {
                            setState(() {
                              isChecked = value;
                            });
                          },
                        ),
                        title: Text("Remind Me in Every Week",style: TextStyles.BodyBlack,),
                        trailing: GestureDetector(
                            onTap: (){
                              _selectTime(context);
                              setState(() {

                              });
                            },
                            child: Text(
                              "${selectedTime.hour} : ${selectedTime.minute}",style: TextStyle(fontSize: 15,color: Colors.orange[700],fontWeight: FontWeight.bold),)),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 100,
                ),

              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: MaterialButton(
                height: 50,
                child: Text("Save",style: TextStyles.RegulerBIGWhite,),
                color: ColorPalette.PrimaryColor,
                onPressed:(){

                } ),
          ),
        ],
      ),
    );
  }
}
