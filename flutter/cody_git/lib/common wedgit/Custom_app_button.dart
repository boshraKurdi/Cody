
import 'package:flutter/material.dart';

import '../constants/colo_extension.dart';
import '../constants/styles.dart';



class CusttomAppButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double fontSize;
  final double elevation;
  final FontWeight fontWeight;
  final double? size;
  final Gradient? gradent;

  const CusttomAppButton(
      {super.key,
        required this.title,
        this.fontSize = 16,
        this.elevation = 1,
        this.fontWeight= FontWeight.w700,
        required this.onPressed, this.size, this.gradent});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(gradient: gradent?? TColor.kmainGradint,borderRadius: BorderRadius.all(Radius.circular(25))),
      child: MaterialButton(
        onPressed: onPressed,
        height: size??50,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        minWidth: double.maxFinite,
        elevation: 0,
        child: Text(title,style: Styles.kFontSize16.copyWith(color: TColor.white),),
      ),
    );
  }
}

class CusttomUnabelAppButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double fontSize;
  final double elevation;
  final FontWeight fontWeight;

  const CusttomUnabelAppButton(
      {super.key,
        required this.title,
        this.fontSize = 16,
        this.elevation = 1,
        this.fontWeight= FontWeight.w700,
        required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(color: TColor.gray,borderRadius: BorderRadius.all(Radius.circular(25))),
      child: MaterialButton(

        onPressed: onPressed,
        height: 50,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        minWidth: double.maxFinite,
        elevation: 0,
        child: Text(title,style: Styles.kFontSize16.copyWith(color: TColor.white),),
      ),
    );
  }
}