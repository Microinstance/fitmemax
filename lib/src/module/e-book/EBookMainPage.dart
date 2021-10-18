import 'dart:ui';
import 'package:fitmemax/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EBookMainPage extends StatefulWidget {
  @override
  _EBookMainPageState createState() => _EBookMainPageState();
}

class _EBookMainPageState extends State<EBookMainPage> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15),),
                    child: SizedBox(
                      height: _height*0.5,
                      width: _width,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.asset('assets/eBook/book01.png', fit: BoxFit.cover),
                              ClipRRect(
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                  child: Container(
                                    color: Colors.black.withOpacity(0.5),
                                    alignment: Alignment.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ClipRRect(
                              borderRadius: BorderRadius.circular(7.5),
                              child: Image.asset('assets/eBook/book01.png', fit: BoxFit.contain , height:  _height*0.35,),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15,top: 15,bottom: 15),
                    child: Row(
                      children: [
                        Text("Description",style: TextStyles.RegulerBlack,),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15),
                      child: Text("Lorem Ipsumo  is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with",style: TextStyles.BodyBlack,),
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: _height*0.08,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                    ),
                    child: Center(child: Text("Read Now",style: TextStyles.TitleWhite,)),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,top: 5,right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SafeArea(
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.white.withOpacity(0.2),
                    child: Icon(
                      Icons.arrow_back,color: CupertinoColors.white,size: 20,
                    ),
                  ),
                ),

                SafeArea(
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.white.withOpacity(0.2),
                    child: Icon(
                      Icons.save_alt,color: CupertinoColors.white,size: 20,

                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
