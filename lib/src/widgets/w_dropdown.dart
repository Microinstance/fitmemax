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
        top: _height * 0.01,
        bottom: _height * 0.01,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.black.withOpacity(0.5),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton(
            // isExpanded: true,
            isDense: true,
            hint: Text(hint),
            value: select,
            items: list.map((value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value),
              );
            }).toList(),
          onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
