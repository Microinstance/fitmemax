
import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';

class passwordTextfieldOne extends StatefulWidget {
  final String hint;
  final Function onChanged;

  const passwordTextfieldOne({this.hint = 'Password', this.onChanged});
  @override
  _passwordTextfieldOneState createState() => _passwordTextfieldOneState();
}

class _passwordTextfieldOneState extends State<passwordTextfieldOne> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: _width-60,
      child: TextField(
        onChanged: widget.onChanged,
        autofocus: false,
        obscureText: _obscureText ? true : false,
        style: TextStyle(fontSize: 18,color: Colors.black),
        cursorColor: Palette.primaryColor,
        decoration: InputDecoration(
            isDense: true,
            hintText: widget.hint,
            hintStyle:TextStyle(fontSize: 18,color: Colors.black.withOpacity(0.7)),
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(5.0),
              ),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            suffixIcon: GestureDetector(
                onTap: (){
                  setState(() {
                    _obscureText ? _obscureText = false : _obscureText = true;
                  });
                },
                child: Icon(Icons.remove_red_eye,color: Colors.grey,size: 20,)),
            filled: true,
            fillColor: Colors.grey[100],
            contentPadding: EdgeInsets.only(top: 0,right: 10,left: 10,bottom: 0)
        ),
      ),
    );
  }
}