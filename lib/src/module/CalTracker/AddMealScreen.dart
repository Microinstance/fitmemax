import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';

class AddMealScreen extends StatefulWidget {
  @override
  _AddMealScreenState createState() => _AddMealScreenState();
}

class _AddMealScreenState extends State<AddMealScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Palette.primaryColor,
        title: Text(
          "Add Food",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Meal Name",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: TextEditingController(),
                        onChanged: (x) {},
                        autofocus: false,
                        style: TextStyle(color: Colors.black, fontSize: 18),
                        cursorColor: Palette.primaryColor,
                        decoration: InputDecoration(
                            isDense: false,
                            hintText: "Enter Your Food",
                            hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                              fontSize: 18,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(7.5),
                              ),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.grey[100],
                            contentPadding: EdgeInsets.only(
                                top: 7, right: 10, left: 10, bottom: 7)),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Time",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: TextEditingController(),
                        onChanged: (x) {},
                        autofocus: false,
                        style: TextStyle(color: Colors.black, fontSize: 18),
                        cursorColor: Palette.primaryColor,
                        decoration: InputDecoration(
                            isDense: false,
                            hintText: "Enter Time",
                            hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                              fontSize: 18,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(7.5),
                              ),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.grey[100],
                            contentPadding: EdgeInsets.only(
                                top: 7, right: 10, left: 10, bottom: 7)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            color: Palette.primaryColor,
            child: Center(
              child: Text(
                "ADD",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
