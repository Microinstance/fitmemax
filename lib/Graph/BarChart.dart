import 'package:fitmemax/Graph/IncrementDecrement.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BarChart extends StatefulWidget {
  final List listData;
  BarChart({@required this.listData});
  @override
  _BarChartState createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {

  List _getWeightList(){
    List WeightData = [];
    for(int i  = 0 ; i < widget.listData.length; i++ ){
      WeightData.add(double.parse(widget.listData[i]['weight']));
    }
    WeightData.sort();
    return WeightData;
  }
  List getList(double end){
    int start = 0;
    int _new = end.toInt();
    var arr = List(11);

    while(_new%10!=0) {
      _new = _new+1;
    }
    int no = (_new/10).toInt();
    for(int i=0;i<arr.length;i++){
      arr[i]=start;
      start=(start+no);
    }
    return arr.toList();
  }

  Widget _buildYaxixs(){
    Iterable x = getList(_getWeightList().last).reversed;
    List y = x.toList();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(y.length, (index) {
        return Text("${y[index]}",style: TextStyle(fontSize: 10,color: Color(0xFFffbb92),fontWeight: FontWeight.bold),);
      }),
    );
  }

  Widget _buildXAxis({double weight,String date}){
    double xMax =  300;
    int xLast = getList(_getWeightList().last).last;
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Tooltip(
        message: '${weight}',
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 10,
              height: 300*weight/xLast,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.5),
                color: Color(0xFFff7171),
              ),
            ),
            SizedBox(
              height: 20,
              child: Column(
                children: [
                  Spacer(),
                  Text(
                    "${date}",style: TextStyle(fontSize: 10,color: Color(0xFFff7171),fontWeight: FontWeight.bold),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return  Padding(
      padding: const EdgeInsets.only(left: 15,right: 15),
      child: Column(
        children: [
          Container(
            width: _width-30,
            height: 320,
            color: Colors.black,
            child: Row(
              children: [
                SizedBox(
                  height: 320,
                  width: 30,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: _buildYaxixs(),
                  ),
                ),
                SizedBox(
                    height: 320,
                    width: _width-60,
                    child: ListView.builder(
                      itemCount: widget.listData.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index){
                        return _buildXAxis(
                          weight: double.parse(widget.listData[index]['weight']),
                          date: widget.listData[index]['date'],
                        );
                      },
                    )
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15,top: 15,bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: CircleAvatar(
                            radius: 5,
                            backgroundColor: Color(0xFFffbb92),
                          ),
                        ),
                        Text("Date",style: TextStyle(fontSize: 15,color: Colors.white),),
                      ],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: CircleAvatar(
                            radius: 5,
                            backgroundColor: Color(0xFFff7171),
                          ),
                        ),
                        Text("Weight",style: TextStyle(fontSize: 15,color: Colors.white),),
                      ],
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: (){
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          constraints: BoxConstraints(
                              maxHeight: _height*0.65,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),
                            color: Colors.black,
                          ),
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height:5,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[400],
                                        borderRadius: BorderRadius.circular(7.5),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15,right: 15,top: 15,bottom: 25),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Update Current Weight",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10),
                                child: IncrementDecrement(
                                  unit: "Kg",
                                  initial: 75.00,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15,right: 15,top: 25,bottom: 25),
                                child: SafeArea(
                                  child: MaterialButton(
                                    onPressed: (){},
                                    height: 45,
                                    color: Color(0xFFff7171),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15,right: 15,bottom: 10,top: 10),
                                      child: Text("Save Changes",style: GoogleFonts.lato(fontSize: 16,color:Colors.white,fontWeight: FontWeight.bold ),),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      isScrollControlled: true,
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(width: 1,color: Color(0xFFff7171),),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15,top: 3.5,bottom: 3.5),
                      child: Row(
                        children: [
                          Text("Log",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
                          SizedBox(width: 5,),
                          Icon(Icons.keyboard_arrow_down,color: Colors.white,size: 20,),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
