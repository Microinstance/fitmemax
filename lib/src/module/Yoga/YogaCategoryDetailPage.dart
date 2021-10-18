import 'package:fitmemax/src/module/Yoga/YogaFilterOne.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';

class YogaCategoryDetailPage extends StatefulWidget {
  @override
  _YogaCategoryDetailPageState createState() => _YogaCategoryDetailPageState();
}

class _YogaCategoryDetailPageState extends State<YogaCategoryDetailPage> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            brightness: Brightness.dark,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.view_headline_rounded,
                  color: Colors.white,
                ),
                onPressed: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (BuildContext context) {
                      return YogaFilterOne();
                    },
                    isScrollControlled: true,
                  );
                },
              ),
            ],
            expandedHeight: 200.0,
            floating: true,
            pinned: true,
            snap: true,
            elevation: 2,
            backgroundColor: Colors.orange,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text('Beginner Tour',
                    style: TextStyles.HeadingWhite),
                background: Image.asset(
                  'assets/yoga/yoga-model01.png',
                  fit: BoxFit.cover,
                )),
          ),
        ];
      },
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 12,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index){
            return Padding(
              padding: EdgeInsets.only(left: 15,right: 15,top: (index == 0) ? 20 : 0,bottom: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 90,
                    width: 160,
                    decoration: BoxDecoration(
                        borderRadius: borderRadious.primeryRadious,
                        image: DecorationImage(
                          image: AssetImage("assets/yoga/yoga-model01.png"),
                          fit: BoxFit.cover,
                        )
                    ),
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.black.withOpacity(0.3),
                            child: Icon(Icons.play_arrow_sharp,color: Colors.white,size: 20,),
                          ),
                        )
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0,bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: (_width-215),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Flexible(child: Text("Ashtanga Primary Series",style: TextStyles.ParaBoldBlack,)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Opacity(
                            opacity: 0.6,
                            child: Text("9 Workouts",style: TextStyles.BodyBlack,)),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    ));
  }
}
