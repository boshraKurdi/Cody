import 'package:cody/features/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../constants/colo_extension.dart';
import '../../constants/names.dart';
import '../home/favorit_page.dart';
import 'package:cody/constants/styles.dart';
class FeaturesPag extends StatelessWidget {
  FeaturesPag({super.key});
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CusstomAppSearchSetion(textEditingController: textEditingController),
              Expanded(
                child: ListView.separated(itemBuilder: (context, index) {
                  return  Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      Text('Feature Name',style: Styles.kFontSize18.copyWith(fontWeight: FontWeight.w600),),
                      SizedBox(height: 10,),
                      SizedBox(
                        height: 200,
                        child: ListView.separated(scrollDirection: Axis.horizontal,itemBuilder: (context, index) {
                          return PagesCard(index: index,onTap: () {
                            GoRouter.of(context).pushNamed(Names.CodeParts);
                          },);
                        }, separatorBuilder: (context, index) => SizedBox(width: 15,), itemCount: 7),
                      )
                    ],
                  );
                }, separatorBuilder: (context, index) => SizedBox(height: 15), itemCount: 5),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PagesCard extends StatelessWidget {
  final void Function()? onTap;
  final int index;
  const PagesCard({
    super.key, this.onTap, required this.index,
  });

  @override
  Widget build(BuildContext context) {
    bool num = index%2 ==0;
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: num? TColor.secondaryColor2:TColor.secondaryColor1),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CusttomAppAssetImage(image: 'assets/img/vecteezy_robot-chatbot-aesthetic_25271430.png', width: 90),
              Spacer(),
              Text(
                'Page Name',
                style: Styles.kFontSize16,
              ),

            ],
          ),
        ),
      ),
    );
  }
}