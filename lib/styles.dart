import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';

class borderRadious{
  static const primeryRadious =   BorderRadius.all(Radius.circular(7.5));
  static const secendaryRadious =   BorderRadius.all(Radius.circular(15));
}


class TextStyles {

  static const BodyBlack = TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: ColorPalette.GreyDarkest);
  static const BodyBoldWhite = TextStyle(fontWeight: FontWeight.bold,fontSize: 7,color: Colors.white);
  static const BodySmallWhite = TextStyle(fontWeight: FontWeight.w400,fontSize: 12,color: ColorPalette.GreyLightest);
  static const BodySmallGrediantRed1 = TextStyle(fontWeight: FontWeight.w400,fontSize: 12,color: ColorPalette.GrediantRed1);
  static const BodySmallGrediantblue1 = TextStyle(fontWeight: FontWeight.w400,fontSize: 12,color: ColorPalette.Grediantblue1);
  static const BodySmallFluracentGreen = TextStyle(fontWeight: FontWeight.w400,fontSize: 12,color: ColorPalette.FluracentGreen);
  static const ParaBlack = TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: ColorPalette.GreyDarkest);
  static const ParaWhite = TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.white);
  static const BodyBlackBold = TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: ColorPalette.GreyDarkest);
  static const BodyWhite = TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: Colors.white);
  static const BodySmallBlack = TextStyle(fontWeight: FontWeight.w400,fontSize: 12,color: ColorPalette.GreyDarkest);
  static const BodyGreyLightest = TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: ColorPalette.GreyLightest);
  static const BodyGrey = TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: ColorPalette.Grey,);
  static const RegulerBlack = TextStyle(fontWeight: FontWeight.w400,fontSize: 18,color: ColorPalette.GreyDarkest,);
  static const RegulerPrimary = TextStyle(fontWeight: FontWeight.w400,fontSize: 18,color: ColorPalette.PrimaryColor,);
  static const RegulerBIGWhite = TextStyle(fontWeight: FontWeight.w400,fontSize: 18,color: Colors.white,);
  static const RegulerProfile = TextStyle(fontWeight: FontWeight.w400,fontSize: 18,color: ColorPalette.ProfileGreen,);
  static const HeadingBlack = TextStyle(fontWeight: FontWeight.w500,fontSize: 22,color: ColorPalette.GreyDarkest,);
  static const HeadingPrimery = TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: ColorPalette.PrimaryColor,);
  static const HeadingBoldBlack = TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.black,);
  static const TitleWhite = TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white,);
  static const TitleBlue = TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: ColorPalette.Grediantblue2,);
  static const TitleProfile = TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: ColorPalette.ProfileGreen,);
  static const DisplayWhite = TextStyle(fontWeight: FontWeight.bold,fontSize: 35,color: Colors.white,);
  static const TitlePink = TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: ColorPalette.Pink,);
  static const TitleFluracentGreen = TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: ColorPalette.FluracentGreen,);
  static const TitleBlack = TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: ColorPalette.GreyDarkest,);
  static const TitleBlackBold = TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: ColorPalette.GreyDarkest,);
  static const BodyMediumPrimary = TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: ColorPalette.PrimaryColor);
  static const FluracentGreenMedium = TextStyle(fontWeight: FontWeight.w400,fontSize: 18,color: ColorPalette.FluracentGreen);


  static const GameRegulerWhite = TextStyle(fontFamily: "Ghost Clan",fontSize: 15,color: Colors.white,);
  static const GameRegulerYellow = TextStyle(fontFamily: "Ghost Clan",fontSize: 15,color: Colors.yellow,);
  static const GameRegulerBlack = TextStyle(fontFamily: "Ghost Clan",fontSize: 15,color: Colors.black,);
  static const GameParaYellow= TextStyle(fontFamily: "Ghost Clan",fontSize: 13,color: ColorPalette.Yellow,);
  static const GameParaWhite= TextStyle(fontFamily: "Ghost Clan",fontSize: 13,color: Colors.white,);
  static const GameBodywhite= TextStyle(fontFamily: "Ghost Clan",fontSize: 10,color:  Colors.white,);
  static const GameBodyBlack= TextStyle(fontFamily: "Ghost Clan",fontSize: 10,color:  Colors.black,);

  static const GameSemiBoldBlack= TextStyle(fontFamily: "Ghost Clan",fontSize: 18,color:  Colors.yellow,);

  static const GameShadowWhite1= TextStyle(fontFamily: "Ghost Clan",fontSize: 12,color: Colors.white,);
  static const GameShadowblack1= TextStyle(fontFamily: "Ghost Clan",fontSize: 14,color: Colors.black,);
}


class ColorPalette {

  static const Color Green = Color(0xFF00923f);
  static const Color Yellow = Color(0xFFfffc00);

  static const Color BattleGroundBackground = Color(0xFF2a2a36);
  static const Color BattleGroundBackground2 = Color(0xFF282633);
  static const Color BattleGroundAppBar = Color(0xFF363543);

  static const Color BattleGroundGredientRed1 = Color(0xFFd70c00);
  static const Color BattleGroundGredientRed2 = Color(0xFFd00f00);
  static const Color BattleGroundGredientRed3 = Color(0xFF911300);

  static const Color GreenLight = Color(0xFF66CD00);
  static const Color FluracentGreen = Color(0xFF6cfa98);
  static const Color ProfileGreen = Color(0xFF6cfa98);
  static const Color ProfileBackground = Color(0xFF060606);
  static const Color Pink = Color(0xFFff45ac);
  static const Color Red = Color(0xFFFB2B11);

  static const Color BlackLight =  Color(0xFF1f1e23);
  static const Color ActivityTrackerBlackBack =  Color(0xFF1b1b1b);
  static const Color ActivityTrackerCard =  Color(0xFF101010);

  static const Color GrediantRed1 = Color(0xFFfe7748);
  static const Color GrediantRed2 = Color(0xFFfb2d6d);

  static const Color GrediantGreen1= Color(0xFF11998e);
  static const Color GrediantGreen2= Color(0xFF38ef7d);

  static const Color GrediantGreen3= Color(0xFF09e006);
  static const Color GrediantGreen4= Color(0xFF009e00);
  static const Color GrediantGreen5= Color(0xFF00a800);

  static const Color Grediantblue1 = Color(0xFF8E2DE2);
  static const Color Grediantblue2 = Color(0xFF4A00E0);

  static const Color BMIColor1 = Color(0xFF438dba);
  static const Color BMIColor2 = Color(0xFF24cac0);
  static const Color BMIColor3 = Color(0xFFb59f66);
  static const Color BMIColor4 = Color(0xFFb63752);

  static const Color GreyDarkest = Color(0xFF333333);
  static const Color Grey = Color(0xFF9A9A9A);
  static const Color GreyLightest = Color(0xFFF9F9F9);
  static const Color GreyMedium = Color(0xFFf7f6f3);

  static const Color TealDarkest = Color(0xFF008A8A);
  static const Color Teal = Color(0xFF43BAC1);
  static const Color TealLightest = Color(0xFFEDF5EB);

  static const Color PrimaryColor =  Green;
  static const Color SecdoryColor =  GreenLight;
}