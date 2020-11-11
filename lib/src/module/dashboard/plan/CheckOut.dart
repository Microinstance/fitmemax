import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';

class CheckOut extends StatefulWidget {
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text("Checkout",style: TextStyle(color: Colors.black,fontSize: 20),),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Journey to 3x Faster!",style: TextStyle(fontSize: 25,color: Colors.black,),),
              ],
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left:15.0,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(child: Text("Balance users reach their goals 3x faster than other users on FitMeMax",style: TextStyle(fontSize: 18,color: Colors.black.withOpacity(0.7),),textAlign: TextAlign.center,)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                height: 250,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 3.0,
                      spreadRadius: 3.0
                  ),
                ],
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Padding(
                  padding:  EdgeInsets.only(left:10.0,right: 10),
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Balance ₹2,500/m",style: TextStyle(fontSize: 22,color: Palette.primaryColor ),),
                        ],
                      ),
                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("6 months",style: TextStyle(fontSize: 18,color: Colors.black.withOpacity(0.7) ),),
                          Text("₹15,000",style: TextStyle(fontSize: 18,color:  Colors.black.withOpacity(0.7) ),),
                        ],
                      ),
                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text("You save  ",style: TextStyle(fontSize: 18,color: Colors.black.withOpacity(0.7) ),),
                              Icon(Icons.arrow_upward)

                            ],
                          ),
                          Text("-₹2,500",style: TextStyle(fontSize: 18,color:  Colors.black.withOpacity(0.7) ),),
                        ],
                      ),
                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text("33% discount (Months)",style: TextStyle(fontSize: 18,color: Colors.black.withOpacity(0.7) ),),
                            ],
                          ),
                          Text("-₹2,500",style: TextStyle(fontSize: 18,color:  Colors.black.withOpacity(0.7) ),),
                        ],
                      ),
                      SizedBox(height: 15,),
                      Divider(),
                      SizedBox(height: 5,),
                      Padding(
                        padding:  EdgeInsets.only(left:5.0,right: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("You Pay",style: TextStyle(fontSize: 18,color: Colors.black ),),
                            Text("₹10,050",style: TextStyle(fontSize: 18,color:  Colors.black ),),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Get a Coupon?",style: TextStyle(fontSize: 22,color: Palette.primaryColor,fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(height: 20,),
            SizedBox(
              height: 50,
              width: _width*0.8,
              child: TextField(
                onChanged: (value){
                  setState(() {
                    print(value);
                  });
                },
                autofocus: false,
                style: TextStyle(fontSize: 18,color: Colors.black.withOpacity(0.9),),
                decoration: InputDecoration(
                  hintText: "Name",
                  hintStyle: TextStyle(fontSize: 15,color: Colors.black.withOpacity(0.5),),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  prefixIcon: Icon(Icons.face,color: Colors.black.withOpacity(0.8),),
                  contentPadding: EdgeInsets.only(left: 10,right: 10),
                  fillColor: Colors.grey[100],
                ),
              ),
            ),
            SizedBox(height: 15,),
            SizedBox(
              height: 50,
              width: _width*0.8,
              child: TextField(
                onChanged: (value){
                  setState(() {
                    print(value);
                  });
                },
                autofocus: false,
                style: TextStyle(fontSize: 18,color: Colors.black.withOpacity(0.9),),
                decoration: InputDecoration(
                  hintText: "Phone Number",
                  hintStyle: TextStyle(fontSize: 15,color: Colors.black.withOpacity(0.5),),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  prefixIcon: Icon(Icons.call,color: Colors.black.withOpacity(0.8),),
                  contentPadding: EdgeInsets.only(left: 10,right: 10),
                  fillColor: Colors.grey[100],
                ),
              ),
            ),
            SizedBox(height: 15,),
            SizedBox(
              height: 50,
              width: _width*0.8,
              child: TextField(
                onChanged: (value){
                  setState(() {
                    print(value);
                  });
                },
                autofocus: false,
                style: TextStyle(fontSize: 18,color: Colors.black.withOpacity(0.9),),
                decoration: InputDecoration(
                  hintText: "Location",
                  hintStyle: TextStyle(fontSize: 15,color: Colors.black.withOpacity(0.5),),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  prefixIcon: Icon(Icons.pin_drop,color: Colors.black.withOpacity(0.8),),
                  contentPadding: EdgeInsets.only(left: 10,right: 10),
                  fillColor: Colors.grey[100],
                ),
              ),
            ),
            SizedBox(height: 30,),
            MaterialButton(
              onPressed: (){},
              height: 50,
              color: Palette.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: Text("    Proceed To Payment    ",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
