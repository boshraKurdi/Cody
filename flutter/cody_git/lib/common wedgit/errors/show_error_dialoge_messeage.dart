
import 'package:flutter/material.dart';

import '../../constants/styles.dart';



void showErrorDialogMesseage2(
    {required BuildContext context1,
     required String state,
      required void Function() ontaptry,
      required void Function() ontapcancel}) {
  showDialog(
    context: context1,
    builder: (context) {
      return AlertDialog(title: Text(state,style: Styles.kFontSize18,),actions: [TextButton(
        onPressed: ontapcancel,
        child: const Text("cancel"),
      ),TextButton(
        onPressed: ontaptry,
        child: const Text("try again"),
      )],);
    },
  );
}
//GoRouter.of(context).go(Names.SelectView);