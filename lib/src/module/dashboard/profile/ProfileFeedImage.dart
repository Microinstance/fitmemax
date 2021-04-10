import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'ProfileComment.dart';
import 'ProfilePostOption.dart';
import 'ProfileVisit.dart';

class ProfileFeedImage extends StatefulWidget {
  final String imageURL;

  const ProfileFeedImage({Key key, this.imageURL}) : super(key: key);
  @override
  _ProfileFeedImageState createState() => _ProfileFeedImageState();
}

class _ProfileFeedImageState extends State<ProfileFeedImage> {
  bool  _expanded = false;
  bool  _like = false;
  bool  _bookmark = false;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top:20),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20,),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 75),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Shivay Kumar",style: TextStyles.ParaWhite,),
                            Text("Level 1",style: TextStyles.BodyWhite,),
                          ],
                        ),
                        GestureDetector(
                            onTap: (){
                              showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (BuildContext context) {
                                  return ProfilePostOption();
                                },
                                isScrollControlled: true,
                              );
                            },
                            child: Icon(Icons.more_vert,color: Colors.white,)),
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
                  AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white.withOpacity(0.1),
                          width: 1,
                        ),
                        borderRadius: borderRadious.primeryRadious,
                        image: DecorationImage(
                          image: AssetImage("assets/profile/Post/post1.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _like ? GestureDetector(
                          onTap: (){
                            setState(() {
                              _like = false;
                            });
                          },
                          child: Icon(Icons.favorite,color: ColorPalette.ProfileGreen,)) : GestureDetector(
                          onTap: (){
                            setState(() {
                              _like = true;
                            });
                          },
                          child: Icon(Icons.favorite_outline_rounded,color: ColorPalette.ProfileGreen,)),
                      SizedBox(width: 5,),
                      Text("3.45k",style: TextStyles.BodyWhite),
                      SizedBox(width: 20,),
                      GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.bottomToTop,
                                child: ProfileComment(),),);
                          },
                          child: Icon(Icons.chat_bubble_outline_rounded,color: ColorPalette.ProfileGreen)),
                      SizedBox(width: 5,),
                      Text("125",style: TextStyles.BodyWhite),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text("35 min ago",style: TextStyles.BodySmallWhite),
                      ),
                      _bookmark ? GestureDetector(
                        onTap: (){
                          setState(() {
                            _bookmark = false;
                          });
                        },
                        child: Icon(Icons.bookmark,color: ColorPalette.ProfileGreen,size: 25,),) : GestureDetector(
                        onTap: (){
                          setState(() {
                            _bookmark = true;
                          });
                        },
                        child: Icon(Icons.bookmark,color: Colors.white,size: 25,),),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: _width*0.85,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Flexible(child: Text("What Was that, Really Great View! ...",style: TextStyles.BodySmallWhite,)),
                              ],
                            ),
                            SizedBox(height: 3,),
                            _expanded ? _More(_width) : GestureDetector(
                              onTap: (){
                                setState(() {
                                  setState(() {
                                    _expanded = true;
                                  });
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("...more",style: TextStyles.BodyMediumPrimary,),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Divider(color: Colors.white.withOpacity(0.4),),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.bottomToTop,
                        child: ProfileVisit(),),);
                  },
                  child: CircleAvatar(
                    radius: 34,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      radius: 32,
                      backgroundColor: ColorPalette.ProfileGreen.withOpacity(0.7),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(
                            "assets/profile/profile1.png"),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _More(_width){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 5,),
        SizedBox(
          width: _width*0.8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(child: Text("Bleh, sucks. The secret to coming up with the best Instagram captions the first time around is to write a bunch of captions first before choosing one. You can create a short list of ideas, browse hashtags for inspo, or look up puns for your keyword.",
                style: TextStyles.BodyWhite,
              ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10,),
        SizedBox(
          width: _width*0.6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(child: Text("#love #instagood#me #cute #tbt #photooftheday #instamood #iphonesia #tweegram #picoftheday #igers",
                style: TextStyles.RegulerProfile,
              ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10,),
        GestureDetector(
          onTap: (){
            setState(() {
              setState(() {
                _expanded = false;
              });
            });
          },
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("...less",style: TextStyles.BodyGreyLightest,),
              Text("14 Oct",style: TextStyles.BodyGreyLightest,),
            ],
          ),
        )
      ],
    );
  }
}
