import 'package:flutter/material.dart';

import '../constants/colo_extension.dart';


class CustomTextFieldPrefixIcon extends StatelessWidget {
   final void Function()? ontap;
  const CustomTextFieldPrefixIcon({
    super.key,
    required this.icon, this.ontap,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:ontap ,
      child: Container(
          alignment: Alignment.center,
          width: 50,
          height: 50,
          child: Icon(
            icon,
           size: 30,
            // fit: BoxFit.contain,
            color: TColor.gray,
          )),
    );
  }
}