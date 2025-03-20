import 'package:flutter/material.dart';

import '../../../../../constants/colo_extension.dart';
import '../../../../../constants/styles.dart';


class TopOfDialogMassage extends StatelessWidget {
  final IconData iconData;
  final String title;
  const TopOfDialogMassage({
    super.key, required this.iconData, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Icon(iconData),
          SizedBox(
            width: 15,
          ),
          Text(
            title,
            style: Styles.kFontSize18,
          )
        ],
      ),
      Container(
        width: 800,
        height: 1,
        color: TColor.primaryColor3,
      )
    ],);
  }
}