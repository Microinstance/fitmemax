import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';

class YogaSearchPage extends StatefulWidget {
  @override
  _YogaSearchPageState createState() => _YogaSearchPageState();
}

class _YogaSearchPageState extends State<YogaSearchPage> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    List _keyWordText = [
      'Hatha','Meditation','Morning','Flexibility','Sun Salutation','Sleep',
    ];
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_outlined,
            color: Colors.orange,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title:   SizedBox(
          height: 40,
          child: TextField(
            onChanged: (value) {
              setState(() {
                print(value);
              });
            },
            autofocus: false,
            style: TextStyles.RegulerBlack,
            decoration: InputDecoration(
              hintText: "Search Here",
              hintStyle: TextStyles.BodyBlack,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              filled: true,
              suffixIcon: Icon(
                Icons.search_rounded,
                color: Colors.black.withOpacity(0.8),
              ),
              contentPadding:
              EdgeInsets.only(left: 14, right: 10),
              fillColor: Colors.grey[100],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child:Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Popular Keywords",style: TextStyles.RegulerBlack,),
                ],
              ),
            ),
            Wrap(
              children: List.generate(_keyWordText.length, (index) {
                return _keyword(_keyWordText[index]);
              }),
            )
          ],

        ),
      ),
    );
  }
  Widget _keyword(keyword){
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: (){},
        child: Container(
          decoration: BoxDecoration(
            color: Colors.orange.withOpacity(0.9),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 12,right: 12,top: 5,bottom: 8 ),
            child: Text("$keyword",style: TextStyles.ParaWhite,),
          ),
        ),
      ),
    );
  }
}
