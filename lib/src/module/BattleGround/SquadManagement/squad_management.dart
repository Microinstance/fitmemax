import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SquadManagement extends StatefulWidget {
  @override
  _SquadManagementState createState() => _SquadManagementState();
}

class _SquadManagementState extends State<SquadManagement> with SingleTickerProviderStateMixin{
  AnimationController _controller;
  Animation _animation;
  var players = [
    {'player_id': '12', 'name' : 'Player 1', 'avatar' : 'assets/profile/me.jpeg', 'batch': 'assets/battleground/1st.png', 'position' : 1, 'top' : 25.0, 'left': 70.0},
    {'player_id': '12', 'name' : 'Player 2', 'avatar' : 'assets/profile/profile1.png', 'batch': 'assets/battleground/1st.png', 'position' : 1, 'top' : 75.0, 'left': 290.0},
    {'player_id': '12', 'name' : 'Player 3', 'avatar' : 'assets/profile/me.jpeg', 'batch': 'assets/battleground/1st.png', 'position' : 1, 'top' : 25.0, 'left': 470.0},

    {'player_id': '12', 'name' : 'Player 4', 'avatar' : 'assets/profile/profile1.png', 'batch': 'assets/battleground/1st.png', 'position' : 1, 'top' : 175.0, 'left': 100.0},
    {'player_id': '12', 'name' : 'Player 5', 'avatar' : 'assets/profile/me.jpeg', 'batch': 'assets/battleground/1st.png', 'position' : 1, 'top' : 175.0, 'left': 290.0},
    {'player_id': '12', 'name' : 'Player 6', 'avatar' : 'assets/profile/profile1.png', 'batch': 'assets/battleground/1st.png', 'position' : 1, 'top' : 175.0, 'left': 440.0},

    {'player_id': '12', 'name' : 'Player 4', 'avatar' : 'assets/profile/profile1.png', 'batch': 'assets/battleground/1st.png', 'position' : 1, 'top' : 295.0, 'left': 130.0},
    {'player_id': '12', 'name' : 'Player 5', 'avatar' : 'assets/profile/me.jpeg', 'batch': 'assets/battleground/1st.png', 'position' : 1, 'top' : 300.0, 'left': 290.0},
    {'player_id': '12', 'name' : 'Player 6', 'avatar' : 'assets/profile/profile1.png', 'batch': 'assets/battleground/1st.png', 'position' : 1, 'top' : 295.0, 'left': 470.0},

  ];

  @override
  void initState() {
    // TODO: implement initState
    //super.initState();
    _controller = AnimationController(
        vsync: this,
      duration: Duration(seconds: 2)
    );
    _animation = Tween(
      begin: 0.0,
      end: 1.0
    ).animate(_controller);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool selected = false;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/battleground/background.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  //for(var item in players) playerList(item),
                  Container(
                    width : MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: PageView(
                      controller: PageController(
                        initialPage: 1,
                        viewportFraction: 1.0,
                      ),
                      children: [
                        Container(
                          child: Stack(
                            children: [
                              for(var item in players) playerList(item)
                            ],
                          ),
                        ),
                        Container(
                          child: Stack(
                            children: [
                              for(var item in players) playerList(item)
                            ],
                          ),
                        ),
                        Container(
                          child: Stack(
                            children: [
                              for(var item in players) playerList(item)
                            ],
                          ),
                        ),
                        Container(
                          child: Stack(
                            children: [
                              for(var item in players) playerList(item)
                            ],
                          ),
                        ),
                        Container(
                          child: Stack(
                            children: [
                              for(var item in players) playerList(item)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    left: 15,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('BACK'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.black87),
            width: 150,
            child: Column(
              children: [
                  Container(height: 15,),
                  Text("Team Spirit", style: TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Lato')),
                Container(height: 15,),
                  Image.asset("assets/battleground/99.png", width: 70,),
                Container(height: 25,),
                  Text("Team Strength", style: TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Lato')),
                  Text("5008", style: TextStyle(fontSize: 28.0, color: Colors.white, fontWeight: FontWeight.bold,  fontFamily: 'Lato')),
                Container(height: 25,),
                  Text("Cost", style: TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold,  fontFamily: 'Lato')),
                  Text("906/990", style: TextStyle(fontSize: 28.0, color: Colors.white, fontWeight: FontWeight.bold,  fontFamily: 'Lato')),
                Container(height: 25,),
                  Text("Offensive ", style: TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold,fontFamily: 'Lato')),
                  Text("4-1-2-3", style: TextStyle(fontSize: 28.0, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Lato')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget playerList(player){
    _controller.forward();
    return Positioned(
      width: 70.0,
      height: 70.0,
      top: player['top'],
      left: player['left'],
      child: GestureDetector(
        onTap: () {
          print(player['position']);
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.all(0),
                child: Container(
                  decoration: BoxDecoration(color: Colors.black87),
                  height: 250,
                  child: GridView.count(
                    crossAxisCount: 6,
                    children: List.generate(20, (index){
                        return GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/profile/me.jpeg'),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5),
                                      bottomLeft: Radius.circular(5),
                                      bottomRight: Radius.circular(5)
                                  )
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(5),
                                                bottomRight: Radius.circular(5)
                                            )
                                        ),
                                        child: Center(child: Text("Player "+index.toString(), style: TextStyle(color: Colors.amber),)),
                                      )
                                  ),
                                  Positioned(
                                      top: 2,
                                      left: 2,
                                      child: Image.asset('assets/battleground/1st.png', width: 20,)
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                    }),
                  )
                ),
              );
            }
          );

        },
        child: FadeTransition(
          opacity: _animation,
          child: Container(
            width: 70.0,
            height: 70.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(player['avatar']),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5)
                )
            ),
            child: Stack(
              children: [
                Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5)
                          )
                      ),
                      width: 70,
                      child: Center(child: Text(player['name'], style: TextStyle(color: Colors.amber),)),
                    )
                ),
                Positioned(
                    top: 2,
                    left: 2,
                    child: Image.asset(player['batch'], width: 20,)
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}
