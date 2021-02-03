import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class WorkoutExplore extends StatefulWidget {
  @override
  _WorkoutExploreState createState() => _WorkoutExploreState();
}

class _WorkoutExploreState extends State<WorkoutExplore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,size: 20,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text("Exercises",style: TextStyle(color: Colors.black,fontSize: 20),),
      ),
      body: AnimationLimiter(
        child: GridView.count(
            shrinkWrap: true,
            childAspectRatio: 1,
            scrollDirection: Axis.vertical,
            crossAxisCount: 2,
            crossAxisSpacing: 15.0,
            mainAxisSpacing: 12.0,
            padding: EdgeInsets.only(left: 15,right: 15,top: 0,bottom: 30),
            children: List.generate(20, (index) =>  AnimationConfiguration.staggeredGrid(
              columnCount: 2,
              position: index,
              duration: const Duration(milliseconds: 700),
              child: ScaleAnimation(
                scale: 0.5,
                child: FadeInAnimation(
                    child: Container(
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.5),
                        image: DecorationImage(
                          image: AssetImage("assets/workout/abs.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      // child: Text("ABS Training",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: ),),
                    )
                ),
              ),
            ),)
        ),
      ),
    );
  }
}
