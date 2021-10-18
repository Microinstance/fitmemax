import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';

class EBookBestSellerDetailPage extends StatefulWidget {
  @override
  _EBookBestSellerDetailPageState createState() => _EBookBestSellerDetailPageState();
}

class _EBookBestSellerDetailPageState extends State<EBookBestSellerDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[600],
        elevation: 0.5,
        centerTitle: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.black,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text("Bestseller Books",style: TextStyles.HeadingBoldBlack,),
      ),
      body: GridView.count(
        scrollDirection: Axis.vertical,
        crossAxisCount: 2,
        childAspectRatio: 1/1.7,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        padding: EdgeInsets.only(left: 30,right: 20,top: 20,bottom: 30),
        shrinkWrap: true,
        children: List.generate(20, (index) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topRight,
              clipBehavior: Clip.none,
              children: [
                Container(
                  height:180,
                  width: 140,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.5),
                      image: DecorationImage(
                        image: AssetImage("assets/eBook/book01.png"),
                        fit: BoxFit.cover,
                      )
                  ),
                ),
                Visibility(
                  visible: (index==0) ? false : true,
                  child: Positioned(
                      top: -10,
                      right: -10,
                      child: Image.asset("assets/yoga/premium-quality.png",fit: BoxFit.contain,height: 30,)),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
                width: 130,
                child: Row(
                  children: [
                    Flexible(child: Text("Rich Dad & Poor Dad",style: TextStyles.ParaBlack,)),
                  ],
                )),
            SizedBox(
                width: 130,
                child: Row(
                  children: [
                    Flexible(child: Opacity(
                        opacity:0.7,
                        child: Text("Robert Kiyosaki",style: TextStyles.BodyBlack,))),
                  ],
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.star,color: Colors.yellow[600],size: 20,),
                SizedBox(
                  width: 5,
                ),
                Text("4.9",style: TextStyles.BodyBlack,)
              ],
            ),
          ],
        )),
      ),
    );
  }
}
