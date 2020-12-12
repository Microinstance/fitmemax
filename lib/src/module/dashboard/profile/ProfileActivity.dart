import 'package:fitmemax/src/widgets/palette.dart';
import 'package:fitmemax/src/widgets/profile_acitvity.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'Profile.dart';

class ProfileActivity extends StatefulWidget {
  @override
  _ProfileActivityState createState() => _ProfileActivityState();
}

class _ProfileActivityState extends State<ProfileActivity> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Palette.profileColor,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 25,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5, bottom: 5),
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: Profile(),),);
              },
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
                      ),
                  )
                ],
              ),
            ),
          ),
        ],
        title: Text(
          "Activity",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 5,),
            MediaQuery.removePadding(
              removeBottom: true,
              context: context,
              removeTop: true,
              child: ListView.builder(
                itemCount: 5,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index){
                  return  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: FollowActivity(
                        followerUsername: 'tenzin_choekyi',
                        followerImageUrl: "images/userImage6.jpeg",
                        isFollowed: false
                    ),
                  ) ;
                },
              ),
            ),
            MediaQuery.removePadding(
              removeBottom: true,
              context: context,
              removeTop: true,
              child: ListView.builder(
                itemCount: 5,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index){
                  return   Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: CommentActivity(
                      isMention: true,
                      otherUsername: 'ttruselph',
                      otherUserProfileImageUrl: "images/userImage8.jpeg",
                      comment: 'jpt journalist n jpt reporting',
                      commentedOnMediaUrl: "images/userImage3.jpeg",
                    ),
                  ) ;
                },
              ),
            ),
            MediaQuery.removePadding(
              context: context,
              removeTop: true,
              removeBottom: true,
              child: ListView.builder(
                itemCount: 5,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index){
                  return  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: LikeActivity(
                      likedUserImageUrls: "images/userImage7.jpeg",
                      likedUsernames: 'shivay_paradox',
                      postUrl: 'images/userImage3.jpeg',
                    ),
                  ) ;
                },
              ),
            ),
            MediaQuery.removePadding(
              removeBottom: true,
              context: context,
              removeTop: true,
              child: ListView.builder(
                itemCount: 5,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index){
                  return   Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: CommentActivity(
                      isMention: false,
                      otherUsername: 'ttruselph',
                      otherUserProfileImageUrl: "images/userImage8.jpeg",
                      comment: 'jpt journalist n jpt reporting',
                      commentedOnMediaUrl: "images/userImage3.jpeg",
                    ),
                  ) ;
                },
              ),
            ),
            SizedBox(height: 140,),
          ],
        ),
      ),
    );
  }
}
