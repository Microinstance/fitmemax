import 'package:fitmemax/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlogCard extends StatefulWidget {
  @override
  _BlogCardState createState() => _BlogCardState();
}

class _BlogCardState extends State<BlogCard> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        width: _width,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.whatshot_rounded,color: ColorPalette.PrimaryColor,size: 25,),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text("Healthy Lifestyle",style: TextStyles.TitleBlack,),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text("10:45am 14 March",style: TextStyles.BodySmallBlack,),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Flexible(child: Text("10 Healthy Foods to Keep Your Hunger Pangs Away",style: TextStyles.RegulerBlack,textAlign: TextAlign.start,)),
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
              Row(
                children: [
                  Icon(CupertinoIcons.suit_heart,color: ColorPalette.Pink,size: 25,),
                  Padding(
                    padding: const EdgeInsets.only(left: 5,right: 15),
                    child: Text("256",style: TextStyles.BodySmallBlack,),
                  ),
                  Icon(Icons.chat,color: ColorPalette.Teal,size: 25,),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text("256",style: TextStyles.BodySmallBlack,),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
