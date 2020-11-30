import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class dummy extends StatefulWidget {
  @override
  _dummyState createState() => _dummyState();
}

class _dummyState extends State<dummy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AssetVideoPlayer(),
      ),
    );
  }
}

class AssetVideoPlayer extends StatefulWidget {
  @override
  _AssetVideoPlayerState createState() => _AssetVideoPlayerState();
}

class _AssetVideoPlayerState extends State<AssetVideoPlayer> {
  // VideoPlayerController _controller;
  // @override
  // void initState() {
  //   super.initState();
  //   _controller = VideoPlayerController.asset('assets/Video/video3.mp4');
  //   _controller.addListener(() {
  //     setState(() {});
  //   });
  //   _controller.setLooping(true);
  //   _controller.initialize().then((_) => setState(() {}));
  //   _controller.play();
  //   _controller.setVolume(0.1);
  // }
  //
  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      "http://neutronvision.com/shivay_video.mp4",
    );
    _controller.addListener(() {
      setState(() {});
    });
      _controller.setLooping(true);
      _controller.initialize().then((_) => setState(() {}));
      _controller.play();
      _controller.setVolume(1);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String mintSec(sec){
    var mint;
    var secend;
    var duration;
    mint = sec/60.truncate();
    secend = sec%60.round();
    String vString = mint.toInt().toString();
    duration = "${vString} : ${secend}";
    return duration;
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AspectRatio(
              aspectRatio: 16/9,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                ),
                child: Stack(
                  children: <Widget>[
                    GestureDetector(
                        onTap: (){
                          setState(() {
                            if(_controller.value.isPlaying){
                              _controller.pause();
                            } else {
                              _controller.play();
                            }
                          });
                        },
                        child:ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: VideoPlayer(_controller))),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.black,
                          child: Center(
                            child: Icon(
                              _controller.value.isPlaying ? Icons.pause :Icons.play_arrow,color: Colors.white,size: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                         height: 30,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Center(
                            child: Text(mintSec(_controller.value.position.inSeconds),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}