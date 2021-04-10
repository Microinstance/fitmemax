import 'dart:async';
import 'package:delayed_display/delayed_display.dart';
import 'package:fitmemax/Objects/Backgrounds.dart';
import 'package:fitmemax/src/ListData/ListData.dart';
import 'package:fitmemax/src/module/BattleGround/BattleGroundDashBoard.dart';
import 'package:fitmemax/src/module/CalTracker/CalTrackerDashboard.dart';
import 'package:fitmemax/src/module/Fast/FastDashboard.dart';
import 'package:fitmemax/src/module/HealthLog/HealthLog.dart';
import 'package:fitmemax/src/module/Workout/Workout.dart';
import 'package:fitmemax/src/module/dashboard/home/BlogCard.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
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
    return Backgrounds(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body:Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              controller: _controller,
              child: Column(
                children: [
                  DelayedDisplay(
                    delay: initialDelay,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15,right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 50,
                                width: _width-30,
                                decoration: BoxDecoration(
                                    borderRadius: borderRadious.primeryRadious,
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.white,
                                        Colors.white.withOpacity(0.7),
                                      ],
                                      begin: FractionalOffset.centerLeft,
                                      end: FractionalOffset.centerRight,
                                    )),
                                child: Padding(
                                  padding: EdgeInsets.only(right: 15, left: 10),
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
                                            size: 30,
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsets.only(right: 5),
                                            child: CircleAvatar(
                                              radius: 2,
                                              backgroundColor: Colors.white,
                                            ),
                                          )
                                        ],
                                      ),
                                      Text(
                                        "Book a live workout now",
                                        style: TextStyles.RegulerBlack,
                                      ),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: ColorPalette.PrimaryColor,
                                        size: 23,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Hi Shivay",
                                style: TextStyles.TitleWhite,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                  child: Text(
                                    "Based on your BMI (20.1) and goal you should consume 2000 calories a day",
                                    style: TextStyles.BodyGreyLightest,
                                    textAlign: TextAlign.center,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
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
                            borderRadius:borderRadious.primeryRadious,
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
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        PageTransition(
                                                            type:
                                                            PageTransitionType
                                                                .fade,
                                                            child:
                                                            HealthLog()));
                                                  },
                                                  child: hItem(
                                                    name: 'Health log',
                                                    image:
                                                    'assets/dashboard/mainIcon/heart.png',
                                                    context: context,
                                                  ),
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
                            color: ColorPalette.PrimaryColor,
                            context: context,
                            icon: Icons.call,
                            lebel: 'Book free call',
                          ),
                          hBar(
                              color: ColorPalette.PrimaryColor,
                              context: context,
                              icon: Icons.book,
                              lebel: 'eBook Courses'),
                          hBar(
                            color: ColorPalette.PrimaryColor,
                            context: context,
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
                                  style: TextStyles.TitleBlack),
                              Text(
                                'Book',
                                style: TextStyles.TitleFluracentGreen,
                              ),
                              Text('  Stories',
                                  style: TextStyles.TitleBlack),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: ColorPalette.FluracentGreen,
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
                              Text('Muscle Baba',
                                  style: TextStyles.TitleBlack),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
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
                                          style: TextStyles.BodyBlack
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
                              Text('Blogs',
                                  style: TextStyles.TitleBlack),
                            ],
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.reorder,
                              color: ColorPalette.PrimaryColor,
                            ),
                            onPressed: ()  {

                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index){
                        return BlogCard();
                      },
                    ),
                  ),
                ],
              ),
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
                                style: TextStyles.RegulerBIGWhite,
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

  Widget hBar(
      {BuildContext context,
      String lebel,
      IconData icon,
      Color color,}) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(left: _width * 0.65 * 0.04, top: 5, bottom: 5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
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
              SizedBox(
                width: _width * 0.65 * 0.05,
              ),
              Text(
                lebel,
                style: TextStyles.BodyBlack,
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
                  backgroundColor: ColorPalette.FluracentGreen,
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
                      backgroundColor: ColorPalette.PrimaryColor,
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
              style: TextStyles.BodyBlack,
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
            height: 7,
          ),
          Text(
            name,
            style: TextStyles.BodyBlack,
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
        color: isActive ? Colors.white : ColorPalette.PrimaryColor,
        border: isActive
            ? Border.all(
                color: ColorPalette.PrimaryColor,
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
