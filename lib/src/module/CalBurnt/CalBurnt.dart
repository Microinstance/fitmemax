import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';

class CalBurnt extends StatefulWidget {

  @override
  _CalBurntState createState() => _CalBurntState();
}

class _CalBurntState extends State<CalBurnt> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 200,
                  width: _width,
                  decoration: BoxDecoration(
                    color: Color(0xFFf12711),
                  ),
                ),
                Positioned(
                    top: -10,
                    left: -1,
                    child: Image.asset("assets/others/o01.png",height: 170,fit: BoxFit.contain,color: Color(0xFFf5af19),)),
                Positioned(
                    bottom: -1,
                    right: -1,
                    child: Image.asset("assets/others/o02.png",height: 170,fit: BoxFit.contain,color : Color(0xFFf5af19))),
                SafeArea(
                  child: IconButton(onPressed: (){
                    Navigator.pop(context);
                  },
                      icon: Icon(Icons.arrow_back,color: Colors.white,size: 20,)),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Calorie Burnt",style: TextStyles.HeadingWhite,),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 40, right: 40,top: 30),
                          child: TextField(
                            onChanged: (X){},
                            autofocus: false,
                            style: TextStyles.BodyBlack,
                            cursorColor: ColorPalette.PrimaryColor,

                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.search,size:20,color: Colors.black,),
                                  onPressed: (){},
                                ),
                                isDense: false,
                                hintText:"Search Workout here ... ",
                                hintStyle: TextStyles.BodyBlack,
                                border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(5.0),
                                  ),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                filled: true,
                                fillColor: ColorPalette.GreyLightest,
                                contentPadding: EdgeInsets.only(top: 12,right: 10,left: 10,bottom: 12)
                            ),
                          ),
                        ),
                      ],
                    ),
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
