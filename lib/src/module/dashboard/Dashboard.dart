import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:fitmemax/src/module/dashboard/CoachConsultant/Coach.dart';
import 'package:fitmemax/src/module/dashboard/home/Home.dart';
import 'package:fitmemax/src/module/dashboard/plan/Plan.dart';
import 'package:fitmemax/src/module/dashboard/profile/Profile.dart';
import 'package:fitmemax/src/module/signin_signup/SignupPage.dart';
import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with SingleTickerProviderStateMixin{
  final GlobalKey<ScaffoldState> _scaffoldKey =  GlobalKey<ScaffoldState>();
  PageController _pageController = PageController(
    initialPage: 0,
  );
  int selectedIndex = 0;
  double screenWidth, screenHeight;
  bool isCollapsed = true;
  final Duration duration = const Duration(milliseconds: 250);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0)).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.green[300],
              Palette.primaryColor,
            ],
            begin: FractionalOffset.centerRight,
            end: FractionalOffset.centerLeft,
          )
        // color: Palette.primaryColor
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
                      backgroundColor: Palette.primaryColor,
                      title: Row(
                        children: [
                          Text('F',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 25),),
                          Text('i',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 22),),
                          Text('t',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 22),),
                          Text('Me',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 22),),
                          Text('Max',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 22),),
                        ],
                      ),
                      leading: IconButton(
                        icon:  Icon(Icons.menu,size: 30,),
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
                          padding:  EdgeInsets.only(right: 15),
                          child: Icon(Icons.account_balance_wallet,size: 25,color: Colors.white,),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(right: 15),
                          child: Icon(Icons.notifications_active,size: 25,color: Colors.amberAccent,),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(right: 15),
                          child: Icon(Icons.alarm,size: 25,color: Colors.cyanAccent,),
                        ),
                      ],
                    ),
                    body: PageView(
                      controller: _pageController,
                      physics:new NeverScrollableScrollPhysics(),
                      onPageChanged: (page) {
                        setState(() {
                          selectedIndex = page;
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
                        selectedItemBorderColor: Colors.green[100],
                        selectedItemBackgroundColor: Colors.white,
                        selectedItemIconColor: Palette.primaryColor,
                        selectedItemLabelColor: Colors.black,
                      ),
                      selectedIndex: selectedIndex,
                      onSelectTab: (index) {
                        if(index == 2){
                          Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: SignupPage()));
                        }
                        if(index == 1){
                          Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: Coach()));
                        }
                        if(index == 4){
                          Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: Profile()));
                        }
                        else{
                          setState(() {
                            selectedIndex = index;
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
            width: _width*0.55,
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: Container(
                height: _height,
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  children: [
                    Container(
                        height: _height*0.25,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(80),bottomLeft: Radius.circular(10),topRight: Radius.circular(10)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              width:  _width*0.55,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 55,
                                    backgroundColor: Colors.white.withOpacity(0.5),
                                    child: CircleAvatar(
                                      radius: 53,
                                      backgroundImage: AssetImage("assets/profile/me.png"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                                alignment: Alignment.topLeft,
                                width:  _width*0.55,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Shivay Gorai',style: TextStyle(fontSize: 20,color: Colors.white),textAlign: TextAlign.center,),
                                  ],
                                )),
                          ],
                        )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        children: [
                          SizedBox(height: 30,),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.chat,color: Colors.white,size: 22,),
                                SizedBox(width: 15,),
                                Flexible(child: Text("Chat", style: TextStyle(color: Colors.white, fontSize: 20))),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.web,color: Colors.white,size: 22,),
                                SizedBox(width: 15,),
                                Flexible(child: Text("Advertisement", style: TextStyle(color: Colors.white, fontSize: 20))),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.compare,color: Colors.white,size: 22,),
                                SizedBox(width: 15,),
                                Flexible(child: Text("Corporate plan", style: TextStyle(color: Colors.white, fontSize: 20))),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.fitness_center,color: Colors.white,size: 22,),
                                SizedBox(width: 15,),
                                Flexible(child: Text("Diet and fitness", style: TextStyle(color: Colors.white, fontSize: 20))),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.contact_mail,color: Colors.white,size: 22,),
                                SizedBox(width: 15,),
                                Flexible(child: Text("Connect", style: TextStyle(color: Colors.white, fontSize: 20))),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.nature_people,color: Colors.white,size: 22,),
                                SizedBox(width: 15,),
                                Flexible(child: Text("Coach", style: TextStyle(color: Colors.white, fontSize: 20))),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.book,color: Colors.white,size: 22,),
                                SizedBox(width: 15,),
                                Flexible(child: Text("Journal", style: TextStyle(color: Colors.white, fontSize: 20))),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.call_split,color: Colors.white,size: 22,),
                                SizedBox(width: 15,),
                                Flexible(child: Text("Invite friends", style: TextStyle(color: Colors.white, fontSize: 20))),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.history,color: Colors.white,size: 22,),
                                SizedBox(width: 15,),
                                Flexible(child: Text("Transaction", style: TextStyle(color: Colors.white, fontSize: 20))),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.person_add,color: Colors.white,size: 22,),
                                SizedBox(width: 15,),
                                Flexible(child: Text("Refer and earn", style: TextStyle(color: Colors.white, fontSize: 20))),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.all_inclusive,color: Colors.white,size: 22,),
                                SizedBox(width: 15,),
                                Flexible(child: Text("About us", style: TextStyle(color: Colors.white, fontSize: 20))),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: _height*0.1,
                      width: _width*0.55,
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Logout",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
                          SizedBox(width: 10,),
                          Icon(Icons.power_settings_new,color: Colors.white,size: 35,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

