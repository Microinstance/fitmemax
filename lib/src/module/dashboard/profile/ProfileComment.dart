import 'package:fitmemax/src/module/dashboard/profile/Profile.dart';
import 'package:fitmemax/src/module/dashboard/profile/ProfileHome.dart';
import 'package:fitmemax/src/module/dashboard/profile/ProfilePost.dart';
import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ProfileComment extends StatefulWidget {
  @override
  _ProfileCommentState createState() => _ProfileCommentState();
}

class _ProfileCommentState extends State<ProfileComment> {
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
            Navigator.pop(
              context);
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
                      ))
                ],
              ),
            ),
          ),
        ],
        title: Text(
          "Comments",
          style: TextStyle(
              color: Colors.white,
              fontSize: 25,
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15,top: 15,bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
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
                            radius: 25,
                            backgroundColor: Palette.x1Color,
                            child: CircleAvatar(
                              radius: 23,
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
                    SizedBox(width: 10,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: _width*0.7,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Flexible(child: Text("What Was that, Really Great View! ...",style: TextStyle(fontSize: 15,color: Palette.x1Color),)),
                              ],
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("52 min age",style: TextStyle(fontSize: 13,color: Colors.white.withOpacity(0.7)),),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(color: Colors.white,),
              Container(
                child: Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 10),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 30,
                    itemBuilder: (BuildContext context, int index){
                      return _Comment(_width);
                    },
                  ),
                ),
              ),
              SizedBox(height: 110,),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10,bottom: 5,right: 10),
                    child: Stack(
                      overflow: Overflow.visible,
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.grey[200].withOpacity(0.3),
                          child: CircleAvatar(
                            radius: 23,
                            backgroundColor: Colors.transparent,
                            backgroundImage: AssetImage("assets/profile/me.png"),
                          ),
                        ),
                        Positioned(
                            bottom: -1,
                            child: Icon(
                              Icons.check_circle,
                              color: Colors.blueAccent,
                              size: 18,
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    width: _width * 0.65,
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
                        contentPadding:
                        EdgeInsets.only(left: 10, right: 10),
                        fillColor: Colors.grey[200],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10,bottom: 5),
                    child: IconButton(
                      icon: Icon(Icons.arrow_upward_rounded,color: Colors.black,size: 35,),
                      onPressed: (){},
                    ),
                  )
                ],
              ),
            )
          )
        ],
      ),
    );
  }
  Widget _Comment(_width){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 0,left: 15,right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
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
                        ))
                  ],
                ),
              ),
              SizedBox(width: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: _width*0.7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(child: Text("Thats Amazing..!!",style: TextStyle(fontSize: 15,color: Colors.white),)),
                        ],
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("52 min age",style: TextStyle(fontSize: 13,color: Colors.white.withOpacity(0.7)),),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 5,),
        Padding(
          padding: EdgeInsets.only(left: _width *0.3,right: _width *0.3),
          child: Divider(color: Colors.white.withOpacity(0.05),),
        ),
        SizedBox(height: 10,)
      ],
    );
  }
}
