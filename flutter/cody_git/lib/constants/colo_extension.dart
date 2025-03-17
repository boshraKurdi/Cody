
import 'package:flutter/material.dart';

class TColor {
  static const  Color primaryColor1 =  Color(0xffa8dee8);
  static  const Color primaryColor2 =  Color(0xff6d7eea);
  static  const Color primaryColor3 =  Color(0xff424994);
  static  const Color secondaryColor1 =  Color(0xffc4cae6);
  static const Color  secondaryColor2 = Color(0xffc6dce8);
  static const  Color blueColor =  Color(0xff7cadec);
  static  const Color orangeColor1 =  Color(0xffdfd579);
  static const Color  orangeColor2 = Color(0xffeda178);
  static const  Color orangeColor3 =  Color(0xffff914f);

  static const List<Color> primaryG = [primaryColor1,primaryColor2, primaryColor3];
  static List<Color> primaryGWithOpacity =[
  primaryColor2.withOpacity(0.5),
  primaryColor1.withOpacity(0.5)
  ];
  static List<Color> secondaryGWithOpacity =[
    secondaryColor2.withOpacity(0.5),
    secondaryColor1.withOpacity(0.5)
  ];
  static const List<Color>  secondaryG = [secondaryColor2, secondaryColor1];
  static const List<Color> orangeG = [orangeColor1,orangeColor2, orangeColor3,orangeColor2,orangeColor1];
  static const List<BoxShadow> kBoxShadow =[BoxShadow(color: Colors.black12,blurRadius: 2,offset: Offset(0, 1))];
  static const LinearGradient kmainGradint =LinearGradient(
  colors: TColor.primaryG,
  begin: Alignment.topLeft,
  end: Alignment.bottomRight
  );
  static const LinearGradient kmainGradint2 =LinearGradient(
      colors: TColor.primaryG,
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter
  );
  static const LinearGradient kcardGradiant = LinearGradient(
      colors: TColor.primaryG,
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);
  static const LinearGradient korangGradent =LinearGradient(
      colors: TColor.orangeG,
      begin: Alignment.centerLeft,
      end: Alignment.centerRight);

  static const LinearGradient kFoodBarGradient = LinearGradient(
  colors: TColor.primaryG,
  begin: Alignment.centerLeft,
  end: Alignment.centerRight);

  static  LinearGradient lineChartGradient = LinearGradient(colors: [
    TColor.primaryColor2.withOpacity(0.4),
    TColor.primaryColor1.withOpacity(0.4),
  ]);
  static  LinearGradient SecondraylineChartGradient = LinearGradient(colors: [
  TColor.secondaryColor2.withOpacity(0.5),
  TColor.secondaryColor1.withOpacity(0.5),
  ]);

  static Color get black => const Color(0xff1D1617);
  static Color get gray => const Color(0xff786F72);
  static Color get white => Colors.white;
  static Color get lightGray => const Color(0xffF7F8F8);

}
