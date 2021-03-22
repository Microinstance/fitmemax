import 'dart:async';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:fitmemax/Services/apiProvider.dart';
import 'package:fitmemax/src/data/data2.dart';
import 'package:fitmemax/src/module/BattleGround/BattleGroundDashBoard.dart';
import 'package:fitmemax/src/module/CalTracker/CalTrackerDashboard.dart';
import 'package:fitmemax/src/module/Fast/FastDashboard.dart';
import 'package:fitmemax/src/module/GoPro/GoPro.dart';
import 'package:fitmemax/src/module/Workout/Workout.dart';
import 'package:fitmemax/src/module/dashboard/home/Blog.dart';
import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:page_transition/page_transition.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  ScrollController _controller;
  bool _isVisible = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
    });
    _controller = ScrollController();
    _controller.addListener(() {
      setState(() {
        _isVisible =
            _controller.position.userScrollDirection == ScrollDirection.reverse;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    _controller.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Duration initialDelay = Duration(milliseconds: 250);
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: SpeedDial(
        marginRight: 18,
        marginBottom: 20,
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 22.0),
        closeManually: false,
        curve: Curves.bounceIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        onOpen: () => print('OPENING DIAL'),
        onClose: () => print('DIAL CLOSED'),
        tooltip: 'Speed Dial',
        heroTag: 'speed-dial-hero-tag',
        backgroundColor: Palette.primaryColor,
        foregroundColor: Colors.white,
        elevation: 8.0,
        shape: CircleBorder(),
        children: [
          SpeedDialChild(
            child: Icon(Icons.directions_run),
            backgroundColor: Colors.red,
            label: 'Go Pro',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.bottomToTop, child: GoPro()));
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.perm_camera_mic),
            backgroundColor: Colors.blue,
            label: 'PodCast',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () => print('SECOND CHILD'),
          ),
          SpeedDialChild(
            child: Icon(Icons.star),
            backgroundColor: Colors.yellow[600],
            label: 'Badges',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () => print('THIRD CHILD'),
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        progressIndicator: SpinKitCircle(
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: Palette.x1Color,
              ),
            );
          },
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/dashboard/dashboard.png'),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter,
                  )),
                ),
                SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  controller: _controller,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      DelayedDisplay(
                        delay: initialDelay,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 60,
                                  width: _width * 0.9,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black.withOpacity(0.5),
                                        width: 1,
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.white,
                                          Colors.green[200],
                                        ],
                                        begin: FractionalOffset.centerLeft,
                                        end: FractionalOffset.centerRight,
                                      )),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        right: _width * 0.02,
                                        left: _width * 0.02),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Icon(
                                              Icons.videocam,
                                              color: Colors.black,
                                              size: 40,
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 5),
                                              child: CircleAvatar(
                                                radius: 5,
                                                backgroundColor: Colors.white,
                                              ),
                                            )
                                          ],
                                        ),
                                        Text(
                                          "Book a live workout now",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: Palette.primaryColor,
                                          size: 30,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Hi Shivay",
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: _width * 0.04, right: _width * 0.04),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                      child: Text(
                                    "Based on your BMI (20.1) and goal you should consume 2000 calories a day",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(_width * 0.06),
                        child: Stack(
                          overflow: Overflow.visible,
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              constraints: BoxConstraints(
                                maxHeight: 220,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 5.0,
                                      spreadRadius: 5.0),
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              child: PageView(
                                controller: _pageController,
                                onPageChanged: _onPageChanged,
                                children: [
                                  MediaQuery.removePadding(
                                    context: context,
                                    removeTop: true,
                                    removeBottom: true,
                                    removeRight: true,
                                    removeLeft: true,
                                    child: ListView(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      children: [
                                        Container(
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: _width * 0.02,
                                                right: _width * 0.02,
                                                top: 20,
                                                bottom: 20),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            PageTransition(
                                                                type:
                                                                    PageTransitionType
                                                                        .fade,
                                                                child:
                                                                    CalTrackerDashboard()));
                                                      },
                                                      child: hItem(
                                                        name: 'Track Calories',
                                                        image:
                                                            'assets/icons/track_cal.png',
                                                        context: context,
                                                      ),
                                                    ),
                                                    hItem(
                                                      name: 'Activity',
                                                      image:
                                                          'assets/icons/activity.png',
                                                      context: context,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            PageTransition(
                                                                type:
                                                                    PageTransitionType
                                                                        .fade,
                                                                child:
                                                                    BattleGroundDashBoard()));
                                                      },
                                                      child: hItem(
                                                        name: 'Battleground',
                                                        image:
                                                            "assets/icons/battleground.png",
                                                        context: context,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    hItem(
                                                      name: 'Health log',
                                                      image:
                                                          'assets/dashboard/mainIcon/heart.png',
                                                      context: context,
                                                    ),
                                                    hItem(
                                                      name: 'Fitbook',
                                                      image:
                                                          'assets/icons/fitbook3.png',
                                                      context: context,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            PageTransition(
                                                                type:
                                                                    PageTransitionType
                                                                        .fade,
                                                                child:
                                                                    FastDashboard()));
                                                      },
                                                      child: hItem(
                                                        name: 'Fast',
                                                        image:
                                                            'assets/icons/fast.png',
                                                        context: context,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  MediaQuery.removePadding(
                                    context: context,
                                    removeTop: true,
                                    removeBottom: true,
                                    removeRight: true,
                                    removeLeft: true,
                                    child: ListView(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      children: [
                                        Container(
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: _width * 0.02,
                                                right: _width * 0.02,
                                                top: 20,
                                                bottom: 20),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    hItem(
                                                      name: 'Yoga',
                                                      image:
                                                          "assets/icons/yoga1.png",
                                                      context: context,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            PageTransition(
                                                                type:
                                                                    PageTransitionType
                                                                        .fade,
                                                                child:
                                                                    Workout()));
                                                      },
                                                      child: hItem(
                                                        name: 'Workout',
                                                        image:
                                                            "assets/icons/workout.png",
                                                        context: context,
                                                      ),
                                                    ),
                                                    hItem(
                                                      name: 'Mediation',
                                                      image:
                                                          "assets/icons/meditation.png",
                                                      context: context,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    hItem(
                                                      name: 'Cal burnt',
                                                      image:
                                                          "assets/icons/cal burnt.png",
                                                      context: context,
                                                    ),
                                                    hItem(
                                                      name: 'Musclebaba',
                                                      image:
                                                          "assets/icons/musscelbaba.png",
                                                      context: context,
                                                    ),
                                                    hItem(
                                                      name: 'Run',
                                                      image:
                                                          "assets/icons/run.png",
                                                      context: context,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  for (int i = 0; i < 2; i++)
                                    if (i == _currentPage)
                                      OnboardingDots(true)
                                    else
                                      OnboardingDots(false)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      DelayedDisplay(
                        slidingBeginOffset: Offset(0.35, 0),
                        delay: initialDelay,
                        child: Container(
                          height: 55,
                          child: ListView(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            children: [
                              hBar(
                                color: Palette.primaryColor,
                                context: context,
                                gColor: Colors.green[50],
                                icon: Icons.call,
                                lebel: 'Book free call',
                              ),
                              hBar(
                                  color: Colors.orange,
                                  context: context,
                                  gColor: Colors.orange[50],
                                  icon: Icons.book,
                                  lebel: 'eBook Courses'),
                              hBar(
                                color: Colors.deepPurple,
                                context: context,
                                gColor: Colors.deepPurple[50],
                                icon: Icons.gamepad,
                                lebel: 'Online Battle',
                              ),
                              SizedBox(
                                width: _width * 0.65 * 0.04,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 8.0, right: 10.0, left: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text('Fit',
                                      style: TextStyle(
                                          fontSize: 20, letterSpacing: 1)),
                                  Text(
                                    'Book',
                                    style: TextStyle(
                                        color: Colors.pinkAccent[100],
                                        fontSize: 20,
                                        letterSpacing: 1),
                                  ),
                                  Text(' Stories',
                                      style: TextStyle(
                                          fontSize: 20, letterSpacing: 1)),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.pinkAccent[100],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        height: 140,
                        child: GestureDetector(
                          child: ListView(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            children: [
                              stories(
                                context: context,
                                image: "assets/story/gymstory1.png",
                                name: 'iamshivay',
                              ),
                              stories(
                                context: context,
                                image: "assets/story/gymstory1.png",
                                name: 'iamshivay',
                              ),
                              stories(
                                context: context,
                                image: "assets/story/gymstory1.png",
                                name: 'iamshivay',
                              ),
                              stories(
                                context: context,
                                image: "assets/story/gymstory1.png",
                                name: 'iamshivay',
                              ),
                              stories(
                                context: context,
                                image: "assets/story/gymstory1.png",
                                name: 'iamshivay',
                              ),
                              SizedBox(
                                width: _width * 0.65 * 0.04,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.only(right: 10.0, left: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text('Muscle',
                                      style: TextStyle(
                                          fontSize: 20, letterSpacing: 1)),
                                  Text(
                                    'Baba',
                                    style: TextStyle(
                                        color: Colors.yellow[800],
                                        fontSize: 20,
                                        letterSpacing: 1),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.pinkAccent[100],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        height: 230,
                        child: AnimationLimiter(
                          child: GridView.count(
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            mainAxisSpacing: 10.0,
                            crossAxisSpacing: 10.0,
                            children: List.generate(
                              Data().Shop.length,
                              (index) => AnimationConfiguration.staggeredGrid(
                                columnCount: 2,
                                position: index,
                                duration: const Duration(milliseconds: 3000),
                                child: ScaleAnimation(
                                  scale: 0.5,
                                  child: FadeInAnimation(
                                    child: Container(
                                      height: 130,
                                      width: 130,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ), //
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, top: 5),
                                        child: Column(
                                          children: [
                                            Container(
                                              width: 80,
                                              height: 80,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(Data()
                                                      .Shop[index]['image']),
                                                  fit: BoxFit.cover,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              Data().Shop[index]['name'],
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 8.0, right: 10.0, left: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text('Discover',
                                      style: TextStyle(
                                          fontSize: 20, letterSpacing: 1)),
                                  Text(
                                    ' Blogs',
                                    style: TextStyle(
                                        color: Colors.orange,
                                        fontSize: 20,
                                        letterSpacing: 1),
                                  ),
                                ],
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.reorder,
                                  color: Colors.orange,
                                ),
                                onPressed: () async {
                                  try {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    var getCat =
                                        await ApiProvider().getCategories();
                                    if (getCat["success"] == true) {
                                      lstGetCategories.clear();
                                      if (getCat["data"] != null) {
                                        getCat["data"].forEach((element) {
                                          GetCategories objGetCategories =
                                              new GetCategories();
                                          objGetCategories.id = element["id"];
                                          objGetCategories.name =
                                              element["name"];
                                          lstGetCategories
                                              .add(objGetCategories);
                                        });
                                        final result =
                                            await showConfirmationDialog(
                                          context: context,
                                          title: 'Select Blog Category',
                                          actions: [
                                            ...List.generate(
                                              lstGetCategories.length,
                                              (index) => AlertDialogAction(
                                                label: lstGetCategories[index]
                                                    .name
                                                    .toString(),
                                                key: lstGetCategories[index].id,
                                              ),
                                            ),
                                          ],
                                        );
                                        if (result != null) {
                                          String catName = "";
                                          lstGetCategories.forEach((element) {
                                            if (element.id == result) {
                                              catName = element.name;
                                            }
                                          });
                                          var blogs =
                                              await ApiProvider().getBlogs();
                                          if (blogs["success"] == true) {
                                            if (blogs["data"] != null) {
                                              lstGetBlogs.clear();
                                              blogs["data"].forEach((element) {
                                                if (element["category_name"] ==
                                                    catName) {
                                                  GetBlogs objGetBlogs =
                                                      new GetBlogs();
                                                  objGetBlogs.id =
                                                      element["id"];
                                                  objGetBlogs.title =
                                                      element["title"];
                                                  objGetBlogs.categoryName =
                                                      element["category_name"];
                                                  objGetBlogs.shortDescription =
                                                      element[
                                                          "short_description"];
                                                  objGetBlogs.longDescription =
                                                      element[
                                                          "long_description"];
                                                  objGetBlogs.image =
                                                      element["image"];
                                                  lstGetBlogs.add(objGetBlogs);
                                                }
                                              });
                                            }
                                          } else {
                                            Fluttertoast.showToast(
                                                msg: blogs["message"]);
                                          }
                                        }
                                      } else {
                                        Fluttertoast.showToast(
                                            msg: getCat["message"]);
                                      }
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: getCat["message"]);
                                    }
                                  } catch (e) {
                                    print(e);
                                  } finally {
                                    setState(() {
                                      isLoading = false;
                                    });
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      ListView.builder(
                        itemCount: lstGetBlogs.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 20),
                              child: Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.bottomToTop,
                                          child: Blog(
                                            blogId: lstGetBlogs[index]
                                                .id
                                                .toString(),
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: 350,
                                      width: _width,
                                      color: Colors.white,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                CircleAvatar(
                                                  radius: 15,
                                                  backgroundColor:
                                                      Colors.orange,
                                                  child: Icon(
                                                    Icons.bubble_chart,
                                                    color: Colors.white,
                                                    size: 25,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: _width * 0.04,
                                                ),
                                                Flexible(
                                                  child: Text(
                                                    lstGetBlogs[index].title,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.black),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    lstGetBlogs[index]
                                                                    .shortDescription !=
                                                                null &&
                                                            lstGetBlogs[index]
                                                                    .shortDescription !=
                                                                ""
                                                        ? lstGetBlogs[index]
                                                            .shortDescription
                                                        : "",
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: 200,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: lstGetBlogs[index]
                                                                  .image !=
                                                              null &&
                                                          lstGetBlogs[index]
                                                                  .image !=
                                                              ""
                                                      ? NetworkImage(
                                                          lstGetBlogs[index]
                                                              .image,
                                                        )
                                                      : AssetImage(
                                                          "assets/blog/blog1.png"),
                                                  fit: BoxFit.contain,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15)),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      '89 likes',
                                                      style: TextStyle(
                                                          color: Colors.black
                                                              .withOpacity(
                                                                  0.5)),
                                                    ),
                                                    // SizedBox(
                                                    //   width: 5,
                                                    // ),
                                                    // Text(
                                                    //   '65 comments',
                                                    //   style: TextStyle(color: Colors.black.withOpacity(0.5)),
                                                    // ),
                                                    // SizedBox(width: 5),
                                                    // Text(
                                                    //   '89 shares',
                                                    //   style: TextStyle(color: Colors.black.withOpacity(0.5)),
                                                    // ),
                                                    // SizedBox(
                                                    //   width: 5,
                                                    // ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.favorite_border,
                                                      color: Colors.red,
                                                      size: 20,
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    // Icon(
                                                    //   Icons.insert_comment,
                                                    //   color: Colors.deepPurple,
                                                    //   size: 20,
                                                    // ),
                                                    // SizedBox(
                                                    //   width: 10,
                                                    // ),
                                                    // Icon(
                                                    //   Icons.share,
                                                    //   color: Colors.orange,
                                                    //   size: 20,
                                                    // ),
                                                    // SizedBox(
                                                    //   width: 10,
                                                    // ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '05:45 Am, 17 Oct',
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.5)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
            Offstage(
              offstage: !_isVisible,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector(
                  onTap: () {
                    _controller.animateTo(
                      0.0,
                      curve: Curves.easeOut,
                      duration: const Duration(milliseconds: 300),
                    );
                  },
                  child: Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      border: Border.all(
                        color: Colors.black.withOpacity(0.5),
                        width: 0.5,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                              child: Text(
                            'Go to Top  ',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                          Icon(
                            Icons.arrow_upward,
                            size: 20,
                            color: Colors.white,
                          ),
                        ],
                      ),
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

  List<GetCategories> lstGetCategories = [];
  List<GetBlogs> lstGetBlogs = [];

  Widget hBar(
      {BuildContext context,
      String lebel,
      IconData icon,
      Color color,
      Color gColor}) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(left: _width * 0.65 * 0.04, top: 5, bottom: 5),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                gColor,
              ],
              begin: FractionalOffset.centerLeft,
              end: FractionalOffset.centerRight,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 2.0,
                  spreadRadius: 1.0),
            ]),
        child: Padding(
          padding: EdgeInsets.only(
              left: _width * 0.65 * 0.05, right: _width * 0.65 * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 15,
                backgroundColor: color,
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 18,
                ),
              ),
              // Icon(Icons.call,color: Colors.red,size: 40,),
              SizedBox(
                width: _width * 0.65 * 0.05,
              ),
              Text(
                lebel,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget stories({BuildContext context, String name, String image}) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Padding(
        padding: EdgeInsets.only(left: _width * 0.65 * 0.04, top: 5, bottom: 5),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 41,
                  backgroundColor: Colors.pinkAccent[100],
                  child: CircleAvatar(
                    radius: 39,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 37,
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(image),
                              fit: BoxFit.cover,
                            )),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 6,
                  bottom: 5,
                  child: CircleAvatar(
                    radius: 6.5,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor: Palette.primaryColor,
                      // backgroundColor: Colors.yellow[700],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              name,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
          ],
        ));
  }

  Widget hItem({BuildContext context, String name, String image}) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Container(
      width: _width * 0.27,
      height: 80,
      child: Column(
        children: [
          SizedBox(
            height: 40,
            child: Image.asset(
              image,
              fit: BoxFit.scaleDown,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            name,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
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
      height: isActive ? 12 : 8,
      width: isActive ? 12 : 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Palette.primaryColor,
        border: isActive
            ? Border.all(
                color: Palette.primaryColor,
                width: 1.5,
              )
            : Border.all(
                color: Colors.transparent,
                width: 1,
              ),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}

class GetCategories {
  int id;
  String name;

  GetCategories({
    this.id,
    this.name,
  });
}

class GetBlogs {
  int id;
  String title;
  String categoryName;
  String shortDescription;
  String longDescription;
  String image;

  GetBlogs({
    this.id,
    this.title,
    this.categoryName,
    this.shortDescription,
    this.image,
    this.longDescription,
  });
}
