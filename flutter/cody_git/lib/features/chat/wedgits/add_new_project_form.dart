import 'package:flutter/material.dart';

import '../../../common wedgit/custtom_textfield.dart';
import '../../../common wedgit/drop_down_list.dart';
import '../../../constants/colo_extension.dart';
import '../../../constants/styles.dart';
class AddNewProjectForm extends StatelessWidget {
  const AddNewProjectForm({
    super.key,
    required this.completeKey,
    required this.textControllers,
  });

  final GlobalKey<FormState> completeKey;
  final List<TextEditingController> textControllers;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.folder),
            SizedBox(
              width: 15,
            ),
            Text(
              'add to a new project',
              style: Styles.kFontSize18,
            )
          ],
        ),
        Container(
          width: 800,
          height: 1,
          color: TColor.primaryColor3,
        ),
        SizedBox(height: 16,),
        Form(
            key: completeKey,
            child: Column(
              children: [
                CustomTextField(
                  validator: (data) {
                    if (data!.isEmpty) {
                      return 'this feild is requerd';
                    }
                    return null;
                  },
                  controller: textControllers[0],
                  hitText: "Project Name",
                  icon: Icons.folder_special_rounded,
                ),
                SizedBox(height: 16,),
                CustomTextField(
                  validator: (data) {
                    if (data!.isEmpty) {
                      return 'this feild is requerd';
                    }
                    return null;
                  },
                  controller:
                  textControllers[1],
                  hitText: "Feature Name",
                  icon: Icons.paste_rounded,
                ),
                SizedBox(height: 16,),
                CustomTextField(
                  validator: (data) {
                    if (data!.isEmpty) {
                      return 'this feild is requerd';
                    }
                    return null;
                  },
                  controller:
                  textControllers[2],
                  hitText: "Page Name",
                  icon: Icons.file_copy,

                ),
                SizedBox(height: 16,),
                CustomTextField(
                  validator: (data) {
                    if (data!.isEmpty) {
                      return 'this feild is requerd';
                    }
                    return null;
                  },
                  controller:
                  textControllers[3],
                  hitText: "Part Name",
                  icon: Icons.code,
                  rigtIcon: DropDownList(
                    item: const [
                      "Male",
                      "Female"
                    ],
                    onChanged:
                        (String? value) {
                      // BlocProvider.of<ExerciesDataBloc>(context).add(ExerciesDataEvent(value!));
                      textControllers[3]
                          .text = value!;
                    },
                  ),
                )
              ],
            ))
      ],
    );
  }
}