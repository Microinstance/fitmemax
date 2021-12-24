import 'package:fitmemax/src/ListData/ListData.dart';
import 'package:fitmemax/src/module/Journal/JournalDetailPage.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Journal extends StatefulWidget {
  @override
  _JournalState createState() => _JournalState();
}

class _JournalState extends State<Journal> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF191a1f),
      appBar: AppBar(
        backgroundColor: Color(0xFF191a1f),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 20,
          ),
        ),
        title: Text(
          "Journal",
          style: TextStyles.HeadingWhite,
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            isDismissible: true,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return Padding(
                  padding: MediaQuery.of(context).viewInsets,
                  child: _logData(),
              );
            },

          );
        },
        child: Icon(
          Icons.add,
          size: 20,
          color: Colors.white,
        ),
        backgroundColor: Color(0xFF975dff),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
              child: Column(
            children: List.generate(
              4,
              (index) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, bottom: 30, top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Shoulder Press",
                          style: TextStyles.RegulerBIGWhite,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: ListView.builder(
                      itemCount: 4,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, bottom: 20),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      child: JournalDetailPage()));
                            },
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "20",
                                      style: TextStyles.HeadingWhite,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Opacity(
                                        opacity: 0.3,
                                        child: Text(
                                          "Kilograms",
                                          style: TextStyles.ParaWhite,
                                        )),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "15",
                                      style: TextStyles.HeadingWhite,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Opacity(
                                        opacity: 0.3,
                                        child: Text(
                                          "Reps",
                                          style: TextStyles.ParaWhite,
                                        )),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      (index > 1) ? '--' : "57",
                                      style: TextStyles.HeadingWhite,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Opacity(
                                        opacity: 0.3,
                                        child: Text(
                                          "min",
                                          style: TextStyles.ParaWhite,
                                        )),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "20kg * 12",
                                      style: TextStyles.RegulerBIGWhite,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Opacity(
                                        opacity: 0.3,
                                        child: Text(
                                          "Previous",
                                          style: TextStyles.ParaWhite,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}

class _logData extends StatefulWidget {
  @override
  _logDataState createState() => _logDataState();
}

class _logDataState extends State<_logData> {
  String _journalValue = "Shoulder Press";
  String _journalValue2 = "Weight";
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.black,
      constraints: BoxConstraints(
        maxHeight: _height*0.7,
      ),
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 30, top: 10),
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: (_width - 80) / 2, right: (_width - 80) / 2, bottom: 15),
            child: Container(
              height: 7,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Exercise Category",
                style: TextStyles.RegulerBIGWhite,
              ),
              (_journalValue != "Custom Name")
                  ? SizedBox(
                      width: 169,
                      child: Container(
                          padding: EdgeInsets.only(
                            top: 8,
                            bottom: 8,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.white.withOpacity(0.5),
                            ),
                            borderRadius: borderRadious.primeryRadious,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: Theme(
                                data: Theme.of(context).copyWith(
                                  canvasColor: Colors.black,
                                ),
                                child: DropdownButton(
                                  isDense: true,
                                  hint: Text(
                                    "Select Category",
                                    style: TextStyles.ParaWhite,
                                  ),
                                  value: _journalValue,
                                  items: Data().journal.map((value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: SizedBox(
                                        width: 123,
                                        child: Row(
                                          children: [
                                            Flexible(
                                              child: Text(
                                                value,
                                                style: TextStyles.ParaWhite,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      _journalValue = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                          )),
                    )
                  : SizedBox(
                      width: 169,
                      height: 43,
                      child: Container(
                        padding: EdgeInsets.only(
                          top: 8,
                          bottom: 8,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.white.withOpacity(0.5),
                          ),
                          borderRadius: borderRadious.primeryRadious,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: TextField(
                            onChanged: (x) {},
                            autofocus: false,

                            style: TextStyles.ParaWhite,
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: 'Enter Exercise Name',
                              hintStyle: TextStyles.BodyBlack,
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 15,right: 15,top: 6,bottom: 11)
                            ),
                          ),
                        ),
                      ),
                    ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Exercise Reps",
                style: TextStyles.RegulerBIGWhite,
              ), SizedBox(
                      width: 169,
                      height: 43,
                      child: Container(
                        padding: EdgeInsets.only(
                          top: 8,
                          bottom: 8,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.white.withOpacity(0.5),
                          ),
                          borderRadius: borderRadious.primeryRadious,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            onChanged: (x) {},
                            autofocus: false,
                            style: TextStyles.ParaWhite,
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: 'Enter Reps Count',
                              hintStyle: TextStyles.BodyBlack,
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 15,right: 15,top: 6,bottom: 11)
                            ),
                          ),
                        ),
                      ),
                    ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                     text:  "Exercise Time",
                      style: TextStyles.RegulerBIGWhite,
                    ),
                    TextSpan(
                      text:   "  in min",
                      style: TextStyles.BodyBlack,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 169,
                height: 43,
                child: Container(
                  padding: EdgeInsets.only(
                    top: 8,
                    bottom: 8,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.white.withOpacity(0.5),
                    ),
                    borderRadius: borderRadious.primeryRadious,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: TextField(
                      onChanged: (x) {},
                      autofocus: false,
                      keyboardType: TextInputType.number,
                      style: TextStyles.ParaWhite,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                          isDense: true,
                          hintText: 'Enter Exercise Time',
                          hintStyle: TextStyles.BodyBlack,
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 15,right: 15,top: 6,bottom: 11)
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                 Row(
                   children: [
                     SizedBox(
                width: 115,
                child: Container(
                        padding: EdgeInsets.only(
                          top: 8,
                          bottom: 8,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.white.withOpacity(0.5),
                          ),
                          borderRadius: borderRadious.primeryRadious,
                        ),
                        child: DropdownButtonHideUnderline(
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                canvasColor: Colors.black,
                              ),
                              child: DropdownButton(
                                isDense: true,
                                hint: Text(
                                  "Weight",
                                  style: TextStyles.ParaWhite,
                                ),
                                value: _journalValue2,
                                items: Data().journal2.map((value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyles.ParaWhite,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _journalValue2 = value;
                                  });
                                },
                              ),
                            ),
                          ),
                        )),
              ),
                     (_journalValue2 != "Weight") ? Padding(
                       padding: const EdgeInsets.only(left: 5,bottom: 1),
                       child: Text("in\nmeters",style: TextStyles.BodyBlack,),
                     ) :  Padding(
                       padding: const EdgeInsets.only(left: 5,bottom: 1),
                       child: Text("in Kg",style: TextStyles.BodyBlack,),
                     ),
                   ],
                 ),
                 SizedBox(
                width: 169,
                height: 43,
                child: Container(
                  padding: EdgeInsets.only(
                    top: 8,
                    bottom: 8,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.white.withOpacity(0.5),
                    ),
                    borderRadius: borderRadious.primeryRadious,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: TextField(
                      onChanged: (x) {},
                      autofocus: false,
                      style: TextStyles.ParaWhite,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                          isDense: true,
                          hintText: 'Enter Exercise Data',
                          hintStyle: TextStyles.BodyBlack,
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 15,right: 15,top: 6,bottom: 11)
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20,bottom: 0),
            child: MaterialButton(
                height: 45,
                child: Text("Save",style: TextStyles.RegulerBIGWhite,),
                color: Colors.purple,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.5),
                ),
                onPressed:(){

            } ),
          ),
          SafeArea(child: SizedBox()),
        ],
      ),
    );
  }
}
