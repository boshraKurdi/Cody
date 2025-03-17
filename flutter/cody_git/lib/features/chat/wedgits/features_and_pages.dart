import 'package:cody/features/chat/wedgits/test_drop_menu_selector.dart';
import 'package:cody/features/chat/wedgits/topOfDialogMessage.dart';
import 'package:flutter/material.dart';

import '../../../common wedgit/show_dialoge_messeage.dart';
import '../../../constants/colo_extension.dart';
import '../chat_page.dart';
import 'add_page_or_feature_wedgit.dart';
import 'or_add_new_wedgit.dart';

class FeaturesAndPages extends StatefulWidget {
  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController textEditingController2 = TextEditingController();
  FeaturesAndPages({
    super.key,
  });

  @override
  State<FeaturesAndPages> createState() => _FeaturesAndPagesState();
}

class _FeaturesAndPagesState extends State<FeaturesAndPages> {
  String title = 'Feature Name';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopOfDialogMassage(
            iconData: Icons.square_rounded,
            title: 'Feautures And Pages',
          ),
          SizedBox(height: 5),
          TestDropMenuSelector(
            title: 'Feature Name',
          ),
          OrAddNewWedgit(
            title: 'or Add New Feature',
            onTap: () {
              showErrorDialogMesseage(
                context1: context,
                ontaptry: () {
                  if (widget.textEditingController.text.isNotEmpty) {
                    print('jj');
                  }
                },
                ontapcancel: () {
                  Navigator.pop(context);
                },
               // color: widget.textEditingController.text.isNotEmpty?TColor.blueColor:TColor.gray,
                buttonText: 'add',
                widget: AddPageOrFeatureWedgit(
                  onchanged: (p0) {
                    setState(() {

                    });
                  },
                  iconData: Icons.file_copy,
                  title: 'Feature Name',
                  textEditingController: widget.textEditingController,
                ),
              );
            },
          ),
          TestDropMenuSelector(
            title: 'Page Name',
          ),
          OrAddNewWedgit(
            title: 'or Add New Page',
            onTap: () {
              showErrorDialogMesseage(
                context1: context,
                ontaptry: () {
                  if (widget.textEditingController.text.isNotEmpty) {
                    print('jj');
                  }
                },
                ontapcancel: () {
                  Navigator.pop(context);
                },
                // color: widget.textEditingController.text.isNotEmpty?TColor.blueColor:TColor.gray,
                buttonText: 'add',
                widget: AddPageOrFeatureWedgit(
                  onchanged: (p0) {
                    setState(() {

                    });
                  },
                  iconData: Icons.file_copy,
                  title: 'Feature Name',
                  textEditingController: widget.textEditingController2,
                ),
              );
            },
          ),
          TestDropMenuSelector(
            title: 'Part Name',
          ),
        ],
      ),
    );
  }
}
