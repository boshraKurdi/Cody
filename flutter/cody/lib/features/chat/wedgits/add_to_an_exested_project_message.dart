import 'package:cody/features/chat/wedgits/topOfDialogMessage.dart';
import 'package:flutter/material.dart';

import '../../../common wedgit/show_dialoge_messeage.dart';
import '../../../constants/colo_extension.dart';
import '../../../constants/styles.dart';
import 'features_and_pages.dart';

class AddToAnExextedProjectMessage extends StatelessWidget {

  const AddToAnExextedProjectMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,children: [
      TopOfDialogMassage(iconData: Icons.dashboard_customize_outlined, title: 'add to an existed project',),
      GestureDetector(
        onTap: () {
          // GoRouter.of(context).pop();
          showErrorDialogMesseage(
            context1: context,
            ontaptry: () {},
            ontapcancel: () {
              Navigator.pop(context);
            },
            buttonText: 'add',
            widget: FeaturesAndPages()
            ,
          );
        },
        child: Container(margin: EdgeInsets.all(8),width: MediaQuery.of(context).size.width,padding: EdgeInsets.all(8),decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: TColor.white),child: Row(
          children: [
            Icon(Icons.folder,color: TColor.secondaryColor1,),
            SizedBox(width: 10,),
            Text('project Name',style: Styles.kFontSize16,),
          ],
        ),),
      ),
      Container(margin: EdgeInsets.all(8),width: MediaQuery.of(context).size.width,padding: EdgeInsets.all(8),decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: TColor.white),child: Row(
        children: [
          Icon(Icons.folder,color: TColor.secondaryColor1,),
          SizedBox(width: 10,),
          Text('project Name',style: Styles.kFontSize16,),
        ],
      ),),
      Container(margin: EdgeInsets.all(8),width: MediaQuery.of(context).size.width,padding: EdgeInsets.all(8),decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: TColor.white),child: Row(
        children: [
          Icon(Icons.folder,color: TColor.secondaryColor1,),
          SizedBox(width: 10,),
          Text('project Name',style: Styles.kFontSize16,),
        ],
      ),),
      // SizedBox(
      //   height: 10,
      //   child: ListView.separated(itemBuilder: (context, index) {
      //   return  TextButton(onPressed: () {  },
      //     child: Text('project Name'));
      //   }, separatorBuilder: (context, index) => SizedBox(height: 15,), itemCount: 4),
      // ),
      SizedBox(height: 16,),
    ],);
  }
}