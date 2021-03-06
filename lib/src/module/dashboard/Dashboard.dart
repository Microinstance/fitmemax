import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:fitmemax/API/APIClient.dart';
import 'package:fitmemax/src/module/dashboard/CoachConsultant/Coach.dart';
import 'package:fitmemax/src/module/dashboard/CorporatePlan.dart';
import 'package:fitmemax/src/module/dashboard/Sidebar/SupportUs.dart';
import 'package:fitmemax/src/module/dashboard/Sidebar/WalletPage.dart';
import 'package:fitmemax/src/module/dashboard/home/Home.dart';
import 'package:fitmemax/src/module/dashboard/home/Notifications.dart';
import 'package:fitmemax/src/module/dashboard/home/Settings/Settings.dart';
import 'package:fitmemax/src/module/dashboard/plan/Plan.dart';
import 'package:fitmemax/src/module/dashboard/profile/Profile.dart';
import 'package:fitmemax/src/module/dashboard/profile/ProfileHome.dart';
import 'package:fitmemax/src/module/others/ReferEarn.dart';
import 'package:fitmemax/src/widgets/palette.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';

import '../Authentication/SigninPage.dart';
import '../Connect/Connect.dart';
import '../GoPro/GoPro.dart';
import 'FeedBack.dart';

class Dashboard extends StatefulWidget {
  int pageStack;

  Dashboard({Key key, this.pageStack = 0}) : super(key: key);
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with SingleTickerProviderStateMixin {

  PageController _pageController = PageController();
  bool isCollapsed = true;
  final Duration duration = const Duration(milliseconds: 250);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;
  APIClient Client;

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    _showMyDialog(); // Do some stuff.
    return true;
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0)).animate(_controller);
    Client = new APIClient();
    BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top, SystemUiOverlay.bottom]);

    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return Container(
      decoration: BoxDecoration(
        color: ColorPalette.PrimaryColor,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            menu(context),
            AnimatedPositioned(
              duration: duration,
              top: 0,
              bottom: 0,
              left: isCollapsed ? 0 : 0.5 * screenWidth,
              right: isCollapsed ? 0 : -0.5 * screenWidth,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Material(
                  animationDuration: duration,
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                  elevation: 5,
                  child: Scaffold(
                    backgroundColor: Colors.transparent,
                    appBar: AppBar(
                      elevation: 0,
                      centerTitle: false,
                      backgroundColor: ColorPalette.PrimaryColor,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'F',
                            style: TextStyles.TitleWhite,
                          ),
                          Text(''
                              '', style: TextStyles.TitleBlack),
                          Text('t', style: TextStyles.TitleWhite),
                          Text('Me', style: TextStyles.TitleWhite),
                          Text('Max', style: TextStyles.TitleBlack),
                        ],
                      ),
                      leading: IconButton(
                        icon: Icon(
                          Icons.menu,
                          size: 30,
                        ),
                        onPressed: () {
                          setState(() {
                            if (isCollapsed)
                              _controller.forward();
                            else
                              _controller.reverse();

                            isCollapsed = !isCollapsed;
                          });
                        },
                      ),
                      actions: [
                        Padding(
                          padding: EdgeInsets.only(right: 0),
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: WalletPage()));
                            },
                            icon: Icon(
                              Icons.account_balance_wallet,
                              size: 25,
                              color: ColorPalette.GreyLightest,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 0),
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      child: Notifications()));
                            },
                            icon: Icon(Icons.notifications_active,
                                size: 25, color: ColorPalette.GreyLightest),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 0),
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      child: Settings()));
                            },
                            icon: Icon(Icons.settings,
                                size: 25, color: ColorPalette.GreyLightest),
                          ),
                        ),
                      ],
                    ),
                    body: PageView(
                      controller: _pageController,
                      physics: new NeverScrollableScrollPhysics(),
                      onPageChanged: (page) {
                        setState(() {
                          widget.pageStack = page;
                        });
                      },
                      children: <Widget>[
                        Home(),
                        Home(),
                        Home(),
                        Plan(),
                        Home(),
                      ],
                    ),
                    bottomNavigationBar: FFNavigationBar(
                      theme: FFNavigationBarTheme(
                        barBackgroundColor: Colors.white,
                        selectedItemBorderColor:
                            ColorPalette.PrimaryColor.withOpacity(0.2),
                        selectedItemBackgroundColor: Colors.white,
                        selectedItemIconColor: ColorPalette.PrimaryColor,
                        selectedItemLabelColor: Colors.black,
                      ),
                      selectedIndex: widget.pageStack,
                      onSelectTab: (index) {
                        if (index == 2) {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.fade,
                                  child: ProfileHome()));
                        }
                        if (index == 1) {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.fade,
                                  child: Coach()));
                        }
                        if (index == 4) {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.fade,
                                  child: Profile()));
                        }
                        else {
                          setState(() {
                            widget.pageStack = index;
                            _pageController.jumpToPage(
                              index,
                            );
                          });
                        }
                      },
                      items: [
                        FFNavigationBarItem(
                          iconData: Icons.home,
                          label: 'Home',
                        ),
                        FFNavigationBarItem(
                          iconData: Icons.people,
                          label: 'Coach',

                        ),
                        FFNavigationBarItem(
                          iconData: Icons.library_books,
                          label: 'FitBook',
                        ),
                        FFNavigationBarItem(
                          iconData: Icons.subscriptions,
                          label: 'Plans',
                        ),
                        FFNavigationBarItem(
                          iconData: Icons.person,
                          label: 'Profile',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget menu(context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Align(
          alignment: Alignment.topLeft,
          child: Container(
            width: _width * 0.55,
            child: Container(
              height: _height,
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                children: [
                  SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          width: _width * 0.55,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: CircleAvatar(
                                  radius: 55,
                                  backgroundColor:
                                      Colors.white.withOpacity(0.5),
                                  child: CircleAvatar(
                                    radius: 53,
                                    backgroundImage:
                                        AssetImage("assets/profile/me.png"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            alignment: Alignment.topLeft,
                            width: _width * 0.55,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(
                                    'Anurag',
                                    style: TextStyles.TitleWhite,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 25),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.chat,
                                color: Colors.white,
                                size: 22,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Flexible(
                                  child: Text("Chat",
                                      style: TextStyles.RegulerBIGWhite)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.web,
                                color: Colors.white,
                                size: 22,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Flexible(
                                  child: Text("Advertisement",
                                      style: TextStyles.RegulerBIGWhite)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.fitness_center,
                                color: Colors.white,
                                size: 22,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Flexible(
                                  child: Text("Diet and Fitness", style: TextStyles.RegulerBIGWhite)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context, PageTransition( type: PageTransitionType.fade, child: WalletPage()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.account_balance_wallet,
                                  color: Colors.white,
                                  size: 22,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Flexible(
                                    child: Text("Wallet", style: TextStyles.RegulerBIGWhite)),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: GoPro()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.wifi_protected_setup,
                                  color: Colors.white,
                                  size: 22,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Flexible(child: Text("Go Pro", style: TextStyles.RegulerBIGWhite)),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: Connect()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.connected_tv,
                                  color: Colors.white,
                                  size: 22,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Flexible(
                                    child: Text("Connect", style: TextStyles.RegulerBIGWhite)),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: CorporatePlan()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.corporate_fare,
                                  color: Colors.white,
                                  size: 22,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Flexible(
                                    child: Text("Corporate Plan",
                                        style: TextStyles.RegulerBIGWhite)),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: FeedBack()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.feedback_outlined,
                                  color: Colors.white,
                                  size: 22,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Flexible(
                                    child: Text("Feedback", style: TextStyles.RegulerBIGWhite)),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.share_rounded,
                                color: Colors.white,
                                size: 22,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Flexible(
                                  child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                                type: PageTransitionType.fade,
                                                child: ReferEarn()));
                                      },
                                      child: Text("Invite friends",
                                          style:
                                          TextStyles.RegulerBIGWhite))),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.all_inclusive,
                                color: Colors.white,
                                size: 22,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Flexible(
                                  child: Text("About us",
                                      style: TextStyles.RegulerBIGWhite)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      child: SupportUs()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.support,
                                  color: Colors.white,
                                  size: 22,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Flexible(
                                    child: Text("Support us",
                                        style: TextStyles.RegulerBIGWhite)),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.account_tree_outlined,
                                color: Colors.white,
                                size: 22,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Flexible(
                                  child: Text("Terms & Condition",
                                      style: TextStyles.RegulerBIGWhite)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.privacy_tip_outlined,
                                color: Colors.white,
                                size: 22,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Flexible(
                                  child: Text("Privacy Policy",
                                      style: TextStyles.RegulerBIGWhite)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await Client.logOut();
                      Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: SigninPage()));
                    },
                    child: Container(
                      height: 50,
                      width: _width * 0.55,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Logout",
                            style: TextStyles.TitleWhite,
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Icon(
                            Icons.power_settings_new,
                            color: Colors.white,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: Container(
                      height: 50,
                      width: _width * 0.55,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        Image.asset("assets/icon/facebook.png",height: 23,fit: BoxFit.contain,color: Colors.white,),
                        Image.asset("assets/icon/instagram.png",height: 23,fit: BoxFit.contain,color: Colors.white,),
                        Image.asset("assets/icon/twitter.png",height: 23,fit: BoxFit.contain,color: Colors.white,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Would you like to exit app?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Exit'),
              onPressed: () {
                SystemNavigator.pop();
              },
            ),
          ],
        );
      },
    );
  }

}
