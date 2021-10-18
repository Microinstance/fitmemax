import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';

class MeditationSearch extends StatefulWidget {

  @override
  _MeditationSearchState createState() => _MeditationSearchState();
}

class _MeditationSearchState extends State<MeditationSearch> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFfdadad),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.white,size: 20,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Padding(
          padding: EdgeInsets.only(top: 5,bottom: 5),
          child: TextField(
            onChanged: (x){},
            autofocus: false,
            style: TextStyles.BodyBlack,
            cursorColor: ColorPalette.PrimaryColor,
            decoration: InputDecoration(
                isDense: true,
                hintText: "Search",
                hintStyle: TextStyles.BodyBlack,
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(30.0),
                  ),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                fillColor: ColorPalette.GreyLightest,
                contentPadding: EdgeInsets.only(top: 12,right: 10,left: 15,bottom: 12)
            ),
          ),
        ),
      ),
    );
  }
}
