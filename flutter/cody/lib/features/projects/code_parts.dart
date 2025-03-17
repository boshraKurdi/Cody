import 'package:cody/constants/colo_extension.dart';
import 'package:cody/constants/styles.dart';
import 'package:cody/features/projects/project_detailes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home/home_page.dart';
class CodeParts extends StatelessWidget {
  const CodeParts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CusstomAppCodyAppBar(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(textAlign: TextAlign.center,'That is Your Messages With Me That You Choose to Use ,Are you Happy .',style: Styles.kFontSize16,),
            ),
            Expanded(child: ListView.separated(itemBuilder: (context, index) {
              return MessageViewCard(index: index,);
            }, separatorBuilder:(context, index) => SizedBox(height: 15,), itemCount: 17))
          ],
        ),
      ),
    );
  }
}

class MessageViewCard extends StatelessWidget {
  final int index;
  const MessageViewCard({
    super.key, required this.index,
  });

  @override
  Widget build(BuildContext context) {
    bool num = index%2==0;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(color:num? TColor.secondaryColor2:TColor.white,borderRadius: BorderRadius.circular(12),border: Border.all(width: 1,color: TColor.blueColor)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                 width: 50,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(90),   color: TColor.blueColor,),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CusttomAppAssetImage(
                      image:
                      'assets/img/vecteezy_robot-chatbot-aesthetic_25271430.png',
                      width: 40),
                  ),
                ),
                SizedBox(width: 15,),
                Text('Part Name',style: Styles.kFontSize16.copyWith(color: TColor.primaryColor3),)
              ],
            ),
            Text('jkhdcladsgvuidhvuishvbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb',style: Styles.kFontSize16.copyWith(fontWeight: FontWeight.normal),),
          ],
        ),
      ),
    );
  }
}
