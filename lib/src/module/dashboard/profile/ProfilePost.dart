import 'dart:io';

import 'package:fitmemax/src/module/dashboard/profile/Chat/page/ProfileChatPage.dart';
import 'package:fitmemax/src/module/dashboard/profile/Profile.dart';
import 'package:fitmemax/src/module/dashboard/profile/ProfileHome.dart';
import 'package:fitmemax/src/module/dashboard/profile/ProfileSearch.dart';
import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:page_transition/page_transition.dart';

class ProfilePost extends StatefulWidget {
  @override
  _ProfilePostState createState() => _ProfilePostState();
}

class _ProfilePostState extends State<ProfilePost> {

  File _image;
  final picker = ImagePicker();
  bool isLoading = false;
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        isLoading = true;
        _image = File(pickedFile.path);
      });
    }
    print(_image.toString());
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Palette.profileColor,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: Stack(
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
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Stack(
                      overflow: Overflow.visible,
                      alignment: Alignment.bottomCenter,
                      children: [
                        _image == null ?
                        ModalProgressHUD(
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
                          child: Container(
                            height: 300,
                            width: _width,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.5),
                                  width: 1,
                                ),
                                color: Colors.black,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                // image: DecorationImage(
                                //   image: AssetImage("assets/profile/Post/post1.jpg"),
                                //   fit: BoxFit.cover,
                                // )
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Upload Photos or Video",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 25),),
                                SizedBox(height: 10,),
                                Icon(Icons.upload_outlined,color: Palette.x1Color,size: 50,),
                              ],
                            ),
                          ),
                        ) :
                        Container(
                          height: 300,
                          width: _width,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white.withOpacity(0.5),
                              width: 1,
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                                image: FileImage(_image), fit: BoxFit.cover),
                            // image: DecorationImage(
                            //   image: AssetImage("assets/profile/Post/post1.jpg"),
                            //   fit: BoxFit.cover,
                            // )
                          ),
                        ),
                        Positioned(
                          bottom: -20,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: getImage,
                                child: CircleAvatar(
                                  radius: 22,
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.camera_alt,color: Colors.black,size: 27,
                                  ),
                                ),
                              ),
                              SizedBox(width: 20,),
                              CircleAvatar(
                                radius: 22,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.play_arrow_rounded,color: Colors.black,size: 40,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,bottom: 15),
                    child: Row(
                      children: [
                      Text("Captions",style: TextStyle(fontSize: 18,color: Colors.white.withOpacity(0.5)),),
                      Icon(Icons.star,color: Palette.x1Color,size: 10,),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: _width * 0.9,
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLength: 50,
                      minLines: 1,//Normal textInputField will be displayed
                      maxLines: 1,// when user presses enter it will adapt to it
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
                          borderRadius: BorderRadius.circular(5),
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
                  Padding(
                    padding: EdgeInsets.only(right:_width*0.1)/2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Max Word limit 50*",style: TextStyle(fontSize: 15,color: Palette.x1Color.withOpacity(0.5)),),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,bottom: 15),
                    child: Row(
                      children: [
                        Text("Description",style: TextStyle(fontSize: 18,color: Colors.white.withOpacity(0.5)),),
                        Icon(Icons.star,color: Palette.x1Color,size: 10,),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: _width * 0.9,
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLength: 200,
                      minLines: 6,
                      maxLines: 6,
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
                        hintText: "Type Description...",
                        hintStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        contentPadding:
                        EdgeInsets.only(left: 10, right: 10,top: 10,bottom: 10),
                        fillColor: Colors.grey[100],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right:_width*0.1)/2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Max Word limit 500*",style: TextStyle(fontSize: 15,color: Palette.x1Color.withOpacity(0.5)),),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,bottom: 15),
                    child: Row(
                      children: [
                        Text("# HashTags",style: TextStyle(fontSize: 18,color: Colors.white.withOpacity(0.5)),),
                        Icon(Icons.star,color: Palette.x1Color,size: 10,),
                      ],
                    ),
                  ),
                  SizedBox(
                    // height: 300,
                    width: _width * 0.9,
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLength: 200,
                      minLines: 6,
                      maxLines: 6,
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
                        hintText: "Type HashTags ...",
                        hintStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        contentPadding:
                        EdgeInsets.only(left: 10, right: 10,top: 10,bottom: 10),
                        fillColor: Colors.grey[100],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right:_width*0.1)/2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Max Word limit 500*",style: TextStyle(fontSize: 15,color: Palette.x1Color.withOpacity(0.5)),),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  MaterialButton(
                    onPressed: (){},
                    color: Palette.x1Color,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10,bottom: 10,left: 40,right: 40),
                      child: Text("Post",style: GoogleFonts.openSans(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
                    ),
                  ),
                  SizedBox(height: 140,),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child:  Padding(
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
                        // color: Palette.x1Color,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                child: ProfileHome()));
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
                                child: ProfileSearch()));
                      },
                    ),
                    // Stack(
                    //   alignment: Alignment.topRight,
                    //   children: [
                    //     IconButton(
                    //       icon: Icon(
                    //         Icons.favorite_border,
                    //         size: 30,
                    //         // color: Palette.x1Color,
                    //         color: Colors.white,
                    //       ),
                    //       onPressed: () {},
                    //     ),
                    //     CircleAvatar(
                    //         radius: 10,
                    //         backgroundColor: Palette.x1Color,
                    //         child: Center(
                    //             child: Text(
                    //           "3",
                    //           style: TextStyle(
                    //               color: Colors.black,
                    //               fontSize: 15,
                    //               fontFamily: 'Roboto',
                    //               fontWeight: FontWeight.bold),
                    //         ))),
                    //   ],
                    // ),
                    IconButton(
                      icon: Icon(
                        Icons.camera_alt_outlined,
                        size: 30,
                        // color: Palette.x1Color,
                        color: Palette.x1Color,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.chat_outlined,
                        size: 30,
                        // color: Palette.x1Color,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
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
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
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
}
