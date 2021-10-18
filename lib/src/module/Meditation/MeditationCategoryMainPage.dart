import 'package:fitmemax/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MeditationCategoryMainPage extends StatefulWidget {
  @override
  _MeditationCategoryMainPageState createState() => _MeditationCategoryMainPageState();
}

class _MeditationCategoryMainPageState extends State<MeditationCategoryMainPage> {
  double _currentSliderValue = 20;
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: _height*0.4,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/meditation/nature01.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        height: _height*0.4,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15,top: 15,bottom: 15,right: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("Relaxation",style: TextStyles.DisplayWhite,),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s. when an unknown printer took a galley of type and scrambled it to ",style: TextStyles.ParaWhite,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: _height*0.6+40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15),)
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10,bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 6,
                                width: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.5),
                                  color: Colors.grey[300],
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20,bottom: 20),
                          child: Row(
                            children: [
                              Text("23 music seasion",style: TextStyles.TitleBlack,)
                            ],
                          ),
                        ),
                        Container(
                          height: _height*0.32,
                          color: Colors.white,
                          child: MediaQuery.removePadding(
                            removeTop: true,
                            context: context,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 20,
                              itemBuilder: (BuildContext context, int index){
                                return Padding(
                                  padding: const EdgeInsets.only(left: 20,bottom: 20,right: 20),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 18,
                                        backgroundColor: (index==1)? Colors.deepOrangeAccent : Colors.green,
                                        child: (index==1)? Icon(Icons.pause,color: Colors.white,size: 25,) : Icon(Icons.play_arrow_rounded,color: Colors.white,size: 25,),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 20),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("7 Days of Calm",style: TextStyles.RegulerBlack,),
                                            Opacity(
                                                opacity: 0.7,
                                                child: Text("Increase Happiness",style: TextStyles.ParaBlack,)),
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                      (index==3)? Icon(Icons.favorite,color: Colors.pink,size: 25,) : Icon(Icons.favorite_border,color: Colors.pink,size: 25,),
                                    ],
                                  ),
                                );
                              },
                            ),
                          )
                        ),
                        Container(
                          width: _width,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20,top: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("7 Days of Calm",style: TextStyles.RegulerBoldBlack,),
                                SizedBox(height: 1,),
                                Opacity(
                                    opacity: 0.5,
                                    child: Text("Increase Happiness",style: TextStyles.BodyBlack,)),
                                SizedBox(height: 0,),
                                MediaQuery.removePadding(
                                  context: context,
                                  removeTop: true,
                                  child: Slider(
                                    value: _currentSliderValue,
                                    min: 0,
                                    max: 100,
                                    divisions: 99,
                                    activeColor: Colors.deepOrangeAccent,
                                    inactiveColor: Colors.deepOrangeAccent.withOpacity(0.2),
                                    label: _currentSliderValue.round().toString(),
                                    onChanged: (double value) {
                                      setState(() {
                                        _currentSliderValue = value;
                                      });
                                    },
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.replay,color: Colors.black,size: 20,),
                                    CircleAvatar(
                                      radius: 18,
                                      backgroundColor: Colors.deepOrangeAccent,
                                      child: Icon(Icons.pause,color: Colors.white,size: 25,) ,
                                    ),
                                    RotatedBox(
                                        quarterTurns: -2,
                                        child: Icon(Icons.replay,color: Colors.black,size: 20,)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white.withOpacity(0.2),
                  child: Center(child: Icon(Icons.arrow_back,color: Colors.white,)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
