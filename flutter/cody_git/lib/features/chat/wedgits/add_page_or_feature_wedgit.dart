import 'package:cody/features/chat/wedgits/topOfDialogMessage.dart';
import 'package:flutter/material.dart';

import '../../../common wedgit/custtom_textfield.dart';
import '../chat_page.dart';

class AddPageOrFeatureWedgit extends StatelessWidget {
  final void Function(String)? onchanged;
  final TextEditingController textEditingController;
  final IconData iconData;
  final String title;
  const AddPageOrFeatureWedgit({
    super.key, required this.iconData, required this.title, required this.textEditingController, this.onchanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TopOfDialogMassage(iconData: iconData, title: title),
          SizedBox(height: 25,),
          CustomTextField(hitText: title, icon: iconData,controller: textEditingController,onchanged: onchanged,)
        ],
      ),
    );
  }
}