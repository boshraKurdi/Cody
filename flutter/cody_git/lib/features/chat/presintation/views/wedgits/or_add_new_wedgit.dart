import 'package:flutter/material.dart';

import '../../../../../constants/colo_extension.dart';



class OrAddNewWedgit extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const OrAddNewWedgit({
    super.key, required this.title, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTap, child:Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: TextStyle(color: TColor.primaryColor3),),
        Container(
          width: 100,
          height: 1,
          color: TColor.primaryColor3,
        )
      ],
    ));
  }
}