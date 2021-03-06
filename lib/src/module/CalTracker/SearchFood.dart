import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';
import 'package:fitmemax/src/module/CalTracker/FoodDetail.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class SearchFood extends StatefulWidget {
  @override
  _SearchFoodState createState() => _SearchFoodState();
}

class _SearchFoodState extends State<SearchFood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,size: 20,color:Colors.black,),
            onPressed: (){
              Navigator.pop(context);
            },
        ),
        title: Text("Search Food",style: GoogleFonts.roboto(fontSize: 20,color: Colors.black),),
        bottom: PreferredSize(
            child: Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    print(value);
                  });
                },
                autofocus: false,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black.withOpacity(0.9),
                ),
                decoration: InputDecoration(
                  hintText: "Type Here...",
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: Colors.black.withOpacity(0.8),
                  ),
                  contentPadding:
                  EdgeInsets.only(left: 10, right: 10),
                  fillColor: Colors.grey[100],
                ),
              ),
            ),
            preferredSize: Size.fromHeight(40.0)),
      ),
      body: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index){
          return ListTile(
            onTap: (){
              print("object");
              Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: FoodDetail()));
            },
            title: Text("Butter Chicken",style: GoogleFonts.roboto(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w400),),
            subtitle: Text("1 katori per serving",style: GoogleFonts.roboto(fontSize: 12,color: Colors.black.withOpacity(0.3)),),
            trailing: SizedBox(
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("48 cal",style: GoogleFonts.roboto(fontSize: 14,color: Colors.black.withOpacity(0.5)),),
                  SizedBox(width: 15,),
                  Icon(Icons.arrow_forward,size: 20,color: Colors.black,),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
