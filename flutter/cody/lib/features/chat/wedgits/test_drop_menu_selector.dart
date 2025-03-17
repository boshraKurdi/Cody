import 'package:flutter/material.dart';

import '../../../common wedgit/drop_down_list.dart';
import '../../../constants/colo_extension.dart';
import '../../../constants/styles.dart';

class TestDropMenuSelector extends StatefulWidget {
  String title;
  TestDropMenuSelector({super.key, required this.title});

  @override
  State<TestDropMenuSelector> createState() => _TestDropMenuSelectorState();
}

class _TestDropMenuSelectorState extends State<TestDropMenuSelector> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: TColor.white),
      child: Row(
        children: [
          Expanded(
            child: Text(
              widget.title,
              style: Styles.kFontSize16,
            ),
          ),
          DropDownList(
            item: const ["Male", "Female"],
            onChanged: (String? value) {
              setState(() {
                widget.title = value!;
              });
              // BlocProvider.of<ExerciesDataBloc>(context).add(ExerciesDataEvent(value!));
              // textControllers[0]
              //     .text = value!;
            },
          ),
        ],
      ),
    );
  }
}
