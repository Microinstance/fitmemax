import 'package:fitmemax/src/module/dashboard/profile/Chat/page/ProfileChatPage.dart';
import 'package:fitmemax/src/module/dashboard/profile/Profile.dart';
import 'package:fitmemax/src/module/dashboard/profile/ProfileHome.dart';
import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:page_transition/page_transition.dart';

import 'ProfilePost.dart';

class ProfileSearch extends StatefulWidget {
  @override
  _ProfileSearchState createState() => _ProfileSearchState();
}

class _ProfileSearchState extends State<ProfileSearch> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Palette.profileColor,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 10),
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
        actions: [
          IconButton(
            icon: Icon(
              Icons.search_rounded,
              size: 25,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
        title: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: SizedBox(
            height: 43,
            // width: _width * 0.5,
            child: TextField(
              onChanged: (value) {
                setState(() {
                  print(value);
                });
              },
              autofocus: false,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black.withOpacity(0.9),
              ),
              decoration: InputDecoration(
                hintText: "Type Captions ...",
                hintStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.black.withOpacity(0.5),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                // prefixIcon: Icon(
                //   Icons.title_outlined,
                //   color: Colors.black.withOpacity(0.8),
                // ),
                contentPadding:
                EdgeInsets.only(left: 10, right: 10),
                fillColor: Colors.grey[100],
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10,bottom: 15),
                    child: Container(
                      height: 35,
                      child: ListView.builder(
                        padding: EdgeInsets.only(right: 15),
                        itemCount: 10,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index){
                          return _HashTag();
                        },
                      ),
                    ),
                  ),
                  _SearchGrid(),
                  SizedBox(height: 140,),
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
                        color: Colors.white,
                        // color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: ProfileHome(),),);
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.search_rounded,
                        size: 30,
                        // color: Palette.x1Color,
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
                        Navigator.pushReplacement(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: ProfileChatPage(),),);
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
                                child: Profile(),),);
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
  Widget _HashTag(){
    return Padding(
      padding: EdgeInsets.only(left: 15),
      child: Container(
        height: 35,
        decoration: BoxDecoration(
          border: Border.all(width: 1,color: Palette.x1Color),
          borderRadius: BorderRadius.circular(5),
          color: Colors.black,
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 7,right: 7),
            child: Text("#FitMeMax",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
          ),
        ),
      ),
    );
  }
  Widget _SearchGrid(){
    return StaggeredGridView.countBuilder(
      padding: EdgeInsets.only(left: 5,right: 5),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      crossAxisCount: 3,
      itemCount: 102,
      mainAxisSpacing: 5.0,
      crossAxisSpacing: 5.0,
      itemBuilder: (BuildContext context, int index) {
        return  _GridItem();
      },
      staggeredTileBuilder: (int index){
        int remain  = index % 18;
        if (remain == 1 || remain == 9 ) {
          return StaggeredTile.count(2, 2);
        }
        return StaggeredTile.count(1, 1);
      },
    );
  }
  Widget _GridItem(){
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/gif/image_processing20200908-14153-18rh6ev.gif"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    );
  }
}
