import 'package:fitmemax/src/module/dashboard/profile/Chat/components/chat.dart';
import 'package:fitmemax/src/module/dashboard/profile/Chat/models/chat_users.dart';
import 'package:fitmemax/src/module/dashboard/profile/Profile.dart';
import 'package:fitmemax/src/module/dashboard/profile/ProfileHome.dart';
import 'package:fitmemax/src/module/dashboard/profile/ProfilePost.dart';
import 'package:fitmemax/src/module/dashboard/profile/ProfileSearch.dart';
import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ProfileChatPage extends StatefulWidget{
  @override
  _ProfileChatPageState createState() => _ProfileChatPageState();
}

class _ProfileChatPageState extends State<ProfileChatPage> {
  List<ChatUsers> chatUsers = [
    ChatUsers(text: "Jane Russel", secondaryText: "Awesome Setup", image: "images/userImage1.jpeg", time: "Now"),
    ChatUsers(text: "Glady's Murphy", secondaryText: "That's Great", image: "images/userImage2.jpeg", time: "Yesterday"),
    ChatUsers(text: "Jorge Henry", secondaryText: "Hey where are you?", image: "images/userImage3.jpeg", time: "31 Mar"),
    ChatUsers(text: "Philip Fox", secondaryText: "Busy! Call me in 20 mins", image: "images/userImage4.jpeg", time: "28 Mar"),
    ChatUsers(text: "Debra Hawkins", secondaryText: "Thankyou, It's awesome", image: "images/userImage5.jpeg", time: "23 Mar"),
    ChatUsers(text: "Jacob Pena", secondaryText: "will update you in evening", image: "images/userImage6.jpeg", time: "17 Mar"),
    ChatUsers(text: "Andrey Jones", secondaryText: "Can you please share the file?", image: "images/userImage7.jpeg", time: "24 Feb"),
    ChatUsers(text: "John Wick", secondaryText: "How are you?", image: "images/userImage8.jpeg", time: "18 Feb"),
  ];
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Palette.profileColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 15,right: 15,top: 15,bottom: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Chats",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Palette.x1Color),),
                        Container(
                          padding: EdgeInsets.only(left: 8,right: 8,top: 2,bottom: 2),
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.green[50],
                          ),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.add,color: Colors.black,size: 20,),
                              SizedBox(width: 2,),
                              Text("New",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15,bottom: 5),
                    child: SizedBox(
                      height: 48,
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
                            fontSize: 18,
                            color: Colors.black.withOpacity(0.5),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            color: Colors.black.withOpacity(0.8),
                          ),
                          contentPadding:
                          EdgeInsets.only(left: 10, right: 10),
                          fillColor: Colors.grey[100],
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                    itemCount: chatUsers.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 16),
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index){
                      return ChatUsersList(
                        text: chatUsers[index].text,
                        secondaryText: chatUsers[index].secondaryText,
                        image: chatUsers[index].image,
                        time: chatUsers[index].time,
                        isMessageRead: (index == 0 || index == 3)?true:false,
                      );
                    },
                  ),
                  SizedBox(height: 140),
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
                        Navigator.push(
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
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: ProfileSearch(),),);
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.camera_enhance_outlined,
                        size: 30,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
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
                        color: Palette.x1Color,
                      ),
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   PageTransition(
                        //     type: PageTransitionType.fade,
                        //     child: ProfileChatPage(),),);
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
          ),
        ],
      ),
    );
  }
}