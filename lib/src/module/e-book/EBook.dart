import 'package:fitmemax/src/module/e-book/EBookBestSellerDetailPage.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class EBook extends StatefulWidget {
  @override
  _EBookState createState() => _EBookState();
}

class _EBookState extends State<EBook> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[600],
        elevation: 0.5,
        centerTitle: true,
        bottom: PreferredSize(
            child: Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
              child: TextField(
                onChanged: (x){

                },
                autofocus: false,
                style: TextStyles.BodyBlack,
                cursorColor: ColorPalette.PrimaryColor,
                decoration: InputDecoration(
                    isDense: true,
                    hintText: "Search Here...",
                    prefixIcon: Icon(Icons.search,color: Colors.black,size: 20,),
                    suffixIcon: Icon(Icons.sort_rounded,color: Colors.black,size: 20,),
                    hintStyle: TextStyles.BodyBlack,
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
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
            preferredSize: Size.fromHeight(50.0)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.black,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text("e Book",style: TextStyles.HeadingBoldBlack,),
        actions: [
          IconButton(
            icon: Icon(Icons.search,color: Colors.black,),
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
              padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Bestsellers Books",style: TextStyles.RegulerBlack,),
                  GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            PageTransition(
                                type:
                                PageTransitionType
                                    .fade,
                                child:
                                EBookBestSellerDetailPage()));
                      },
                      child: Icon(Icons.arrow_forward_ios,size: 20,)),
                ],
              ),
            ),
            Container(
              height: 300,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index){
                  return Padding(
                    padding: EdgeInsets.only(top: 15,bottom: 15,left: (index==0) ? 15 : 0 ,right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Courses",style: TextStyles.RegulerBlack,),
                  GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            PageTransition(
                                type:
                                PageTransitionType
                                    .fade,
                                child:
                                EBookBestSellerDetailPage()));
                      },
                      child: Icon(Icons.arrow_forward_ios,size: 20,)),
                ],
              ),
            ),
            Container(
              child: ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index){
                  return Padding(
                    padding: EdgeInsets.only(left: 20,right: 20,bottom: 20,top: (index==0)? 20: 0),
                    child: Container(
                      height: 170,
                      width: _width-40,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            ClipRRect(
                               borderRadius: BorderRadius.circular(10),
                               child: Image.asset("assets/eBook/book01.png",fit: BoxFit.cover,height: 140,width: 100,)),
                            SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: _width-180,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Flexible(child: Text("Rich Dad & Poor Dad",style: TextStyles.ParaBlack,)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Flexible(child: Opacity(
                                          opacity:0.7,
                                          child: Text("Robert Kiyosaki",style: TextStyles.BodyBlack,))),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Wrap(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right: 3),
                                          child: Icon(Icons.bookmark_border,color: Colors.black,size: 20,),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.only(right: 15),
                                          child: Text(" 254"),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 3),
                                          child: Icon(Icons.save_alt,color: Colors.black,size: 20,),
                                        ),
                                        Text(" 156"),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Wrap(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(7.5),
                                              color: Colors.yellow,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 7,right: 7,bottom: 4,top: 4),
                                              child: Text("Drama",style: TextStyles.BodyBlack,),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(7.5),
                                              color: Colors.yellow,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 7,right: 7,bottom: 4,top: 4),
                                              child: Text("Drama",style: TextStyles.BodyBlack,),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(7.5),
                                              color: Colors.yellow,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 7,right: 7,bottom: 4,top: 4),
                                              child: Text("Drama",style: TextStyles.BodyBlack,),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Wrap(
                                      children: List.generate(5, (index) => Icon((index == 4) ?Icons.star_border : Icons.star,color: Colors.yellow[700],size: 20,))
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("xyz",style: TextStyles.RegulerBlack,),
                  GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            PageTransition(
                                type:
                                PageTransitionType
                                    .fade,
                                child:
                                EBookBestSellerDetailPage()));
                      },
                      child: Icon(Icons.arrow_forward_ios,size: 20,)),
                ],
              ),
            ),
            Container(
              child: ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index){
                  return Padding(
                    padding: EdgeInsets.only(left: 20,right: 20,bottom: 20,top: (index==0)? 20: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset("assets/eBook/book01.png",fit: BoxFit.cover,height: 90,width: 80,)),
                        SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: _width-180,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Flexible(child: Text("Rich Dad & Poor Dad",style: TextStyles.ParaBlack,)),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Flexible(child: Opacity(
                                      opacity:0.7,
                                      child: Text("Robert Kiyosaki",style: TextStyles.BodyBlack,))),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Wrap(
                                    children: List.generate(5, (index) => Icon((index == 4) ?Icons.star_border : Icons.star,color: Colors.yellow[700],size: 20,))
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.bookmark_border,color: Colors.black,size: 20,),
                      ],
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
