import 'package:flutter/material.dart';

//This is where TextStyles belongs

class TextStyles {

  static const BodyBlack = TextStyle(fontWeight: FontWeight.w400,fontSize: 13,color: Palette.GreyDarkest,fontFamily: 'Helvetica Light');
  static const BodyLongBlack = TextStyle(fontWeight: FontWeight.w400,fontSize: 15,color: Palette.GreyDarkest,fontFamily: 'Helvetica Light');
  static const BodyRed = TextStyle(fontWeight: FontWeight.w400,fontSize: 13,color: Palette.Red,fontFamily: 'Helvetica Light');
  static const BodyWhite = TextStyle(fontWeight: FontWeight.w600,fontSize: 13,color: Colors.white,fontFamily: 'Helvetica Light');
  static const BodyLight = TextStyle(fontWeight: FontWeight.w300,fontSize: 11,color: Palette.GreyDarkest,fontFamily: 'Helvetica Light');
  static const BodyBlackCross = TextStyle(fontWeight: FontWeight.w300,fontSize: 13,color: Palette.GreyDarkest,fontFamily: 'Helvetica Light',decoration: TextDecoration.lineThrough);
  static const BodyPurple = TextStyle(fontWeight: FontWeight.w300,fontSize: 13,color: Palette.Purple,fontFamily: 'Helvetica Light');
  static const BodyField = TextStyle(fontWeight: FontWeight.w300,fontSize: 11,color: Palette.Grey,fontFamily: 'Helvetica Light');
  static const BodyLightField = TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Palette.GreyDarkest,fontFamily: 'Helvetica Light');
  static const BodySmall = TextStyle(fontWeight: FontWeight.w500,fontSize: 10,color: Palette.Grey);
  static const BodySmallYellow = TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: Palette.Yellow);
  static const BodySmallGreen = TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: Colors.green);
  static const BodySmallRed = TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: Palette.Red);
  static const BodyRegular = TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: Palette.GreyDarkest);
  static const BodyRegularGrey = TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: Palette.Grey);
  static const NormalPurple = TextStyle(fontWeight: FontWeight.w400,fontSize: 12,color: Palette.PurpleDarkest);
  static const DecPurple = TextStyle(fontWeight: FontWeight.w400,fontSize: 12,color: Palette.PurpleDarkest);
  static const DecGrey = TextStyle(fontWeight: FontWeight.w400,fontSize: 12,color: Palette.Grey);
  static const TItelGrey = TextStyle(fontWeight: FontWeight.w400,fontSize: 18,color: Palette.Grey);
  static const TitleBlack = TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: Palette.PurpleDarkest);
  static const TitleBlackGrey = TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: Palette.GreyDarkest);
  static const TitleTeal = TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: Palette.Teal);
  static const TitleWhite = TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.white);
  static const HeaderBlack = TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: Palette.GreyDarkest);
  static const DisplayBlack = TextStyle(fontWeight: FontWeight.w700,fontSize: 22,color: Palette.PurpleDarkest);
  static const DisplayBlackGrey = TextStyle(fontWeight: FontWeight.w700,fontSize: 22,color: Palette.GreyDarkest);
  static const DisplayTeal = TextStyle(fontWeight: FontWeight.w700,fontSize: 22,color: Palette.Teal);

  static const CardWhite= TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.white);
  static const Card2White= TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: Palette.Grey);

  static const Subheading = TextStyle(fontWeight: FontWeight.w500,fontSize: 14,color: Palette.Grey);
  static const SubheadingBlack = TextStyle(fontWeight: FontWeight.w500,fontSize: 14,color: Palette.GreyDarkest);
  static const SemiSubheadingBlack = TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Palette.GreyDarkest);
  static const SubheadingBigBlack = TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Palette.GreyDarkest);
  static const SubheadingWhite = TextStyle(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white);

  static const HomeCatagory = TextStyle(fontSize: 14,color: Colors.black,fontFamily: 'Helvetica Light');
  static const NotificationWhite = TextStyle(fontSize: 11,color: Colors.white,fontWeight: FontWeight.bold);

  static const RegularSemiBoldBlack = TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: Colors.black);
  static const RegularLightGray = TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Palette.Grey);
  static const RegularBoldBlack = TextStyle(fontWeight: FontWeight.w700,fontSize: 18,color: Colors.black);
  static const RegularSmall1SemiBoldBlack = TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black);
  static const RegularSemiBlack = TextStyle(fontWeight: FontWeight.w400,fontSize: 18,color: Palette.GreyDarkest);
  static const RegularSmall1SemiBoldRed = TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Palette.Red);
  static const RegularSmall1SemiBoldTeal = TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Palette.Teal);
  static const RegularSmallBoldBlack = TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: Colors.black);
  static const RegularExtraSmall1SemiBoldDarkPurple = TextStyle(fontWeight: FontWeight.w400,fontSize: 12,color: Palette.PurpleDarkest);
  static const RegularExtraSmall1SemiBoldBlack = TextStyle(fontWeight: FontWeight.w400,fontSize: 12,color: Colors.black);
}


class Palette {

  static const Color googleColor = Color(0xFFFFFFFF);

  static const Color RedAmber = Color(0xFFFF5A56);
  static const Color RedDarkest = Color(0xFFCE0045);
  static const Color Red = Color(0xFFFF1B5F);
  static const Color RedLightest = Color(0xFFFFD0DA);

  static const Color PurpleDarkest = Color(0xFF1F183C);
  static const Color Purple = Color(0xFF4D4294);
  static const Color PurpleLightest = Color(0xFFF8FBFC);

  static const Color TealDarkest = Color(0xFF008A8A);
  static const Color Teal = Color(0xFF43BAC1);
  static const Color TealLightest = Color(0xFFEDF5EB);

  static const Color YellowDarkest = Color(0xFFDD8F28);
  static const Color Yellow =Color(0xFFFCC840);
  static const Color YellowLightest = Color(0xFFFEF8E2);

  static const Color GreyDarkest = Color(0xFF333333);
  static const Color Grey = Color(0xFF9A9A9A);
  static const Color GreyLightest = Color(0xFFF9F9F9);
  static const Color GreyMedium = Color(0xFFf7f6f3);


  static const Color PrimaryColor =  PurpleDarkest;
  static const Color SecondaryColor =  Red;



}