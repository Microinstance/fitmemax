import 'dart:async';

import 'package:fitmemax/src/data/data.dart';
import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';

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
    });
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
      body:  Stack(
        children: [
          NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Palette.profileColor,
                  centerTitle: false,
                  pinned: false,
                  expandedHeight: 300,
                  floating: false,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child:Stack(
                        children: [
                          Stack(
                            children: <Widget>[
                              PageView.builder(
                                  scrollDirection: Axis.horizontal,
                                  controller: _pageController,
                                  onPageChanged: _onPageChanged,
                                  itemCount: 3,
                                  itemBuilder: (BuildContext context, int index){
                                    return Container(
                                      height: 400,
                                      width: _width,
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          image: DecorationImage(
                                              image: AssetImage("assets/profile/profile1.png"),
                                              fit: BoxFit.cover
                                          )
                                      ),
                                    );
                                  }
                              ),
                              Positioned(
                                bottom: 30,
                                right: 20,
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                            child: SafeArea(child: Padding(
                              padding: const EdgeInsets.only(left: 15,top: 10),
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                  child: Icon(Icons.arrow_back_ios,color: Palette.x1Color,size: 25,)),
                            )),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: SafeArea(
                                child: Padding(
                                  padding:  EdgeInsets.only(top: 15),
                                  child: Text("shivay.paradox",style: TextStyle(fontSize: 18,color: Colors.white,fontFamily: 'Roboto',fontWeight: FontWeight.bold),),
                                ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: SafeArea(
                              child: Padding(
                                padding:  EdgeInsets.only(top: 5,right: 10),
                                child: CircleAvatar(
                                  radius: 23,
                                  backgroundColor: Colors.grey[50].withOpacity(0.1),
                                  child: CircleAvatar(
                                    radius: 21,
                                    backgroundColor:Colors.transparent,
                                    backgroundImage: AssetImage("assets/profile/me.png"),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding:  EdgeInsets.only(left: 15,bottom: 30),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Text("Marchine\nJanowasaki",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontFamily: 'Roboto',fontSize: 40),textAlign: TextAlign.start,),
                                      Padding(
                                        padding:  EdgeInsets.only(left: 10),
                                        child: Icon(Icons.check_circle,color: Colors.blueAccent,),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
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
              child: SafeArea(
                child: Column(
                  children: [
                    SizedBox(height: 5,),
                    Container(
                      width: _width,
                      color: Colors.black,
                      child: Padding(
                        padding:  EdgeInsets.only(left: 15,right: 15,bottom: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("543 978",style: TextStyle(fontSize: 25,fontFamily: 'Roboto',color: Colors.white,fontWeight: FontWeight.bold),),
                                SizedBox(height: 5,),
                                Text("Followers",style: TextStyle(fontSize: 16,fontFamily: 'Roboto',color: Palette.x1Color,fontWeight: FontWeight.bold),),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("842",style: TextStyle(fontSize: 25,fontFamily: 'Roboto',color: Colors.white,fontWeight: FontWeight.bold),),
                                SizedBox(height: 5,),
                                Text("Following",style: TextStyle(fontSize: 16,fontFamily: 'Roboto',color: Palette.x1Color,fontWeight: FontWeight.bold),),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("173",style: TextStyle(fontSize: 25,fontFamily: 'Roboto',color: Colors.white,fontWeight: FontWeight.bold),),
                                SizedBox(height: 5,),
                                Text("Posts",style: TextStyle(fontSize: 16,fontFamily: 'Roboto',color: Palette.x1Color,fontWeight: FontWeight.bold),),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      height: 50,
                      color: Palette.profileColor.withOpacity(0.7),
                      child: TabBar(
                        controller: _tabController,
                        // isScrollable: true,
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
                              child: Text('Posts',
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
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: GridView.count(
                                crossAxisCount: 3,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                mainAxisSpacing: 10.0,
                                crossAxisSpacing: 10.0,

                                children: Data().profile.map((index){
                                  return Container(
                                    height: 130,
                                    width: 130,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      image: DecorationImage(
                                        image: AssetImage(index['image']),
                                        fit: BoxFit.cover,
                                      )
                                    ), //
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

                                children: Data().profile.map((index){
                                  return Container(
                                    height: 130,
                                    width: 130,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                        image: DecorationImage(
                                          image: AssetImage(index['image']),
                                          fit: BoxFit.cover,
                                        )
                                    ), //
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

                                children: Data().profile.map((index){
                                  return Container(
                                    height: 130,
                                    width: 130,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                        image: DecorationImage(
                                          image: AssetImage(index['image']),
                                          fit: BoxFit.cover,
                                        )
                                    ), //
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

                                children: Data().profile.map((index){
                                  return Container(
                                    height: 130,
                                    width: 130,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                        image: DecorationImage(
                                          image: AssetImage(index['image']),
                                          fit: BoxFit.cover,
                                        )
                                    ), //
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

                                children: Data().profile.map((index){
                                  return Container(
                                    height: 130,
                                    width: 130,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                        image: DecorationImage(
                                          image: AssetImage(index['image']),
                                          fit: BoxFit.cover,
                                        )
                                    ), //
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