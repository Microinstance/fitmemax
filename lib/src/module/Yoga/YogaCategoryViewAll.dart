import 'package:fitmemax/src/module/Yoga/YogaCategoryDetailPage.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class YogaCategoryViewAll extends StatefulWidget {
  @override
  _YogaCategoryViewAllState createState() => _YogaCategoryViewAllState();
}

class _YogaCategoryViewAllState extends State<YogaCategoryViewAll> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,color: Colors.black,size: 20,),
        ),
        centerTitle: false,
        title: Text("Category",style: TextStyles.HeadingOrange),
      ),
       body: ListView.builder(
         shrinkWrap: true,
         itemCount: 10,
         itemBuilder: (BuildContext context, int index){
           return Padding(
             padding: EdgeInsets.only(left: 20,right: 20,bottom: 20,top: (index==0)? 20 : 0),
             child: GestureDetector(
               onTap: (){
                 Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: YogaCategoryDetailPage()));
               },
               child: Stack(
                 alignment: Alignment.center,
                 children: [
                   Container(
                     height: 200,
                     width: _width-40,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       image: DecorationImage(
                         image: AssetImage("assets/yoga/yoga-model01.png"),
                         fit: BoxFit.cover,
                       ),
                     ),
                   ),
                   Container(
                     height: 200,
                     width: _width-40,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       color: Colors.black.withOpacity(0.2),
                     ),
                   ),
                   Center(child: Text("Tone Up",style: TextStyles.HeadingWhite,)),
                 ],
               ),
             ),
           );
         },
       )
    );
  }
}
