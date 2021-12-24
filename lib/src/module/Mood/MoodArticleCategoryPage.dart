import 'package:fitmemax/src/module/Mood/MoodArticleDetailPage.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class MoodArticleCategoryPage extends StatefulWidget {
  @override
  _MoodArticleCategoryPageState createState() => _MoodArticleCategoryPageState();
}

class _MoodArticleCategoryPageState extends State<MoodArticleCategoryPage> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFf6f6f6),
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
                    color: Color(0xFF5a4fd8),
                  ),
                ),
                Positioned(
                    top: -10,
                    left: -1,
                    child: Image.asset("assets/others/o01.png",height: 170,fit: BoxFit.contain,)),
                Positioned(
                    bottom: -1,
                    right: -1,
                    child: Image.asset("assets/others/o02.png",height: 170,fit: BoxFit.contain,)),
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
                            Text("Self Management",style: TextStyles.HeadingWhite,),
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
                                hintText:"Search Here ... ",
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
            Container(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 10,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index){
                  return Padding(
                    padding: EdgeInsets.only(left:20,bottom: 20,right: 20),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: MoodArticleDetailPage()));
                      },
                      child: Container(
                        height: 130,
                        decoration: BoxDecoration(
                          borderRadius: borderRadious.primeryRadious,
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                width: 130,
                                decoration: BoxDecoration(
                                  borderRadius: borderRadious.primeryRadious,
                                  color: Colors.blue[50],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10,top: 10,bottom: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width:_width-200,
                                    child: Row(
                                      children: [
                                        Flexible(child: Text("Self management",style: TextStyles.BodyRed,)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    width:_width-200,
                                    child: Row(
                                      children: [
                                        Flexible(child: Text("How To Increase Your Time",style: TextStyles.RegulerBlack,)),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
