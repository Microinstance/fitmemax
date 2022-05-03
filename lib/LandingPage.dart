import 'package:fitmemax/API/APIClient.dart';
import 'package:fitmemax/src/module/BattleGround/BattleGround.dart';
import 'package:fitmemax/src/module/BattleGround/BattleGroundGroup/BattleGroundGroup.dart';
import 'package:fitmemax/src/module/dashboard/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:fitmemax/src/module/Authentication/SigninPage.dart';
import 'package:page_transition/page_transition.dart';

import 'src/module/Authentication/Onboarding/FitBookDetailsUpload.dart';
import 'src/module/Authentication/Onboarding/GoalChoice.dart';
import 'src/module/Authentication/Onboarding/MedicalCondition.dart';
import 'src/module/Authentication/Onboarding/PhysicalCondition.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  APIClient Client;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Client = new APIClient();
    isLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  isLogin() async {
    if(await Client.isLogin()){

      final currentUser = await Client.getLocal();
      final sendQuery = await Client.getProfileStatus(currentUser['id'].toString());
      final data = sendQuery['data'];

      final physical_condition = data['physical_condition'];
      final medical_condition = data['medical_condition'];
      final gole = data['gole'];
      final fitbookID = data['is_fitbook_id_set'];

      if(physical_condition == 0){
        Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: PhysicalCondition()));
      } else if(medical_condition == 0){
        Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: MedicalCondition()));
      } else if(gole == 0){
        Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: GoalChoice()));
      } else if(fitbookID == 0) {
        Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: FitBookDetailsUpload()));
      } else {
        Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: Dashboard()));
      }

    } else {
      Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: SigninPage()));
    }
  }

}
