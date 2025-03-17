
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants/colo_extension.dart';
import '../constants/styles.dart';
import 'custtom_textfield.dart';
import 'drop_down_list.dart';

void showErrorDialogMesseage(
    {required BuildContext context1,
      required Widget widget,
required String buttonText,
      required void Function() ontaptry,
      required void Function() ontapcancel,Color? color}) {
  showDialog(
    context: context1,
    builder: (context) {
      return AlertDialog(backgroundColor: TColor.secondaryColor2,title:widget
      ,actions: [TextButton(
        onPressed: ontaptry,
        child:  Text(buttonText,style: TextStyle(color:color??TColor.primaryColor3 ),),
      ),
        TextButton(
          onPressed: ontapcancel,
          child:Text('back'),
        )
      ],);
    },
  );
}
//GoRouter.of(context).go(Names.SelectView);