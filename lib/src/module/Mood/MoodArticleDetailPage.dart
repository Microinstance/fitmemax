import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';

class MoodArticleDetailPage extends StatefulWidget {

  @override
  _MoodArticleDetailPageState createState() => _MoodArticleDetailPageState();
}

class _MoodArticleDetailPageState extends State<MoodArticleDetailPage> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5a4fd8),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.white,size: 20,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text("How To Control Your Mind",style: TextStyles.ParaWhite,),
      ),
      body: ListView.builder(
        itemCount: 20,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index){
          return Padding(
            padding: EdgeInsets.only(bottom: 25,top: (index == 0) ? 20:0,left: 20,right: 20),
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: _width -40,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(7.5),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5,bottom: 5),
                  child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.",),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.favorite_border,color: Colors.red,size: 22,),
                        Text("  457",style: TextStyles.BodySemiBoldBlack,),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.chat_outlined,color: Color(0xFF5a4fd8),size: 22,),
                        Text(" 89",style: TextStyles.BodySemiBoldBlack,),

                      ],
                    ),
                    Opacity(
                        opacity: 0.7,
                        child: Text("27:08:21",style: TextStyles.BodyBlack,)),
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
