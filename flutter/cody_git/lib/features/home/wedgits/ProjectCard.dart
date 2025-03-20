import 'package:flutter/material.dart';

import '../../../constants/colo_extension.dart';
import '../../../constants/styles.dart';
import '../../projects/presintation/views bloc/project bloc/project_bloc.dart';
import '../home_page.dart';
import 'custtom_app_aseet_image.dart';
import 'favorit_hart.dart';

class ProjectCard extends StatelessWidget {
  final GetAllProjectSuccess state;
  final int index;
  final void Function()? onTap;
  const ProjectCard({
    super.key, this.onTap, required this.state, required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: TColor.gray.withOpacity(.2)),
        child: Column(
          children: [
            FavoretHart(),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    state.showAllProjectModel.data![index].title!,
                    style: Styles.kFontSize16,
                  ),
                  Row(
                    children: [
                      CusttomAppAssetImage(
                        image:
                        'assets/img/code-square-svgrepo-com.png',
                        width: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        state.showAllProjectModel.data![index].language!,
                        style: Styles.kFontSize10,
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}