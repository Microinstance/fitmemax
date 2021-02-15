
import 'package:flutter/material.dart';

class loginButtonTwo extends StatelessWidget {
  final String title;
  final Function onPressed;
  final Color colors;

  const loginButtonTwo({this.title, this.onPressed,this.colors});
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: _width-60,
      child: MaterialButton(
        height: 45,
        elevation: 0,
        splashColor: colors.withOpacity(0.2),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
        onPressed: onPressed,

        color: colors,
        child: Padding(
          padding: const EdgeInsets.only(top: 10,bottom: 10,left: 30,right: 30),
          child: Text(
            title,
            style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
