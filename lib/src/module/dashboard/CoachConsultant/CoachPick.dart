import 'package:fitmemax/src/module/dashboard/CoachConsultant/CoachDetailPage.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class CoachPick extends StatefulWidget {
  @override
  _CoachPickState createState() => _CoachPickState();
}

class _CoachPickState extends State<CoachPick> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 0,
        backgroundColor: ColorPalette.GreyLightest,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.black,size: 20,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text("Pick Your Coach",style: TextStyles.TitleBlack),
        centerTitle: false,
        bottom: TabBar(
          controller: _tabController,
          indicatorWeight: 1.0,
          indicatorColor: ColorPalette.GreyDarkest,
          unselectedLabelColor: ColorPalette.GreyDarkest,
          labelColor: ColorPalette.GreyDarkest,
          tabs: [
            Tab(
              text: 'Diet',
            ),
            Tab(
              text: 'Fitness',
            ),
            Tab(
              text: 'Yoga',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        physics: BouncingScrollPhysics(),
        children: [
          _diet(),
          _diet(),
          _diet(),
        ],
      )
    );
  }
  Widget _diet(){
    return ListView.builder(
    shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index){
      return _pickCoach();
      },
    );
  }
  Widget _pickCoach(){
    return Padding(
      padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: CoachDetailPage()));
        },
        child: Container(
          height: 130,
          decoration: BoxDecoration(
            color: ColorPalette.GreyLightest,
            borderRadius: borderRadious.primeryRadious),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:  EdgeInsets.only(left:15.0,right: 15),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: borderRadious.primeryRadious,
                    image: DecorationImage(
                        image: AssetImage("assets/coachs/coachs5.png"),
                    fit: BoxFit.cover,
                    ),
                    border: Border.all(
                      color: Colors.black.withOpacity(0.1),
                      width: 0.5,
                    )
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Yesh Mehata",style: TextStyles.RegulerBlack),
                  SizedBox(height: 7,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.language,size: 18,),
                      SizedBox(width: 5,),
                      Text("English",style: TextStyles.BodyBlack,),
                      SizedBox(width: 5,),
                      Icon(Icons.circle,size: 5,),
                      SizedBox(width: 5,),
                      Text("Bengali",style: TextStyles.BodyBlack,),
                      SizedBox(width: 5,),
                      Icon(Icons.circle,size: 5,),
                      SizedBox(width: 5,),
                      Text("Hindi",style: TextStyles.BodyBlack,),
                    ],
                  ),
                  SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.star,size: 18,),
                      SizedBox(width: 10,),
                      Text("Lifestyle",style: TextStyles.BodyBlack),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
