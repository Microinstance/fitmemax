import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';

class FoodDetailScreen extends StatefulWidget {
  @override
  _FoodDetailScreenState createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/background/foodBackground.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 14, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: MediaQuery.of(context).padding.top + 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Text(
                        "Food name",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "2 medium - 501 Cal",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 14, right: 14),
                      child: Row(
                        children: [
                          Text(
                            "Pick the quality",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.help,
                            color: Colors.black,
                            size: 15,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            "Quantity Help",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(child: SizedBox()),
                          Icon(
                            Icons.share,
                            color: Colors.black,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 14, right: 14),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: DropdownButtonFormField<String>(
                              style: TextStyle(color: Colors.black87),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                  left: 8,
                                  right: 8,
                                ),
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(
                                      color: Theme.of(context)
                                          .textTheme
                                          .caption
                                          .color,
                                      fontSize: 14,
                                    ),
                              ),
                              items: [
                                "1.2",
                                "2",
                                "2.5",
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption
                                          .copyWith(
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                .color,
                                            fontSize: 14,
                                          )),
                                );
                              }).toList(),
                              onChanged: (String newValue) {},
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            flex: 2,
                            child: DropdownButtonFormField<String>(
                              style: TextStyle(color: Colors.black87),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                  left: 8,
                                  right: 8,
                                ),
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(
                                      color: Theme.of(context)
                                          .textTheme
                                          .caption
                                          .color,
                                      fontSize: 14,
                                    ),
                              ),
                              items: [
                                "Small",
                                "Medium",
                                "large",
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String newValue) {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 14, right: 14),
                      child: Text(
                        "Nutritional Information",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 14, right: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Protein",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              CircleAvatar(
                                radius: 24,
                                backgroundColor: Colors.white,
                                backgroundImage:
                                    AssetImage('images/protein.PNG'),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "29.80 g",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Carbs",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              CircleAvatar(
                                radius: 24,
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage('images/carb.PNG'),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "0.00 g",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Fats",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              CircleAvatar(
                                radius: 24,
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage('images/fat.PNG'),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "7.79 g",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(child: SizedBox()),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
