import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              centerTitle: false,
              pinned: false,
              expandedHeight: 400,
              floating: false,
              flexibleSpace: FlexibleSpaceBar(

              ),
            ),
          ];
        },
        body: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
