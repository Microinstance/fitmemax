import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChampionResult extends StatefulWidget {
  const ChampionResult({key}) : super(key: key);

  @override
  _ChampionResultState createState() => _ChampionResultState();
}

class _ChampionResultState extends State<ChampionResult> {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return Scaffold(
        body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              stops: [
                0.15,
                0.54,
                0.79,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xFF043c95),
                Color(0xff074ebf),
                Color(0xFF043c95),
              ],
            )
        ),
        child: Row(
          children: [
            Expanded(
               child: Stack(
                 children: [
                   Positioned(
                     top: 15,
                     left: 125,
                     child: Text("Championship Result".toUpperCase(), style: TextStyle(color: Colors.yellow, fontFamily: "Lato", fontSize: 25, fontWeight: FontWeight.bold))
                   ),
                   Positioned(
                     top: 60,
                      child: Container(
                        width: MediaQuery.of(context).size.width - 300,
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text("2nd Place", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
                                  Container(
                                    //margin: const EdgeInsets.all(30.0),
                                    width: 130,
                                    height: 160,
                                    decoration: BoxDecoration(
                                      color: Color(0xbc373739),
                                        border: Border.all(
                                          width: 3,
                                          color: Color(0XFFe2be44),
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage("images/userImage1.jpeg"),
                                                fit: BoxFit.cover,
                                              ),
                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                              border: Border.all(width: 2, color: Color(0XFF4e4d5b))
                                            ),
                                            height: 100,
                                            width: 150,
                                          ),
                                        ),
                                        Container(
                                          height: 30,
                                          width: 105,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.all(Radius.circular(5)),
                                          ),
                                          child: Center(
                                            child: Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child: Text("Partha".toUpperCase(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text("1nd Place", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
                                  Container(
                                    //margin: const EdgeInsets.all(30.0),
                                    width: 130,
                                    height: 200,
                                    decoration: BoxDecoration(
                                        color: Color(0xbc373739),
                                        border: Border.all(
                                          width: 3,
                                          color: Color(0XFFe2be44),
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black,
                                                  ),
                                                  BoxShadow(
                                                    color: Colors.black,
                                                    spreadRadius: -12.0,
                                                    blurRadius: 12.0,
                                                  ),
                                                ],
                                                image: DecorationImage(
                                                  image: AssetImage("images/userImage1.jpeg"),
                                                  fit: BoxFit.cover,
                                                ),
                                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                                border: Border.all(width: 2, color: Color(0XFF4e4d5b))
                                            ),
                                            height: 140,
                                            width: 150,
                                          ),
                                        ),
                                        Container(
                                          height: 30,
                                          width: 105,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.all(Radius.circular(5)),
                                          ),
                                          child: Center(
                                            child: Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child: Text("Partha".toUpperCase(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text("3rd Place", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
                                  Container(
                                    //margin: const EdgeInsets.all(30.0),
                                    width: 130,
                                    height: 160,
                                    decoration: BoxDecoration(
                                        color: Color(0xbc373739),
                                        border: Border.all(
                                          width: 3,
                                          color: Color(0XFFe2be44),
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage("images/userImage1.jpeg"),
                                                  fit: BoxFit.cover,
                                                ),
                                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                                border: Border.all(width: 2, color: Color(0XFF4e4d5b))
                                            ),
                                            height: 100,
                                            width: 150,
                                          ),
                                        ),
                                        Container(
                                          height: 30,
                                          width: 105,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.all(Radius.circular(5)),
                                          ),
                                          child: Center(
                                            child: Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child: Text("Partha".toUpperCase(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                   ),
                   Positioned(
                       bottom: 15,
                       left: 30,
                       child: Container(
                           decoration: BoxDecoration(
                               gradient: LinearGradient(
                                 stops: [
                                   0.15,
                                   0.54,
                                   0.79,
                                 ],
                                 begin: Alignment.centerLeft,
                                 end: Alignment.centerRight,
                                 colors: [
                                   Color(0xFF043c95),
                                   Color(0xff074ebf),
                                   Color(0xFF043c95),
                                 ],
                               )
                           ),
                           child: Padding(
                             padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10, bottom: 10),
                             child: Column(
                               children: [
                                 Text("Congratulations to the winners!".toUpperCase(), style: TextStyle(color: Colors.white, fontFamily: "Lato", fontSize: 20)),
                                 Text("Don't miss out next time!".toUpperCase(), style: TextStyle(color: Colors.white, fontFamily: "Lato", fontSize: 20)),
                               ],
                             ),
                           )
                       )
                   ),
                   Positioned(
                     top: 80,
                     left: 165,
                     child: Image.asset("images/1st.png", width: 50,),
                   )
                 ],
               )
            ),
            Container(
              width: 300,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [

                    Text("Top 100 Players Take The Pot!".toUpperCase(), style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lato'
                    ),),
                    SizedBox(height: 15,),
                    Container(
                      height: MediaQuery.of(context).size.height - 50,
                      child: ListView(
                        shrinkWrap: true,
                        children: <Widget>[
                          Container(
                            decoration : BoxDecoration(
                              color: Color(0xFF043c95)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage: AssetImage("images/userImage1.jpeg"),
                                  backgroundColor: Colors.transparent,
                                ),
                                title: Text("# Partha Gorai", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                trailing: Text("78455", style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            decoration : BoxDecoration(
                                color: Color(0xFF043c95)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage: AssetImage("images/userImage1.jpeg"),
                                  backgroundColor: Colors.transparent,
                                ),
                                title: Text("# Partha Gorai", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                trailing: Text("78455", style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            decoration : BoxDecoration(
                                color: Color(0xFF043c95)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage: AssetImage("images/userImage1.jpeg"),
                                  backgroundColor: Colors.transparent,
                                ),
                                title: Text("# Partha Gorai", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                trailing: Text("78455", style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            decoration : BoxDecoration(
                                color: Color(0xFF043c95)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage: AssetImage("images/userImage1.jpeg"),
                                  backgroundColor: Colors.transparent,
                                ),
                                title: Text("# Partha Gorai", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                trailing: Text("78455", style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            decoration : BoxDecoration(
                                color: Color(0xFF043c95)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage: AssetImage("images/userImage1.jpeg"),
                                  backgroundColor: Colors.transparent,
                                ),
                                title: Text("# Partha Gorai", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                trailing: Text("78455", style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
