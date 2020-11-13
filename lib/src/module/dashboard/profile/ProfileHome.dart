import 'package:dotted_border/dotted_border.dart';
import 'package:fitmemax/src/module/dashboard/profile/Profile.dart';
import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ProfileHome extends StatefulWidget {
  @override
  _ProfileHomeState createState() => _ProfileHomeState();
}

class _ProfileHomeState extends State<ProfileHome> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Palette.profileColor,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.camera_enhance_outlined,
            size: 25,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5, bottom: 5),
            child: Stack(
              overflow: Overflow.visible,
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey[200].withOpacity(0.3),
                  child: CircleAvatar(
                    radius: 17,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage("assets/profile/me.png"),
                  ),
                ),
                Positioned(
                    bottom: -1,
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.blueAccent,
                      size: 15,
                    ))
              ],
            ),
          ),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Fit",
              style: TextStyle(
                  color: Palette.x1Color,
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              "Book",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
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
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 8,
                        itemBuilder: (BuildContext context, int index) {
                          if (index == 0) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: GestureDetector(
                                onTap: () {},
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    DottedBorder(
                                      borderType: BorderType.Circle,
                                      color: Palette.x1Color,
                                      strokeWidth: 1,
                                      dashPattern: [10],
                                      child: ClipOval(
                                        child: Container(
                                          height: 60,
                                          width: 60,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    CircleAvatar(
                                      backgroundColor: Colors.black,
                                      radius: 30,
                                      child: Icon(
                                        Icons.add,
                                        size: 30,
                                        color: Palette.x1Color,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          } else
                            return Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  DottedBorder(
                                    borderType: BorderType.Circle,
                                    color: Palette.x1Color.withOpacity(0.5),
                                    strokeWidth: 2,
                                    dashPattern: [10],
                                    child: ClipOval(
                                      child: Container(
                                        height: 60,
                                        width: 60,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundImage: AssetImage(
                                        "assets/profile/profile1.png"),
                                  ),
                                ],
                              ),
                            );
                        },
                      ),
                    ),
                  ),
                  Container(
                    height: 0.5,
                    width: _width,
                    color: Colors.white.withOpacity(0.1),
                  ),

                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
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
                        color: Palette.x1Color,
                        // color: Colors.white,
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
                      onPressed: () {},
                    ),
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
                        Icons.chat_outlined,
                        size: 30,
                        // color: Palette.x1Color,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.person_outline,
                        size: 30,
                        // color: Palette.x1Color,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
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
  Widget _Post(){
    return Container();
  }
}
