import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';

class Connect extends StatefulWidget {

  @override
  _ConnectState createState() => _ConnectState();
}

class _ConnectState extends State<Connect> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,size:20,color: Colors.black,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text("Connect",style: TextStyles.RegulerBlack,),
        actions: [
          Row(
            children: [
              Text("Today",style: TextStyles.BodyBlack,),
              Icon(Icons.arrow_drop_down,size:20,color: Colors.black,),
            ],
          ),
          IconButton(
            icon: Icon(Icons.share,size:20,color: Colors.black,),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.menu,size:20,color: Colors.black,),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '0 ',
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28),
                        ),
                        TextSpan(
                          text: 'of 10,000 steps walked',
                          style: TextStyles.ParaBlack
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.edit,size: 20,color: Colors.black,),
                ],
              ),
            ),
            Container(
              height: 10,
              width: _width-40,
              decoration: BoxDecoration(
                borderRadius: borderRadious.primeryRadious,
                color: Colors.grey[200],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 15),
              child: Row(
                children: [
                  Text("Connect to Application",style: TextStyles.RegulerBlack,),
                ],
              ),
            ),
          Container(
            height: 2,
            width: _width,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.05),
            ),
          ),
            Column(
              children: List.generate(5, (index) => ListTile(
                leading: Image.asset("assets/sign/google.png",fit: BoxFit.contain,height: 25,),
                title: Text("Google Fit",style: TextStyles.RegulerBlack,),
                trailing:  Text("INSTALL",style: TextStyle(fontSize: 16,color: Colors.deepOrange,fontWeight: FontWeight.bold),),
              )),
            ),
            Container(
              height: 20,
              width: _width,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.05),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 15),
              child: Row(
                children: [
                  Text("Connect to Device",style: TextStyles.RegulerBlack,),
                ],
              ),
            ),
            Container(
              height: 2,
              width: _width,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.05),
              ),
            ),
            Column(
              children: List.generate(2, (index) => ListTile(
                leading: Image.asset("assets/sign/apple.png",fit: BoxFit.contain,height: 25,color: Colors.black,),
                title: Text("Apple Fit",style: TextStyles.RegulerBlack,),
                trailing:  Text("CONNECT",style: TextStyle(fontSize: 16,color: Colors.deepOrange,fontWeight: FontWeight.bold),),
              )),
            ),
            Container(
              height: 20,
              width: _width,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.05),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Didn't find your device",style: TextStyles.RegulerBlack,),
                  Text("HELP",style: TextStyle(fontSize: 16,color: Colors.deepOrange,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            Container(
              height: 2,
              width: _width,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.05),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 15),
              child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled ",style: TextStyles.ParaBlack,textAlign: TextAlign.center,),
            ),
            SizedBox(height: 100,),
          ],
        ),
      ),
    );
  }
}
