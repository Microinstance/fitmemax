import 'package:delayed_display/delayed_display.dart';
import 'package:fitmemax/src/module/others/ReferEarn.dart';
import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';

import '../Notifications.dart';
import 'AccountInformation.dart';
import 'ChangePassword.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    final Duration initialDelay = Duration(milliseconds: 250);
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,size: 20,), onPressed: (){
          Navigator.pop(context);
        }),
        title: Text("Settings",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black,fontSize: 20),),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            DelayedDisplay(
              slidingBeginOffset: Offset(0.35, 0),
              delay: initialDelay,
              child: Padding(
                padding: EdgeInsets.only(left: 15,right: 15,top: 0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.5),
                                color: Palette.x1Color,
                              image: DecorationImage(
                                image: AssetImage("images/userImage5.jpeg"),
                                fit: BoxFit.cover,
                              )
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Shivay",
                                style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text("Member Since 1 Jan 2021",
                                style: TextStyle(color: Colors.black.withOpacity(0.5),fontSize: 12,),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: AccountInformation()));
                                    },
                                    child: Text("Edit Profile",
                                      style: TextStyle(color: Colors.black.withOpacity(0.9),fontSize: 14,),
                                    )),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,bottom: 15,top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Account",
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20)
                  )
                ],
              ),
            ),
            DelayedDisplay(
              delay: Duration(milliseconds: initialDelay.inMilliseconds + 100),
              child: ListTile(
                title: Text("Change Password",
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black)
                ),
                leading: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Palette.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(7.5),
                    ),
                    child: Center(child: Icon(Icons.vpn_key,size: 25,color: Palette.primaryColor,))),
                trailing: IconButton(
                  onPressed: (){
                    Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: ChangePassword()));
                  },
                  icon: Icon(Icons.arrow_forward_ios_rounded,size: 20,
                    // color: Palette.GreyDarkest,
                  ),
                ),
              ),
            ),
            DelayedDisplay(
              delay: Duration(milliseconds: initialDelay.inMilliseconds + 200),
              child: ListTile(
                title: Text("Notifications",
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black)
                ),
                leading: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Palette.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(7.5),
                    ),
                    child: Center(child: Icon(Icons.notifications_active_outlined,size: 25,color: Palette.primaryColor,))),
                trailing: IconButton(
                  onPressed: (){
                    Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: Notifications()));
                  },
                  icon: Icon(Icons.arrow_forward_ios_rounded,size: 20,
                    // color: Palette.GreyDarkest,
                  ),
                ),
              ),
            ),
            DelayedDisplay(
              delay: Duration(milliseconds: initialDelay.inMilliseconds + 300),
              child: ListTile(
                title: Text("Refer & Earn",
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black)
                ),
                leading: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Palette.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(7.5),
                    ),
                    child: Center(child: Icon(Icons.share,size: 25,color: Palette.primaryColor,))),
                trailing: IconButton(
                  onPressed: (){
                    Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: ReferEarn()));
                  },
                  icon: Icon(Icons.arrow_forward_ios_rounded,size: 20,
                    // color: Palette.GreyDarkest,
                  ),
                ),
              ),
            ),
            DelayedDisplay(
              delay: Duration(milliseconds: initialDelay.inMilliseconds + 400),
              child: ListTile(
                title: Text("Become a Partner",
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black)
                ),
                leading: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Palette.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(7.5),
                    ),
                    child: Center(child: Icon(Icons.people_alt_outlined,size: 25,color: Palette.primaryColor,))),
                trailing: IconButton(
                  onPressed: (){
                    // Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: ChangePassword()));
                  },
                  icon: Icon(Icons.arrow_forward_ios_rounded,size: 20,
                    // color: Palette.GreyDarkest,
                  ),
                ),
              ),
            ),
            DelayedDisplay(
              delay: Duration(milliseconds: initialDelay.inMilliseconds + 500),
              child: ListTile(
                title: Text("Personal Information",
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black)
                ),
                leading: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Palette.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(7.5),
                    ),
                    child: Center(child: Icon(Icons.people_alt_outlined,size: 25,color: Palette.primaryColor,))),
                trailing: IconButton(
                  onPressed: (){
                    // Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: ChangePassword()));
                  },
                  icon: Icon(Icons.arrow_forward_ios_rounded,size: 20,
                    // color: Palette.GreyDarkest,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,bottom: 15,top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                      "General",
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20)
                  )
                ],
              ),
            ),
            DelayedDisplay(
              delay: Duration(milliseconds: initialDelay.inMilliseconds + 600),
              child: ListTile(
                title: Text("Terms of Service",
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black)
                ),
                leading: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Palette.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(7.5),
                    ),
                    child: Center(child: Icon(Icons.account_tree_outlined,size: 25,color: Palette.primaryColor,))),
                trailing: IconButton(
                  onPressed: (){
                    // Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: ChangePassword()));
                  },
                  icon: Icon(Icons.arrow_forward_ios_rounded,size: 20,
                    // color: Palette.GreyDarkest,
                  ),
                ),
              ),
            ),
            DelayedDisplay(
              delay: Duration(milliseconds: initialDelay.inMilliseconds + 700),
              child: ListTile(
                title: Text("Privacy Policy",
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black)
                ),
                leading: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Palette.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(7.5),
                    ),
                    child: Center(child: Icon(Icons.info_outline,size: 25,color: Palette.primaryColor,))),
                trailing: IconButton(
                  onPressed: (){
                    // Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: ChangePassword()));
                  },
                  icon: Icon(Icons.arrow_forward_ios_rounded,size: 20,
                    // color: Palette.GreyDarkest,
                  ),
                ),
              ),
            ),
            DelayedDisplay(
              delay: Duration(milliseconds: initialDelay.inMilliseconds + 800),
              child: ListTile(
                title: Text("Help Center",
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black)
                ),
                leading: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Palette.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(7.5),
                    ),
                    child: Center(child: Icon(Icons.help_outline_rounded,size: 25,color: Palette.primaryColor,))),
                trailing: IconButton(
                  onPressed: (){
                    // Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: ChangePassword()));
                  },
                  icon: Icon(Icons.arrow_forward_ios_rounded,size: 20,
                    // color: Palette.GreyDarkest,
                  ),
                ),
              ),
            ),
            DelayedDisplay(
              delay: Duration(milliseconds: initialDelay.inMilliseconds + 900),
              child: ListTile(
                title: Text("About Us",
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black)
                ),
                leading: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Palette.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(7.5),
                    ),
                    child: Center(child: Icon(Icons.account_balance_outlined,size: 25,color: Palette.primaryColor,))),
                trailing: IconButton(
                  onPressed: (){
                    // Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: ChangePassword()));
                  },
                  icon: Icon(Icons.arrow_forward_ios_rounded,size: 20,
                    // color: Palette.GreyDarkest,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5,bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.power_settings_new_rounded,size: 20,
                    // color: Palette.Purple
                    ),
                  SizedBox(width: 10,),
                  Text("Logout",
                    // style: TextStyles.RegularExtraSmall1SemiBoldDarkPurple,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
