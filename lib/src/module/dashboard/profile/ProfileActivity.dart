import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        child: Column(
          children: [
            SizedBox(height: 15,),
            ListView.builder(
              itemCount: 3,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index){
                return _like(_width);
              },
            )
          ],
        ),
      ),
    );
  }
  Widget _like(_width){
    return Padding(
      padding: const EdgeInsets.only(left: 15,right: 15,bottom: 15),
      child: Container(
        width: _width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  image: DecorationImage(
                    image: AssetImage("assets/profile/me.png"),
                    fit: BoxFit.cover,
                  )
                ),
              ),
              SizedBox(width: 15,),
              SizedBox(
                  width: (_width-90),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Shivay kumar",style: GoogleFonts.openSans(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w500),),
                      SizedBox(width: 10,),
                      Expanded(child: Text("accepted your follow requestcepted your follow reqcepted your follow req",style: GoogleFonts.openSans(fontSize: 14,color: Colors.white.withOpacity(0.7),fontWeight: FontWeight.w500),)),
                      Text("Yeasterday",style: GoogleFonts.openSans(fontSize: 12,color: Colors.white.withOpacity(0.5),fontWeight: FontWeight.w500),),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
