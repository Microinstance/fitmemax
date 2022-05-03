import 'package:fitmemax/API/APIClient.dart';
import 'package:fitmemax/Objects/Backgrounds.dart';
import 'package:fitmemax/Objects/ButtonOne.dart';
import 'package:fitmemax/src/module/Authentication/Onboarding/FitBookDetailsUpload.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../../dashboard/Dashboard.dart';
import 'MedicalCondition.dart';

class GoalChoice extends StatefulWidget {

  @override
  _GoalChoiceState createState() => _GoalChoiceState();
}

class _GoalChoiceState extends State<GoalChoice> {

  APIClient client;
  var goal = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    client = new APIClient();
    getGoal();
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
                              'Goal',
                              style: TextStyles.HeadingBlack,
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 20,right: 12),
                        child: Column(
                            children: List.generate(goal.length, (index) => SwitchList(titel: goal[index]['title'], id: goal[index]['id'].toString(), type: "goal",))
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
    );
  }

  getGoal() async {
    final result = await client.getGoalMaster();
    print(result);
    setState(() {
      goal = result['data'];
    });
  }

  goNext() async {
    final currentUser = await client.getLocal();

    final findGoal = await client.isGoalSet({'users_id' : currentUser['id'].toString()});
    if(findGoal['status'] == "success"){

      final sendQuery = await client.getProfileStatus(currentUser['id'].toString());
      final data = sendQuery['data'];
      final fitbookID = data['is_fitbook_id_set'];

      if(fitbookID == 0) {
        Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: FitBookDetailsUpload()));
      } else {
        Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: Dashboard()));
      }

    } else {
      client.error("Please Select One Of The Listed Goal");
    }

  }


}
