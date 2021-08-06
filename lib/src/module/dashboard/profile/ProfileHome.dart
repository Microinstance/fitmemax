import 'package:fitmemax/StoryData/data.dart';
import 'package:fitmemax/src/ListData/ListData.dart';
import 'package:fitmemax/src/module/dashboard/Dashboard.dart';
import 'package:fitmemax/src/module/dashboard/profile/Chat/page/ProfileChatPage.dart';
import 'package:fitmemax/src/module/dashboard/profile/Profile.dart';
import 'package:fitmemax/src/module/dashboard/profile/ProfilePost.dart';
import 'package:fitmemax/src/module/dashboard/profile/ProfileSearch.dart';
import 'package:fitmemax/src/module/dashboard/profile/StoryScreen.dart';
import 'package:fitmemax/src/widgets/w_post_video_asset.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';
import 'package:page_transition/page_transition.dart';
import 'ProfileActivity.dart';
import 'ProfileFeedImage.dart';

class ProfileHome extends StatefulWidget {
  @override
  _ProfileHomeState createState() => _ProfileHomeState();
}

class _ProfileHomeState extends State<ProfileHome> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              PageTransition(
                type: PageTransitionType.topToBottom,
                child: Dashboard(),
              ),
            );
          },
          icon: Icon(
            Icons.arrow_back,
            color: ColorPalette.ProfileGreen,
            size: 20,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15, top: 10),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    size: 25,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type:
                        PageTransitionType.fade,
                        child: ProfileActivity(),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 2, right: 3),
                  child: CircleAvatar(
                      radius: 9,
                      backgroundColor: ColorPalette.ProfileGreen,
                      child: Center(
                          child: Text(
                            "3",
                            style: TextStyles.BodyBlack,
                          ))),
                ),
              ],
            ),
          ),
        ],
        title: RichText(
          text: TextSpan(children: [
            TextSpan(
              text: "Fit",
              style: TextStyles.TitleProfile,
            ),
            TextSpan(
              text: "Book",
              style:
              TextStyles.TitleWhite,
            ),
          ]),
        )
      ),
      body: Stack(
        children: [
          InViewNotifierList(
              scrollDirection: Axis.vertical,
              initialInViewIds: ['0'],
              isInViewPortCondition: (double deltaTop, double deltaBottom,
                  double viewPortDimension) {
                return deltaTop < (0.4 * viewPortDimension) &&
                    deltaBottom > (0.45 * viewPortDimension);
              },
              itemCount: 1,
              builder: (BuildContext context, int indexMain) {
                return SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  child: SafeArea(
                    child: Column(
                      children: [
                        Container(
                          height: 0.5,
                          width: _width,
                          color: Colors.white.withOpacity(0.3),
                        ),
                        Container(
                          height: 115,
                          decoration: BoxDecoration(
                            color: Colors.black,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10,top: 10,bottom: 10),
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: 8,
                              itemBuilder: (BuildContext context, int index1) {
                                if (index1 == 0) {
                                  return _yourStory();
                                } else
                                  return _StoryCircle();
                              },
                            ),
                          ),
                        ),
                        Container(
                          height: 0.5,
                          width: _width,
                          color: Colors.white.withOpacity(0.1),
                        ),
                        Container(
                          color: Colors.black,
                          child: MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            removeBottom: true,
                            removeLeft: true,
                            removeRight: true,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: Data().posts.length,
                              itemBuilder: (BuildContext context, int index) {
                                if (index == 7) {
                                  return Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        color: Colors.black,
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20, right: 20, top: 15),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Suggested For You",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18,
                                                        fontFamily: 'Roboto'),
                                                  ),
                                                  Icon(
                                                    Icons
                                                        .arrow_forward_ios_outlined,
                                                    color: ColorPalette.ProfileGreen,
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: 250,
                                              child: MediaQuery.removePadding(
                                                context: context,
                                                removeTop: true,
                                                removeBottom: true,
                                                removeLeft: true,
                                                removeRight: true,
                                                child: ListView.builder(
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount: 10,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index3) {
                                                    return _Suggetions();
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      (Data().posts[index]['type'] == 'image')
                                          ? Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 10.0),
                                              child: ProfileFeedImage(
                                                imageURL: Data().posts[index]
                                                    ['url'],
                                              ),
                                            )
                                          : Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 10.0),
                                              child: InViewNotifierWidget(
                                                id: '$index',
                                                builder: (BuildContext context,
                                                    bool isInView,
                                                    Widget child) {
                                                  return w_post_video_asset(
                                                    play: isInView,
                                                    url: Data().posts[index]
                                                        ['url'],
                                                  );
                                                },
                                              ),
                                            ),
                                    ],
                                  );
                                } else if (index == 11) {
                                  return Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        color: Colors.black,
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20, right: 20, top: 15),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Recent Stories",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18,
                                                        fontFamily: 'Roboto'),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: 300,
                                              child: MediaQuery.removePadding(
                                                context: context,
                                                removeTop: true,
                                                removeBottom: true,
                                                removeLeft: true,
                                                removeRight: true,
                                                child: ListView.builder(
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount: 10,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index5) {
                                                    return _StoryBox();
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      (Data().posts[index]['type'] == 'image')
                                          ? Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 10.0),
                                              child: ProfileFeedImage(
                                                imageURL: Data().posts[index]
                                                    ['url'],
                                              ),
                                            )
                                          : Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 10.0),
                                              child: InViewNotifierWidget(
                                                id: '$index',
                                                builder: (BuildContext context,
                                                    bool isInView,
                                                    Widget child) {
                                                  return w_post_video_asset(
                                                    play: isInView,
                                                    url: Data().posts[index]
                                                        ['url'],
                                                  );
                                                },
                                              ),
                                            ),
                                    ],
                                  );
                                } else {
                                  return (Data().posts[index]['type'] ==
                                          'image')
                                      ? Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 10.0),
                                          child: ProfileFeedImage(
                                            imageURL: Data().posts[index]
                                                ['url'],
                                          ),
                                        )
                                      : Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 10.0),
                                          child: InViewNotifierWidget(
                                            id: '$index',
                                            builder: (BuildContext context,
                                                bool isInView, Widget child) {
                                              return w_post_video_asset(
                                                play: isInView,
                                                url: Data().posts[index]
                                                    ['url'],
                                              );
                                            },
                                          ),
                                        );
                                }
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 140,
                        ),
                      ],
                    ),
                  ),
                );
              }),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 50),
              child: Container(
                height: 60,
                width: _width * 0.8,
                decoration: BoxDecoration(
                  color: ColorPalette.ProfileBackground,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.home_outlined,
                        size: 30,
                        color:ColorPalette.ProfileGreen,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.search_rounded,
                        size: 30,
                        // color: Palette.x1Color,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: ProfileSearch(),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.camera_enhance_outlined,
                        size: 30,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: ProfilePost(),
                          ),
                        );
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
                        Navigator.pushReplacement(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: ProfileChatPage(),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.person_outline,
                        size: 30,
                        // color: Palette.x1Color,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                child: Profile()));
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget _Suggetions() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          color: ColorPalette.ProfileGreen,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: ColorPalette.ProfileGreen.withOpacity(0.7),
              child: CircleAvatar(
                radius: 48,
                backgroundImage: AssetImage("assets/profile/profile1.png"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Shivay Kumar",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            SizedBox(
              height: 5,
            ),
            MaterialButton(
              height: 30,
              color: ColorPalette.ProfileGreen,
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Text("Follow"),
            )
          ],
        ),
      ),
    );
  }
  Widget _StoryBox() {
    return Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.bottomToTop,
                child: StoryScreen(stories: stories),
              ),
            );
          },
          child: Stack(
            children: [
              Container(
                width: 180,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    image: DecorationImage(
                      image: AssetImage("assets/profile/Post/post1.jpg"),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.5),
                      width: 1,
                    )),
              ),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.5),
                            Colors.transparent,
                          ],
                          begin: FractionalOffset.bottomCenter,
                          end: FractionalOffset.topCenter,
                        )),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor:ColorPalette.ProfileGreen.withOpacity(0.7),
                        child: CircleAvatar(
                          radius: 38,
                          backgroundImage:
                              AssetImage("assets/profile/profile1.png"),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "s_paradox",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Roboto'),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }
  Widget _StoryCircle() {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.bottomToTop,
              child: StoryScreen(stories: stories),
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 32,
              backgroundColor: ColorPalette.ProfileGreen.withOpacity(0.7),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("assets/profile/profile1.png"),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              width: 80,
              height: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                      child: Text(
                    "s_paradox",
                    style: TextStyles.BodyWhite
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _yourStory(){
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            PageTransition(
              type:
              PageTransitionType.bottomToTop,
              child:
              StoryScreen(stories: stories),
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: ColorPalette.ProfileGreen.withOpacity(0.7),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                        "assets/profile/me.png"),
                  ),
                ),
                CircleAvatar(
                    radius: 13,
                    backgroundColor: Colors.blue,
                    child: Center(
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 25,
                        )))
              ],
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              width: 80,
              height: 16,
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: [
                  Flexible(
                      child: Text(
                        "Your Story",
                        style: TextStyles.BodyWhite,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
