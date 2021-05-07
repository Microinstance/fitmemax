import 'package:fitmemax/Objects/ButtonOne.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';

class SupportUs extends StatefulWidget {
  @override
  _SupportUsState createState() => _SupportUsState();
}

class _SupportUsState extends State<SupportUs> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.PrimaryColor,
        brightness: Brightness.dark,
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,color: Colors.white,size: 20,),
        ),
        title: Text("Support Us",style: TextStyles.TitleWhite,),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25,bottom: 30,left: 15,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Rate us",style: TextStyles.TitleBlackBold,textAlign: TextAlign.center,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30,left: 15,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(child: Text("Rate us on Google Play, your support will help build a better keep.",style: TextStyles.ParaBlack,textAlign: TextAlign.center,)),
                ],
              ),
            ),
            SizedBox(
              width: _width-40,
              child: ButtonOne(
                title: "Rate us",
                onPressed: (){},
                colors: ColorPalette.PrimaryColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30,bottom: 20,left: 15,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Donate us",style: TextStyles.TitleBlackBold,textAlign: TextAlign.center,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30,left: 15,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(child: Text("Rate us on Google Play, your support will help build a better keep.",style: TextStyles.ParaBlack,textAlign: TextAlign.center,)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25,right: 25,),
              child: Column(
                children: List.generate(3, (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 5,
                        backgroundColor: ColorPalette.PrimaryColor,
                      ),
                      SizedBox(width: 10,),
                      Text("Rate us on Google Play, your",style: TextStyles.ParaBlack)
                    ],
                  ),
                ))
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30,left: 20,right: 20,top: 10),
              child: Text("Rate us on Google Play, your support will help build a better keep  us on Google Play, your support wi  us on Google Play, your support wi.",style: TextStyles.ParaBlack),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 100,
                    width: (_width-40)/3.5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: borderRadious.primeryRadious,
                      border: Border.all(color: ColorPalette.PrimaryColor,width: 1)
                      ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.whatshot,color:ColorPalette.PrimaryColor,size: 25,),
                        SizedBox(height: 7,),
                        Text("₹130",style: TextStyles.HeadingPrimery,textAlign: TextAlign.center,),
                      ],
                    ),
                    ),
                  Container(
                    height: 100,
                    width: (_width-40)/3.5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: borderRadious.primeryRadious,
                      border: Border.all(color: Colors.black,width: 1)
                      ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.whatshot,color:Colors.black,size: 25,),
                        SizedBox(height: 7,),
                        Text("₹130",style: TextStyles.HeadingBoldBlack,textAlign: TextAlign.center,),
                      ],
                    ),
                    ),
                  Container(
                    height: 100,
                    width: (_width-40)/3.5,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: borderRadious.primeryRadious,
                        border: Border.all(color: Colors.black,width: 1)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.whatshot,color:Colors.black,size: 25,),
                        SizedBox(height: 7,),
                        Text("₹130",style: TextStyles.HeadingBoldBlack,textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25,bottom: 50),
              child: SizedBox(
                width: _width-40,
                child: ButtonOne(
                  title: "Donate",
                  onPressed: (){},
                  colors: ColorPalette.PrimaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
