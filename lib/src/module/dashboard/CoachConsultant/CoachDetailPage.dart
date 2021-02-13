import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import 'CoachPick.dart';

class CoachDetailPage extends StatefulWidget {
  @override
  _CoachDetailPageState createState() => _CoachDetailPageState();
}

class _CoachDetailPageState extends State<CoachDetailPage> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor:Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.white,
                  centerTitle: false,
                  pinned: false,
                  expandedHeight: 230,
                  floating: false,
                  flexibleSpace: FlexibleSpaceBar(
                      background: Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/coachs/coach1.png"),
                                  fit: BoxFit.fitHeight,
                                ),
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30))
                            ),
                          ),
                          SafeArea(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: IconButton(
                                icon: Icon(Icons.arrow_back,color: Colors.red[700],size: 30,),
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                ),
              ];
            },
            body: SingleChildScrollView(
              child: Column(
                children: [
                  MediaQuery.removePadding(
                    context: context,
                    removeBottom: true,
                    child: SafeArea(
                      child: Text(
                        "Shweta Dube",
                        style: TextStyle(fontSize: 22,color: Colors.red[700],fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          "Premium Yoga Coach",
                          style: TextStyle(fontSize: 18,color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
                    child: Row(
                      children: [
                        Icon(Icons.language,size: 25,),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: _width - (10+30+25),
                          child: Wrap(
                            children: [
                              Text("Speaks : ",style: TextStyle(
                                fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold
                              ),),
                               ...List.generate(3, (index) => Padding(
                                 padding: const EdgeInsets.only(left: 5),
                                 child: Text("English",style: TextStyle(
                                     fontSize: 14,color: Colors.black
                                 ),),
                               ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
                    child: Row(
                      children: [
                        Icon(Icons.work_rounded,size: 25,),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Work : ",style: TextStyle(
                            fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold
                        ),),
                        Text("10:00am - 07:00pm",style: TextStyle(
                            fontSize: 16,color: Colors.black
                        ),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
                    child:
                    Text("Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word",style: TextStyle(
                        fontSize: 16,color: Colors.grey[500]
                    ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
                    child: Row(
                      children: [
                        Icon(Icons.wb_incandescent,size: 25,),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Specialization : ",style: TextStyle(
                            fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold
                        ),),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
                      child: Wrap(
                        children: [
                        ...List.generate(3, (index) =>   Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 35,
                                backgroundColor: Colors.grey[200],
                                child: Center(
                                  child: Icon(
                                    Icons.wine_bar,color: Colors.pink,size: 30,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5,bottom: 5),
                                child: Text("Stemina",style: TextStyle(
                                    fontSize: 16,color: Colors.black
                                ),),
                              ),
                            ],
                          ),
                        ),)
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
                    child: Row(
                      children: [
                        Icon(Icons.equalizer,size: 25,),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Qualification : ",style: TextStyle(
                            fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold
                        ),),

                      ],
                    ),
                  ),
                  Column(
                    children: List.generate(3, (index) => Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 7,right: 15),
                            child: CircleAvatar(
                              radius: 5,
                              backgroundColor: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: _width -(30+25),
                            child: Wrap(
                              children: [
                                Text("Contrary to popul ratur a Latin professor at Hampden-Sydney College in Virgin",
                                  style: TextStyle(fontSize: 16,color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                  )
                ],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: MaterialButton(
                onPressed: (){},
                height: 50,
                color: Colors.red[300],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25,bottom: 7,top: 7),
                  child: Text("Select Coach",style: GoogleFonts.lato(fontSize: 16,color:Colors.white,fontWeight: FontWeight.bold ),),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
