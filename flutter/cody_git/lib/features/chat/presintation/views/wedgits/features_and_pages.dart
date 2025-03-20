import 'package:cody/common%20wedgit/Custom_app_button.dart';
import 'package:cody/common%20wedgit/failed_wedgit.dart';
import 'package:cody/features/chat/presintation/views/wedgits/test_drop_menu_selector.dart';
import 'package:cody/features/projects/presintation/views%20bloc/code%20bloc/code_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../common wedgit/bottom_snackbar_message.dart';
import '../../../../../common wedgit/custtom_textfield.dart';
import '../../../../../common wedgit/doonload_wedgit.dart';
import '../../../../../common wedgit/drop_down_list.dart';
import '../../../../../common wedgit/show_dialoge_messeage.dart';
import '../../../../../constants/colo_extension.dart';
import '../../../../../constants/names.dart';
import '../../../../../constants/styles.dart';
import '../../../../projects/presintation/views bloc/features bloc/features_bloc.dart';
import '../../../../projects/presintation/views bloc/project bloc/project_bloc.dart';
import 'add_page_or_feature_wedgit.dart';
import 'or_add_new_wedgit.dart';

class FeaturesAndPagesPage extends StatefulWidget {
  final int ProjectId;
  final String codeMessage;
  FeaturesAndPagesPage({
    super.key,
    required this.codeMessage,
    required this.ProjectId,
  });

  @override
  State<FeaturesAndPagesPage> createState() => _FeaturesAndPagesPageState();
}

class _FeaturesAndPagesPageState extends State<FeaturesAndPagesPage> {
  @override
  initState() {
    super.initState();
    BlocProvider.of<ProjectBloc>(context)
        .add(getAllFeaturesForProject(widget.ProjectId));
  }

  final GlobalKey<FormState> completeKey = GlobalKey();

  final List<TextEditingController> textControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width * .9,
              height: MediaQuery.of(context).size.height * .8,
              decoration: BoxDecoration(
                  color: TColor.secondaryColor2,
                  borderRadius: BorderRadius.circular(32)),
              padding: EdgeInsets.all(32),
              child: BlocConsumer<ProjectBloc, ProjectState>(
                builder: (context, state) {
                  if (state is AllFeaturesForProjectSuccess) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TestDropMenuSelector(
                          title: 'Feature Name', lest: state.showAllProjectModel.data!.map((e) => e.title!).toList(),
                        ),
                        OrAddNewWedgit(
                          title: 'or Add New Feature',
                          onTap: () {
                            // showErrorDialogMesseage(
                            //   context1: context,
                            //   ontaptry: () {
                            //     if (textControllers[0].text.isNotEmpty) {
                            //       print('jj');
                            //     }
                            //   },
                            //   ontapcancel: () {
                            //     Navigator.pop(context);
                            //   },
                            //  // color: widget.textEditingController.text.isNotEmpty?TColor.blueColor:TColor.gray,
                            //   buttonText: 'add',
                            //
                            // );
                          },
                        ),
                        // for(int i=0;i< state.showAllProjectModel.data!.length;i++)
                        // state.showAllProjectModel.data!.map((e) => e.title!).toList()== state.showAllProjectModel.data![i].title? TestDropMenuSelector(
                        //   title: 'Page Name', lest:  state.showAllProjectModel.data![] .map((e) => e.title!).toList(),
                        // ):,
                        OrAddNewWedgit(
                          title: 'or Add New Page',
                          onTap: () {
                          },
                        ),
                 CustomTextField(hitText: 'code name', icon: Icons.code)
                      ],
                    );
                  }
                  if (state is ProjectFailed) {
                    return FailedWedgit();
                  }
                  return DoonloadWedgit();
                },
                listener: (context, state) {},
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//
// import 'package:cody/features/chat/presintation/views/wedgits/test_drop_menu_selector.dart';
// import 'package:cody/features/chat/presintation/views/wedgits/topOfDialogMessage.dart';
// import 'package:flutter/material.dart';
//
// import '../../../../../common wedgit/show_dialoge_messeage.dart';
// import '../chat_page.dart';
// import 'add_page_or_feature_wedgit.dart';
// import 'or_add_new_wedgit.dart';
//
// class FeaturesAndPages extends StatefulWidget {
//   final TextEditingController textEditingController = TextEditingController();
//   final TextEditingController textEditingController2 = TextEditingController();
//   FeaturesAndPages({
//     super.key,
//   });
//
//   @override
//   State<FeaturesAndPages> createState() => _FeaturesAndPagesState();
// }
//
// class _FeaturesAndPagesState extends State<FeaturesAndPages> {
//   String title = 'Feature Name';
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           TopOfDialogMassage(
//             iconData: Icons.square_rounded,
//             title: 'Feautures And Pages',
//           ),
//           SizedBox(height: 5),
//           TestDropMenuSelector(
//             title: 'Feature Name',
//           ),
//           OrAddNewWedgit(
//             title: 'or Add New Feature',
//             onTap: () {
//               showErrorDialogMesseage(
//                 context1: context,
//                 ontaptry: () {
//                   if (widget.textEditingController.text.isNotEmpty) {
//                     print('jj');
//                   }
//                 },
//                 ontapcancel: () {
//                   Navigator.pop(context);
//                 },
//                // color: widget.textEditingController.text.isNotEmpty?TColor.blueColor:TColor.gray,
//                 buttonText: 'add',
//                 widget: AddPageOrFeatureWedgit(
//                   onchanged: (p0) {
//                     setState(() {
//
//                     });
//                   },
//                   iconData: Icons.file_copy,
//                   title: 'Feature Name',
//                   textEditingController: widget.textEditingController,
//                 ),
//               );
//             },
//           ),
//           TestDropMenuSelector(
//             title: 'Page Name',
//           ),
//           OrAddNewWedgit(
//             title: 'or Add New Page',
//             onTap: () {
//               showErrorDialogMesseage(
//                 context1: context,
//                 ontaptry: () {
//                   if (widget.textEditingController.text.isNotEmpty) {
//                     print('jj');
//                   }
//                 },
//                 ontapcancel: () {
//                   Navigator.pop(context);
//                 },
//                 // color: widget.textEditingController.text.isNotEmpty?TColor.blueColor:TColor.gray,
//                 buttonText: 'add',
//                 widget: AddPageOrFeatureWedgit(
//                   onchanged: (p0) {
//                     setState(() {
//
//                     });
//                   },
//                   iconData: Icons.file_copy,
//                   title: 'Feature Name',
//                   textEditingController: widget.textEditingController2,
//                 ),
//               );
//             },
//           ),
//           TestDropMenuSelector(
//             title: 'Part Name',
//           ),
//         ],
//       ),
//     );
//   }
// }
