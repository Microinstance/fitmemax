import 'dart:async';
import 'package:fitmemax/src/data/data2.dart';
import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Profile.dart';

class ProfileVisit extends StatefulWidget {
  @override
  _ProfileVisitState createState() => _ProfileVisitState();
}

class _ProfileVisitState extends State<ProfileVisit> with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  bool _follow = false;
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
    _tabController = TabController(length: 3, vsync: this);
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
      backgroundColor: Colors.black,
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
                      backgroundColor: Colors.black,
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
                                                ),
                                              ),
                                            )
                                          ],
                                        );
                                      },
                                  ),
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
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Shivay ",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Icon(
                                          Icons.check_circle,
                                          color: Colors.blue[700],
                                        )
                                      ],
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

                                        SizedBox(height: 10,),
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: (_height * 0.5 * 0.4)+10,
                                              width: _width * 0.6,
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.end,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text("Level 1",style: GoogleFonts.roboto(color: Palette.x1Color,fontSize: 18,fontWeight: FontWeight.w500,fontStyle: FontStyle.italic),),
                                                    ],
                                                  ),
                                                  SizedBox(height: 7,),
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
                                        SizedBox(height: 10,),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 0),
                                          child: Row(
                                            children: [
                                              MaterialButton(
                                                height: 45,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(15),
                                                  side: BorderSide(
                                                      color: _follow ? Colors.transparent : Palette.x1Color,
                                                      width: _follow ? 0 : 1.5,
                                                      style: BorderStyle.solid,
                                                  ),
                                                ),
                                                onPressed: (){
                                                  setState(() {
                                                    if(_follow ==  true) {
                                                      _follow = false;
                                                    }else{
                                                      _follow = true;
                                                    }
                                                  });
                                                },
                                                color: _follow ? Palette.x1Color : Colors.transparent,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 7,right: 7,),
                                                  child: Center(child: Text(_follow ? "Follow" : "Following",style: GoogleFonts.roboto(fontSize: 20,color: _follow ?  Colors.black : Palette.x1Color,fontWeight: FontWeight.w500),)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                              ),
                              ),
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
                              isScrollable: false,
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
                                    child: Text('Coins',
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
            ],
          ),
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
                      fontFamily: 'Roboto'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.white,
                      size: 15,
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 10,),
          Container(
            height: 150,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: Data().Badges.length,
              itemBuilder: (BuildContext context, int index){
                return Padding(
                  padding: const EdgeInsets.only(right: 10,left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Colors.black,
                              border: Border.all(color: Colors.white.withOpacity(0.2),width: 1),
                              image: DecorationImage(
                                image: AssetImage("assets/Badges/badges1.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          // Container(
                          //   height: 100,
                          //   width: 100,
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.all(Radius.circular(10)),
                          //     color: Colors.black.withOpacity(0.7),
                          //   ),
                          //   child: Icon(Icons.lock_outline_rounded,color: Colors.grey,),
                          // ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Text(Data().Badges[index]['name'],style: GoogleFonts.italiana(fontSize: 15,color: Colors.white),),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10,),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Rings",
                  style: TextStyle(
                      fontSize: 22,
                      color: Palette.x1Color,
                      fontFamily: 'Roboto'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.white,
                      size: 15,
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 10,),
          Container(
            height: 130,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: Data().Ring.length,
              itemBuilder: (BuildContext context, int index){
                return Padding(
                  padding: const EdgeInsets.only(right: 10,left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Opacity(
                            opacity: 1,
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/Rings/rings2.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          // Icon(Icons.lock_outline_rounded,color: Colors.grey,)
                        ],

                      ),
                      SizedBox(height: 10,),
                      Text(Data().Ring[index]['name'],style: GoogleFonts.stylish(fontSize: 16,color: Colors.white),),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Diamonds",
                  style: TextStyle(
                      fontSize: 22,
                      color: Palette.x1Color,
                      fontFamily: 'Roboto'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.white,
                      size: 15,
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 10,),
          Container(
            height: 150,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: Data().Badges.length,
              itemBuilder: (BuildContext context, int index){
                return Padding(
                  padding: const EdgeInsets.only(right: 10,left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Colors.black,
                              border: Border.all(color: Colors.white.withOpacity(0.2),width: 1),
                              image: DecorationImage(
                                image: AssetImage("assets/gif/image_processing20200908-14153-18rh6ev.gif"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          // Container(
                          //   height: 100,
                          //   width: 100,
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.all(Radius.circular(10)),
                          //     color: Colors.black.withOpacity(0.7),
                          //   ),
                          //   child: Icon(Icons.lock_outline_rounded,color: Colors.grey,),
                          // ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Text(Data().Badges[index]['name'],style: GoogleFonts.italiana(fontSize: 15,color: Colors.white),),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Points",
                  style: TextStyle(
                      fontSize: 22,
                      color: Palette.x1Color,
                      fontFamily: 'Roboto'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.white,
                      size: 15,
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 10,),
          Container(
            height: 150,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount:5,
              itemBuilder: (BuildContext context, int index){
                return Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
                  child: Container(
                    width: 260,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.black,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15,right: 15),
                          child: CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage("assets/gif/gym.gif"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("40 pts",style: GoogleFonts.roboto(fontSize: 22,color: Colors.yellow[700],fontWeight: FontWeight.bold),),
                              SizedBox(height: 7,),
                              Text("Jym Check in",style: GoogleFonts.roboto(fontSize: 15,color: Colors.white.withOpacity(0.8)),),
                              SizedBox(height: 25,),
                              Text("Tue - Mar 15, 2020",style: GoogleFonts.openSans(fontSize: 15,color: Colors.yellow[700]),),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 145,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("LEVEL",style: GoogleFonts.raleway(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white,fontStyle: FontStyle.italic),),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Text(" 2",style: GoogleFonts.arimo(fontSize: 40,fontWeight: FontWeight.bold,color: Palette.x1Color,fontStyle: FontStyle.italic),),
                            ),
                            SizedBox(width: 15,),
                            Icon(Icons.check_circle_rounded,size: 30,color: Palette.x1Color,),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Text("Know More",style: GoogleFonts.raleway(fontSize: 18,color: Palette.x1Color,fontStyle: FontStyle.italic),),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Flexible(child: Text("Reach 5 coins, for 3 days in row, to upgrade to level 3",style: TextStyle(fontSize: 18,color: Colors.white.withOpacity(0.8)),)),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 250,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  image: DecorationImage(
                    image: AssetImage("assets/gif/trophy.gif"),
                    fit: BoxFit.cover,
                  ),
              ),
            ),
          ),
          SizedBox(height: 140,),
        ],
      ),
    );
  }
}
