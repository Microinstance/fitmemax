import 'dart:async';
import 'package:fitmemax/src/data/data.dart';
import 'package:fitmemax/src/module/dashboard/profile/ProfileHome.dart';
import 'package:fitmemax/src/module/dashboard/profile/ProfilePost.dart';
import 'package:fitmemax/src/module/dashboard/profile/ProfileSearch.dart';
import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {

  TabController _tabController;
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
    },
    );
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    _tabController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Palette.profileColor,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Stack(
            children: [
              NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      backgroundColor: Palette.profileColor,
                      centerTitle: false,
                      pinned: false,
                      expandedHeight: _height * 0.5,
                      floating: false,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Container(
                          height: _height * 0.5,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Stack(
                            children: [
                              Stack(
                                children: <Widget>[
                                  PageView.builder(
                                      scrollDirection: Axis.horizontal,
                                      controller: _pageController,
                                      onPageChanged: _onPageChanged,
                                      itemCount: 3,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Stack(
                                          children: [
                                            Container(
                                              width: _width,
                                              decoration: BoxDecoration(
                                                  color: Colors.transparent,
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/profile/profile1.png"),
                                                      fit: BoxFit.cover)),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                colors: [
                                                  Colors.black.withOpacity(0.5),
                                                  Colors.transparent,
                                                ],
                                                begin: FractionalOffset
                                                    .bottomCenter,
                                                end: FractionalOffset.topCenter,
                                              )),
                                            )
                                          ],
                                        );
                                      }),
                                  Positioned(
                                    bottom: 30,
                                    right: 20,
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          for (int i = 0; i < 3; i++)
                                            if (i == _currentPage)
                                              OnboardingDots(true)
                                            else
                                              OnboardingDots(false)
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: SafeArea(
                                    child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 15, top: 10),
                                  child: GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Icon(
                                        Icons.arrow_back_ios,
                                        color: Palette.x1Color,
                                        size: 25,
                                      )),
                                )),
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: SafeArea(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 15),
                                    child: Text(
                                      "shivay.paradox",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: SafeArea(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 5, right: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Stack(
                                          overflow: Overflow.visible,
                                          alignment: Alignment.bottomRight,
                                          children: [
                                            CircleAvatar(
                                              radius: 23,
                                              backgroundColor:
                                                  Colors.grey[50].withOpacity(0.1),
                                              child: CircleAvatar(
                                                radius: 21,
                                                backgroundColor: Colors.transparent,
                                                backgroundImage: AssetImage(
                                                    "assets/profile/me.png"),
                                              ),
                                            ),
                                            Positioned(
                                                bottom: -5,
                                                child: Icon(
                                                  Icons.check_circle,
                                                  color: Colors.blueAccent,
                                                ))
                                          ],
                                        ),
                                        SizedBox(height: 20,),
                                        Stack(
                                          alignment: Alignment.topRight,
                                          children: [
                                            IconButton(
                                              icon: Icon(
                                                Icons.favorite_border,
                                                size: 30,
                                                // color: Palette.x1Color,
                                                color: Colors.white,
                                              ),
                                              onPressed: () {},
                                            ),
                                            CircleAvatar(
                                                radius: 10,
                                                backgroundColor: Palette.x1Color,
                                                child: Center(
                                                    child: Text(
                                                  "3",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                      fontFamily: 'Roboto',
                                                      fontWeight: FontWeight.bold),
                                                ))),
                                          ],
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            Icons.settings_rounded,
                                            size: 25,
                                            // color: Palette.x1Color,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 15, bottom: 30),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          height: _height * 0.5 * 0.4,
                                          width: _width * 0.6,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Flexible(
                                                      child: Text(
                                                    "Piyush ",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: 'Roboto',
                                                        fontSize: 25),
                                                    textAlign: TextAlign.start,
                                                  )),
                                                ],
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Flexible(
                                                      child: Text(
                                                    "Kumar",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: 'Roboto',
                                                        fontSize: 40),
                                                    textAlign: TextAlign.start,
                                                  )),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ];
                },
                body: Container(
                  color: Colors.black,
                  child: MediaQuery.removePadding(
                    context: context,
                    removeBottom: true,
                    removeLeft: true,
                    removeRight: true,
                    child: SafeArea(
                      child: Column(
                        children: [
                          Container(
                            width: _width,
                            color: Colors.black,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 15, right: 15, bottom: 5),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "543k",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontFamily: 'Roboto',
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Followers",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Roboto',
                                            color: Palette.x1Color,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "842",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontFamily: 'Roboto',
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Following",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Roboto',
                                            color: Palette.x1Color,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "173",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontFamily: 'Roboto',
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Posts",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Roboto',
                                            color: Palette.x1Color,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 50,
                            color: Palette.profileColor.withOpacity(0.7),
                            child: TabBar(
                              controller: _tabController,
                              isScrollable: true,
                              indicatorWeight: 2.0,
                              indicatorColor: Palette.x1Color,
                              tabs: [
                                SizedBox(
                                  height: 50,
                                  child: Center(
                                    child: Text('Posts',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                  child: Center(
                                    child: Text('Achievements',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                  child: Center(
                                    child: Text('Plans',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                  child: Center(
                                    child: Text('Coins',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                  child: Center(
                                    child: Text('Offers',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Palette.profileColor,
                              child: TabBarView(
                                controller: _tabController,
                                physics: BouncingScrollPhysics(),
                                children: [
                                  _Posts(),
                                  _Achievements(),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: GridView.count(
                                      crossAxisCount: 3,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      mainAxisSpacing: 10.0,
                                      crossAxisSpacing: 10.0,
                                      children: Data().profile.map((index) {
                                        return Container(
                                          height: 130,
                                          width: 130,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              image: DecorationImage(
                                                image:
                                                    AssetImage(index['image']),
                                                fit: BoxFit.cover,
                                              )), //
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: GridView.count(
                                      crossAxisCount: 3,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      mainAxisSpacing: 10.0,
                                      crossAxisSpacing: 10.0,
                                      children: Data().profile.map((index) {
                                        return Container(
                                          height: 130,
                                          width: 130,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              image: DecorationImage(
                                                image:
                                                    AssetImage(index['image']),
                                                fit: BoxFit.cover,
                                              )), //
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: GridView.count(
                                      crossAxisCount: 3,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      mainAxisSpacing: 10.0,
                                      crossAxisSpacing: 10.0,
                                      children: Data().profile.map((index) {
                                        return Container(
                                          height: 130,
                                          width: 130,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              image: DecorationImage(
                                                image:
                                                    AssetImage(index['image']),
                                                fit: BoxFit.cover,
                                              )), //
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 50),
            child: Container(
              height: 60,
              width: _width * 0.8,
              decoration: BoxDecoration(
                color: Palette.x2Color,
                // color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.home_outlined,
                      size: 30,
                      // color: Palette.x1Color,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: ProfileHome()));
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.search_rounded,
                      size: 30,
                      // color: Palette.x1Color,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: ProfileSearch(),),);
                    },
                  ),
                  // Stack(
                  //   alignment: Alignment.topRight,
                  //   children: [
                  //     IconButton(
                  //       icon: Icon(
                  //         Icons.favorite_border,
                  //         size: 30,
                  //         // color: Palette.x1Color,
                  //         color: Colors.white,
                  //       ),
                  //       onPressed: () {},
                  //     ),
                  //     CircleAvatar(
                  //         radius: 10,
                  //         backgroundColor: Palette.x1Color,
                  //         child: Center(
                  //             child: Text(
                  //           "3",
                  //           style: TextStyle(
                  //               color: Colors.black,
                  //               fontSize: 15,
                  //               fontFamily: 'Roboto',
                  //               fontWeight: FontWeight.bold),
                  //         ))),
                  //   ],
                  // ),
                  IconButton(
                    icon: Icon(
                      Icons.camera_alt_outlined,
                      size: 30,
                      // color: Palette.x1Color,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: ProfilePost(),),);
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.chat_outlined,
                      size: 30,
                      // color: Palette.x1Color,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   PageTransition(
                      //     type: PageTransitionType.fade,
                      //     child: Profile(),),);
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.person_outline,
                      size: 30,
                      color: Palette.x1Color,
                    ),
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   PageTransition(
                      //     type: PageTransitionType.fade,
                      //     child: Profile(),),);
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _Posts() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.count(
        crossAxisCount: 3,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        children: Data().profile.map((index) {
          return Container(
            height: 130,
            width: 130,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                  image: AssetImage(index['image']),
                  fit: BoxFit.cover,
                )), //
          );
        }).toList(),
      ),
    );
  }

  Widget _Achievements() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Badges",
                  style: TextStyle(
                      fontSize: 22,
                      color: Palette.x1Color,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "View All  ",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontFamily: 'Roboto'),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.white,
                      size: 15,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class OnboardingDots extends StatelessWidget {
  bool isActive;
  OnboardingDots(this.isActive);
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 3.3),
      height: isActive ? 9 : 9,
      width: isActive ? 9 : 9,
      decoration: BoxDecoration(
        color: isActive ? Colors.grey[600] : Palette.x1Color,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
