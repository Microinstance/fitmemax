import 'package:flutter/material.dart';
import 'package:fitmemax/styles.dart';

class SocialButton extends StatelessWidget {
  final Function onPressed;
  final Color colors;
  final String image;

  const SocialButton({this.onPressed,this.colors ,this.image});
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: _width*0.23,
      child: MaterialButton(
        elevation: 0,
        height: 45,
        splashColor: colors.withOpacity(0.2),
        shape: RoundedRectangleBorder(
            borderRadius: borderRadious.primeryRadious),
        onPressed: onPressed,
        color: colors,
        child: Image.asset(image,height: 25,width: 25,fit: BoxFit.contain,),
      ),
    );
  }
}
