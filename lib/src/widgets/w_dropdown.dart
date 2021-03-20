import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';

class w_dropdown extends StatelessWidget {

  final List list;
  final String select;
  final String hint;
  final Function onChanged;

  const w_dropdown({Key key, this.list, this.select,this.hint, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return   Container(
      padding: EdgeInsets.only(
        top: 7,
        bottom: 7,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.black.withOpacity(0.5),
        ),
        borderRadius: borderRadious.primeryRadious,
      ),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton(
            isDense: true,
            hint: Text(hint,style: TextStyles.BodyBlack,
            ),
            value: select,
            items: list.map((value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value,style: TextStyles.BodyBlack,),
              );
            }).toList(),
          onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
