import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';

class MeditationInsightsForYou extends StatefulWidget {
  @override
  _MeditationInsightsForYouState createState() => _MeditationInsightsForYouState();
}

class _MeditationInsightsForYouState extends State<MeditationInsightsForYou> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFfdadad),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.white,size: 20,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text("Insights for you",style: TextStyles.TitleWhite,),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index){
          return Padding(
            padding: EdgeInsets.only(left: 20,right: 20,bottom: 15,top: (index==0)?20:0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: _width*0.3,
                  width: _width*0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.5),
                    image: DecorationImage(
                      image: AssetImage("assets/meditation/meditation03.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: (_width-(_width*0.3)-50),
                        child: Row(
                          children: [
                            Flexible(child: Text("How we accept our failures?",style: TextStyles.RegulerBlack,)),
                          ],
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Opacity(
                        opacity: 0.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.workspaces_outline,size: 15,color: Colors.black,),
                            SizedBox(
                              width: 5,
                            ),
                            Text("Video",style: TextStyles.BodyBlack,textAlign: TextAlign.center,),
                            SizedBox(
                              width: 5,
                            ),
                            CircleAvatar(
                              radius: 3,
                              backgroundColor: Colors.black,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text("7 Mins",style: TextStyles.BodyBlack,textAlign: TextAlign.center,),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundImage: AssetImage("images/userImage5.jpeg"),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text("Marrsia",style: TextStyles.BodyBlack,textAlign: TextAlign.center,),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
