import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';

class WalletPage extends StatefulWidget {
  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              children: [
                Stack(
                  overflow: Overflow.visible,
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      height: 330,
                      width: _width,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            ColorPalette.GrediantGreen1,
                            ColorPalette.GrediantGreen2,
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight
                        )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SafeArea(child: SizedBox()),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20,right: 20),
                            child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 55,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 53,
                                    backgroundImage: AssetImage("images/userImage7.jpeg"),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("My Pocket",style: TextStyles.ParaWhite,),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("₹4568",style: TextStyles.TitleWhite,),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Kori",style: TextStyles.ParaWhite,),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("14k",style: TextStyles.TitleWhite,),
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Spent",style: TextStyles.ParaWhite,),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("₹4568",style: TextStyles.TitleWhite,),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Coins",style: TextStyles.ParaWhite,),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("14k",style: TextStyles.TitleWhite,),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Jasmine Dube",style: TextStyles.TitleWhite,),
                                SizedBox(
                                  height: 3,
                                ),
                                Text("jasmindube@gmail.com",style: TextStyles.ParaWhite,),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: -50,
                      child: Container(
                        width: _width-50,
                        height: 106,
                        decoration: BoxDecoration(
                           borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular(15)),
                          color: ColorPalette.Yellow,
                          boxShadow:[ BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 7,
                            spreadRadius: 7,

                          )
                          ]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Total Earnings",style: TextStyles.ParaBlack,),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("₹568",style: TextStyles.TitleBlack),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("Withdraw available at ₹2000",style: TextStyles.BodyBlack),
                                ],
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: MaterialButton(
                                 elevation: 0,
                            splashColor: ColorPalette.GrediantRed2.withOpacity(0.2),
                            shape: RoundedRectangleBorder(
                                  borderRadius: borderRadious.secendaryRadious),
                            onPressed:(){},
                                  color: ColorPalette.GrediantRed2,
                            child: Padding(
                                padding: const EdgeInsets.only(top: 6,bottom: 7,left: 7,right: 7),
                                child: Text(
                                  "Withdraw",
                                  style: TextStyles.BodyWhite,
                                ),
                            ),
                          ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text("Buy Kori",style: TextStyles.RegulerBlack,),
                        trailing: IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.arrow_forward,size: 20,color: Colors.black,),
                        ),
                      ),
                      Divider(),
                      ListTile(
                        title: Text("Transaction History",style: TextStyles.RegulerBlack,),
                        trailing: IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.arrow_forward,size: 20,color: Colors.black,),
                        ),
                      ),
                      Divider(),
                      ListTile(
                        title: Text("Offers",style: TextStyles.RegulerBlack,),
                        trailing: IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.arrow_forward,size: 20,color: Colors.black,),
                        ),
                      ),
                      Divider(),
                      ListTile(
                        title: Text("Reedem",style: TextStyles.RegulerBlack,),
                        trailing: IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.arrow_forward,size: 20,color: Colors.black,),
                        ),
                      ),
                      Divider(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: ExpansionTile(
                    title: Text("How to get more Coins"),
                    children: [
                      ListTile(
                        title: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,",
                        style: TextStyles.BodySmallBlack,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: ExpansionTile(
                    title: Text("Conversion Rule"),
                    children: [
                      ListTile(
                        title: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,",
                        style: TextStyles.BodySmallBlack,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 10,top: 5),
                child: GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.white.withOpacity(0.1),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back,size: 20,color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
