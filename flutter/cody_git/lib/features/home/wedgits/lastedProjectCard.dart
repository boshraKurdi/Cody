import 'package:flutter/material.dart';

import '../../../constants/colo_extension.dart';
import '../../../constants/styles.dart';
import '../../projects/presintation/views bloc/project bloc/project_bloc.dart';
import '../home_page.dart';
import 'custtom_app_aseet_image.dart';

class LatestProjectCard extends StatelessWidget {
  final GetAllProjectSuccess state;
  final int index;
  const LatestProjectCard({
    super.key, required this.state, required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 30.0, vertical: 16),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24,vertical: 8),
        height: 90,
        width: 200,
        decoration: BoxDecoration(
            color: TColor.white.withOpacity(.6),
            borderRadius:
            BorderRadius.all(Radius.circular(20))),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CusttomAppAssetImage(
              image:
              'assets/img/images.jpeg',
              width: 100,
            ),
            SizedBox(width: 15,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.showAllProjectModel.data![index].title!,
                  style: Styles.kFontSize16,
                ),
                Text(
                  state.showAllProjectModel.data![index].language!,
                  style:Styles.kFontSize14,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}