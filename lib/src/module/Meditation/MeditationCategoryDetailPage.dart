import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';

class MeditationCategoryDetailPage extends StatefulWidget {

  @override
  _MeditationCategoryDetailPageState createState() => _MeditationCategoryDetailPageState();
}

class _MeditationCategoryDetailPageState extends State<MeditationCategoryDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFfdadad),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.white,size: 20,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text("Motivation",style: TextStyles.TitleWhite,),
      ),
      body: GridView.count(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
        shrinkWrap: true,
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 140/200,
        children: List.generate(20, (index) => Container(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 200,
                width: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.5),
                  image: DecorationImage(
                      image: AssetImage("assets/meditation/meditation04.jpg"),
                      fit: BoxFit.cover
                  ),
                ),
              ),
              Container(
                height: 50,
                width: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(7.5),bottomRight: Radius.circular(7.5),),
                  color: Colors.black.withOpacity(0.2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Train your mind",style: TextStyles.ParaWhite,),
                      SizedBox(height: 3,),
                      Text("5 Minutes",style: TextStyles.BodyWhite,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
