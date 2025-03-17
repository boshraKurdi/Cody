import 'package:flutter/material.dart';

import '../../../../constants/colo_extension.dart';



class HaveAnAcount extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const HaveAnAcount({
    super.key, required this.title, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTap, child:Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title,style: TextStyle(color: TColor.primaryColor3),),
        Container(
          width: 200,
          height: 1,
          color: TColor.primaryColor3,
        )
      ],
    ));
  }
}