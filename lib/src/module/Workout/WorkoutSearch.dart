import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class WorkoutSearch extends StatefulWidget {
  @override
  _WorkoutSearchState createState() => _WorkoutSearchState();
}

class _WorkoutSearchState extends State<WorkoutSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Animator(
              tween: Tween<double>(begin: 0.8, end: 1.4),
              curve: Curves.fastOutSlowIn,
              cycles: 0,
              builder: (_, animationState, __) => Transform.scale(
                scale: animationState.value,
                child:  IconButton(
                  onPressed: (){

                  },
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.black,size: 20,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: SizedBox(
          height: 45,
          child: TextField(
            onChanged: (value){},
            autofocus: false,
            style: TextStyle(fontSize: 16,color: Colors.black),
            cursorColor: Colors.black,
            decoration: InputDecoration(
                isDense: false,
                hintText: "Search Here...",
                hintStyle: TextStyle(fontSize: 16,color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                fillColor: Colors.grey[100],
                contentPadding: EdgeInsets.only(top: 10,right: 10,left: 10,bottom: 10)
            ),
          ),
        ),
      ),
    );
  }
}
