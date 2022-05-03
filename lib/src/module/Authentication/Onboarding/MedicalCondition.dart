import 'package:fitmemax/API/APIClient.dart';
import 'package:fitmemax/Objects/Backgrounds.dart';
import 'package:fitmemax/Objects/ButtonOne.dart';
import 'package:fitmemax/src/module/Authentication/Onboarding/FitBookDetailsUpload.dart';
import 'package:fitmemax/src/module/Authentication/Onboarding/GoalChoice.dart';
import 'package:fitmemax/src/module/dashboard/Dashboard.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';


class MedicalCondition extends StatefulWidget {
  @override
  _MedicalConditionState createState() => _MedicalConditionState();
}

class _MedicalConditionState extends State<MedicalCondition> {

  APIClient Client;
  var medicalCondition = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Client = new APIClient();
    getMedicalConditionMaster();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Backgrounds(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Container(
                  width: _width * 0.6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Image.asset(
                          'assets/logo/splash-Screen.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 5.0,
                      spreadRadius: 5.0,
                    ),
                  ],
                  borderRadius: borderRadious.primeryRadious,
                ),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  removeBottom: true,
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15,bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Medical Condition',
                              style: TextStyles.HeadingBlack,
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 20,right: 12),
                        child: Column(
                          children: List.generate(medicalCondition.length, (index) => SwitchList(titel: medicalCondition[index]['title'], id: medicalCondition[index]['id'].toString(), type: "medicalCondition",))
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: _width-90,
                              child: ButtonOne(
                                title: 'Continue',
                                colors: ColorPalette.PrimaryColor,
                                onPressed: goNext,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );;
  }

  goNext() async {
    final currentUser = await Client.getLocal();

    final findMedicalCondition = await Client.isMedicalConditionSet({'users_id' : currentUser['id'].toString()});
    if(findMedicalCondition['status'] == "success"){

      final sendQuery = await Client.getProfileStatus(currentUser['id'].toString());
      final data = sendQuery['data'];

      final gole = data['gole'];
      final fitbookID = data['is_fitbook_id_set'];

      if(gole == 0){
        Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: GoalChoice()));
      } else if(fitbookID == 0) {
        Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: FitBookDetailsUpload()));
      } else {
        Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: Dashboard()));
      }

    } else {
      Client.error("Please Select One Of The Listed Medical Condition");
    }

  }

  getMedicalConditionMaster() async {
    final result = await Client.getMedicalConditionMaster();
    setState(() {
      medicalCondition = result['data'];
      print(result['data']);
    });
  }


}
class SwitchList extends StatefulWidget {
  final String titel;
  final String id;
  final String type;
  SwitchList({this.titel, this.id, this.type});
  @override
  _SwitchListState createState() => _SwitchListState();
}

class _SwitchListState extends State<SwitchList> {

  bool _isOnline =  false;
  APIClient client;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    client = new APIClient();
  }

  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
            widget.titel,
            style: TextStyles.RegulerBlack
        ),
        Transform.scale(
          scale: 0.7,
          child: CupertinoSwitch(
            activeColor: ColorPalette.PrimaryColor,
            trackColor: ColorPalette.PrimaryColor.withOpacity(0.2),
            value: _isOnline,
            onChanged: (bool value) async {
              if(widget.type == "medicalCondition"){
                if(value){
                  await updateMedicalCondition(widget.id);
                } else {
                  await removeMedicalCondition(widget.id);
                }
              } else {
                if(value){
                  await updateGoal(widget.id);
                } else {
                  await removeGoal(widget.id);
                }
              }
              setState(() {
                _isOnline = value;
              });
            },
          ),
        ),
      ],
    );
  }

  updateMedicalCondition(conditionMaster) async {
    final currentUser = await client.getLocal();
    final result = await client.storeMedicalCondition({
      'users_id' : currentUser['id'].toString(),
      'medical_condition_master_id' :  conditionMaster
    });
  }

  removeMedicalCondition(conditionMaster) async {
    final currentUser = await client.getLocal();
    final result =  await client.removeMedicalCondition({
      'users_id' : currentUser['id'].toString(),
      'medical_condition_master_id' :  conditionMaster
    });
  }

  updateGoal(conditionMaster) async {
    final currentUser = await client.getLocal();
    final result = await client.storeGoal({
      'users_id' : currentUser['id'].toString(),
      'goal_master_id' :  conditionMaster
    });
    client.debug(result);
  }

  removeGoal(conditionMaster) async {
    final currentUser = await client.getLocal();
    final result =  await client.removeGoal({
      'users_id' : currentUser['id'].toString(),
      'goal_master_id' :  conditionMaster
    });
    client.debug(result);
  }

}
