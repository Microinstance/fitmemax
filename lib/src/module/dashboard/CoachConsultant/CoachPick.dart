import 'package:flutter/material.dart';

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
        backgroundColor: Colors.grey[100],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text("Pick Your Coach",style: TextStyle(color: Colors.black,fontSize: 20),),
        centerTitle: false,
        bottom: TabBar(
          controller: _tabController,
            // isScrollable: true,
          indicatorWeight: 2.0,
          indicatorColor: Colors.black45,
          tabs: [
            SizedBox(
              height: 50,
              child: Center(
                child: Text('Diet',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15)),
              ),
            ),
            SizedBox(
              height: 50,
              child: Center(
                child: Text('Fitness',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15)),
              ),
            ),
            SizedBox(
              height: 50,
              child: Center(
                child: Text("Yoga",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15)),
              ),
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
      padding: const EdgeInsets.only(left: 15,right: 15,top: 20),
      child: Container(
        height: 130,
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 2,
              spreadRadius: 2
            )
          ]
        ),
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
                  borderRadius: BorderRadius.all(Radius.circular(10)),
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
                Text("Yesh Mehata",style: TextStyle(fontSize: 20,color: Colors.black),),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.language,size: 18,),
                    SizedBox(width: 10,),
                    Text("English",style: TextStyle(fontSize: 15,color: Colors.black.withOpacity(0.8),),),
                    SizedBox(width: 5,),
                    Icon(Icons.circle,size: 5,),
                    SizedBox(width: 5,),
                    Text("Bengali",style: TextStyle(fontSize: 15,color: Colors.black.withOpacity(0.8),),),
                    SizedBox(width: 5,),
                    Icon(Icons.circle,size: 5,),
                    SizedBox(width: 5,),
                    Text("Hindi",style: TextStyle(fontSize: 15,color: Colors.black.withOpacity(0.8),),),
                  ],
                ),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.star,size: 18,),
                    SizedBox(width: 10,),
                    Text("Lifestyle",style: TextStyle(fontSize: 15,color: Colors.black.withOpacity(0.8),),),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
