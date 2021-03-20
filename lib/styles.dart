import 'package:flutter/material.dart';

class borderRadious{
  static const primeryRadious =   BorderRadius.all(Radius.circular(7.5));
}


class TextStyles {

  static const BodyBlack = TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: ColorPalette.GreyDarkest);
  static const BodyGrey = TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: ColorPalette.Grey,);
  static const RegulerBlack = TextStyle(fontWeight: FontWeight.w400,fontSize: 18,color: ColorPalette.GreyDarkest,);
  static const HeadingBlack = TextStyle(fontWeight: FontWeight.w500,fontSize: 22,color: ColorPalette.GreyDarkest,);
  static const TitleWhite = TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white,);
  static const TitleBlack = TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: ColorPalette.GreyDarkest,);
  static const BodyMediumPrimary = TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: ColorPalette.PrimaryColor);
}


class ColorPalette {

  static const Color Green = Color(0xFF00923f);

  static const Color GreyDarkest = Color(0xFF333333);
  static const Color Grey = Color(0xFF9A9A9A);
  static const Color GreyLightest = Color(0xFFF9F9F9);
  static const Color GreyMedium = Color(0xFFf7f6f3);

  static const Color TealDarkest = Color(0xFF008A8A);
  static const Color Teal = Color(0xFF43BAC1);
  static const Color TealLightest = Color(0xFFEDF5EB);

  static const Color PrimaryColor =  Green;
}