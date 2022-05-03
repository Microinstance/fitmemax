import 'package:fitmemax/Services/apiProvider.dart';
import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../../../../styles.dart';

class Blog extends StatefulWidget {
  final String blogId;

  const Blog({Key key, this.blogId}) : super(key: key);
  @override
  _BlogState createState() => _BlogState();
}

class _BlogState extends State<Blog> {



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.primaryColor,
        brightness: Brightness.light,
        centerTitle: false,
        title: Text(
          "Blogs",
          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0.5,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.whatshot_rounded,color: ColorPalette.PrimaryColor,size: 25,),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: GestureDetector(
                          onTap: (){
                            //Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: Blog()));
                          },
                          child: Text("Healthy Lifestyle",style: TextStyles.TitleBlackBold,)
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text("10:45am 14 March",style: TextStyles.BodySmallBlack,),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10,bottom: 7),
            child: Container(
              height: 200,
              width: _width-30,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/blog/blog1.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: borderRadious.primeryRadious
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Flexible(child: Text("10 Healthy Foods to Keep Your Hunger Pangs Away Foods to Keep Your Hunger Pangs Away Foods to Keep Your Hunger Pangs Away Foods to Keep Your Hunger Pangs AwayFoods to Keep Your Hunger Pangs Away Foods to Keep Your Hunger Pangs Away Foods to Keep Your Hunger Pangs Away Foods to Keep Your Hunger Pangs Away Foods to Keep Your Hunger Pangs Away Foods to Keep Your Hunger Pangs Away Foods to Keep Your Hunger Pangs Away Foods to Keep Your Hunger Pangs Away Foods to Keep Your Hunger Pangs Away",style: TextStyles.ParaBlack,textAlign: TextAlign.start,)),
                SizedBox(height: 10,),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Flexible(child: Text("10 Healthy Foods to Keep Your Hunger Pangs Away Foods to Keep Your Hunger Pangs Away Foods to Keep Your Hunger Pangs Away Foods to Keep Your Hunger Pangs AwayFoods to Keep Your Hunger Pangs Away Foods to Keep Your Hunger Pangs Away Foods to Keep Your",style: TextStyles.ParaBlack,textAlign: TextAlign.start,)),
                SizedBox(height: 10,),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
