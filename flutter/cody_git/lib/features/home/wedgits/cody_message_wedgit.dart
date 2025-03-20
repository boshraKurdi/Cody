import 'package:flutter/material.dart';

import '../../../constants/colo_extension.dart';
import '../../../constants/styles.dart';
import '../home_page.dart';
import 'custtom_app_aseet_image.dart';

class CodyMessageWedgit extends StatelessWidget {
  const CodyMessageWedgit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          width: MediaQuery.of(context).size.width,
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              //  color:TColor.gray
              gradient: TColor.kcardGradiant
          ),
        ),
        CusttomAppAssetImage(
            image:
            'assets/img/vecteezy_robot-chatbot-aesthetic_25271430.png',
            width: 135),
        Positioned(
          right: 70,
          top: 20,
          child: Text(
              'Cody Is Your \n Programmer \n Friend',
              softWrap: true,
              textAlign: TextAlign.center,
              style: Styles.kFontSize24.copyWith(color: TColor.white)
            //Styles.kFontSize24,
          ),
        )
      ],
    );
  }
}