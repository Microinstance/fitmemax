import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';

class YogaFilterOne extends StatefulWidget {
  @override
  _YogaFilterOneState createState() => _YogaFilterOneState();
}

class _YogaFilterOneState extends State<YogaFilterOne> {
  double _duration = 0;
  List _price = ['All','Free','Premium'];
  List _level = ['All','Level 1','Level 2','Level 3','Level 4','Level 5'];
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Container(
      constraints: BoxConstraints(
        maxHeight: _height*0.7,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15),),
        color: Colors.white,
      ),
      child: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15,bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 7,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: borderRadious.primeryRadious,
                    color: Colors.grey[300],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5,bottom: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Filters",style: TextStyles.RegulerBoldBlack,),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0,bottom: 10,left: 15,right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 7,top: 2),
                  child: Container(
                    height: 15,
                    width: 5,
                    decoration: BoxDecoration(
                      borderRadius: borderRadious.primeryRadious,
                      color: Colors.orange,
                    ),
                  ),
                ),
                Text("Price",style: TextStyles.ParaBoldBlack,),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0,bottom: 15,left: 15,right: 15),
            child: Wrap(
              children: List.generate(_price.length, (index) {
                return _Filter(
                  titel: _price[index],
                  isSelected: false,
                );
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5,bottom: 10,left: 15,right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 7,top: 2),
                  child: Container(
                    height: 15,
                    width: 5,
                    decoration: BoxDecoration(
                      borderRadius: borderRadious.primeryRadious,
                      color: Colors.orange,
                    ),
                  ),
                ),
                Text("Level",style: TextStyles.ParaBoldBlack,),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0,bottom: 15,left: 15,right: 15),
            child: Wrap(
              children: List.generate(_level.length, (index) {
                return _Filter(
                  titel: _level[index],
                  isSelected: false,
                );
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5,bottom: 10,left: 15,right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 7,top: 2),
                  child: Container(
                    height: 15,
                    width: 5,
                    decoration: BoxDecoration(
                      borderRadius: borderRadious.primeryRadious,
                      color: Colors.orange,
                    ),
                  ),
                ),
                Text("Duration",style: TextStyles.ParaBoldBlack,),
              ],
            ),
          ),
          Stack(
            overflow: Overflow.visible,
            alignment: Alignment.bottomRight,
            children: [
              Slider(
                min: 0,
                max: 60,
                value: _duration,
                onChanged: (age) {
                  setState(() {
                    _duration = age;
                  });
                },
                label: "${_duration.toInt()}",
                divisions: 59,
                inactiveColor: Colors.orange.withOpacity(0.2),
                activeColor: Colors.orange,
              ),
              Positioned(
                bottom: -7,
                child: SizedBox(
                  width: _width,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20,top: 20,left: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            "0 min",
                            style:TextStyles.BodyBlack
                        ),
                        Text(
                            "${_duration.toInt()}  min",
                            style:TextStyles.BodyBlack
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20,bottom: 20,left: 20,right: 20),
            child: Row(
              children: [
                SizedBox(
                  width: ((_width-40)/2)-10,
                  child: MaterialButton(
                    onPressed: (){},
                    height: 40,
                    color: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(side: BorderSide(
                        color: Colors.orange,
                        width: 2,
                        style: BorderStyle.solid
                    ), borderRadius: BorderRadius.circular(7.5)),
                    child: Text("Reset",style: TextStyles.RegulerBIGOrange,),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: ((_width-40)/2)-10,
                  child: MaterialButton(
                    onPressed: (){},
                    height: 40,
                    color: Colors.orange,
                    elevation: 0,
                    shape: RoundedRectangleBorder(side: BorderSide(
                        color: Colors.orange,
                        width: 2,
                        style: BorderStyle.solid
                    ), borderRadius: BorderRadius.circular(7.5)),
                    child: Text("Done",style: TextStyles.RegulerBIGWhite,),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
class _Filter extends StatefulWidget {
  final String titel;
  bool isSelected;
  _Filter({Key key, this.titel, this.isSelected});

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<_Filter> {
  // bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: (){
          setState(() {
            widget.isSelected ? widget.isSelected = false : widget.isSelected = true;
          });
        },
        child: Container(
          width: (_width-60)/3,
          height: 30,
          decoration: BoxDecoration(
            color: widget.isSelected ? Colors.orange : Colors.grey[200],
            borderRadius: BorderRadius.circular(7.5),
          ),
          child: Center(child: Text(widget.titel,style: widget.isSelected ? TextStyles.BodyWhite : TextStyles.BodyBlack
            ,)),
        ),
      ),
    );
  }
}

