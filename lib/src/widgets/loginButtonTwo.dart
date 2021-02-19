
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
      height: 40,
      width: 120,
      child: MaterialButton(
        splashColor: colors.withOpacity(0.2),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.5)),
        onPressed: onPressed,

        color: colors,
        child: Padding(
          padding: const EdgeInsets.only(top: 3,bottom: 3,left: 5,right: 5),
          child: Text(
            title,
            style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
