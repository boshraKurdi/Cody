import 'package:cody/common%20wedgit/Custom_app_button.dart';
import 'package:cody/common%20wedgit/failed_wedgit.dart';
import 'package:cody/features/projects/presintation/views%20bloc/code%20bloc/code_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../common wedgit/bottom_snackbar_message.dart';
import '../../../../../common wedgit/custtom_textfield.dart';
import '../../../../../common wedgit/doonload_wedgit.dart';
import '../../../../../common wedgit/drop_down_list.dart';
import '../../../../../constants/colo_extension.dart';
import '../../../../../constants/names.dart';
import '../../../../../constants/styles.dart';
import '../../../../projects/presintation/views bloc/project bloc/project_bloc.dart';

class AddToAnExextedProjectMessage extends StatefulWidget {
  final String codeMessage;
  AddToAnExextedProjectMessage({
    super.key,
    required this.codeMessage,
  });

  @override
  State<AddToAnExextedProjectMessage> createState() =>
      _AddToAnExextedProjectMessageState();
}

class _AddToAnExextedProjectMessageState
    extends State<AddToAnExextedProjectMessage> {
  @override
  initState() {
    super.initState();
    BlocProvider.of<ProjectBloc>(context).add(getAllProjects());
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
          child: Container(
            width: MediaQuery.of(context).size.width * .9,
            height: MediaQuery.of(context).size.height * .8,
            decoration: BoxDecoration(
                color: TColor.secondaryColor2,
                borderRadius: BorderRadius.circular(32)),
            padding: EdgeInsets.all(32),
            child: BlocConsumer<ProjectBloc, ProjectState>(
              builder: (context, state) {
                if (state is GetAllProjectSuccess) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.folder),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'chosse project name',
                              style: Styles.kFontSize18,
                            )
                          ],
                        ),
                        Container(
                          width: 800,
                          height: 1,
                          color: TColor.primaryColor3,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          height: 600,
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    GoRouter.of(context).pushNamed(Names.FeaturesAndPagesPage,extra: {'codeMessage' :widget.codeMessage,  'ProjectId':state.showAllProjectModel.data![index].id });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(8),
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: TColor.white),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.folder,
                                          color: TColor.secondaryColor1,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          state.showAllProjectModel.data![index]
                                              .title!,
                                          style: Styles.kFontSize16,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) => SizedBox(
                                    height: 5,
                                  ),
                              itemCount:
                                  state.showAllProjectModel.data!.length),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        //   BlocProvider.of<CodeBloc>(context).add(
                        //       addCodeToaNewProjectEvent(
                        //           textControllers[0].text,
                        //           textControllers[1].text,
                        //           textControllers[2].text,
                        //           textControllers[3].text,
                        //           textControllers[4].text,
                        //           textControllers[5].text,
                        //           textControllers[7].text,
                        //           codeMessage));
                        // })
                      ],
                    ),
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
    );
  }
}

// import 'package:cody/features/chat/presintation/views/wedgits/topOfDialogMessage.dart';
//
// import 'package:flutter/material.dart';
//
// import '../../../../../common wedgit/errors/show_error_dialoge_messeage.dart';
// import '../../../../../common wedgit/show_dialoge_messeage.dart';
// import '../../../../../constants/colo_extension.dart';
// import '../../../../../constants/styles.dart';
// import 'features_and_pages.dart';
//
// class AddToAnExextedProjectMessage extends StatelessWidget {
//
//   const AddToAnExextedProjectMessage({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,children: [
//       TopOfDialogMassage(iconData: Icons.dashboard_customize_outlined, title: 'add to an existed project',),
//       GestureDetector(
//         onTap: () {
//           // GoRouter.of(context).pop();
//           showErrorDialogMesseage(
//             context1: context,
//             ontaptry: () {},
//             ontapcancel: () {
//               Navigator.pop(context);
//             },
//             buttonText: 'add',
//             widget: FeaturesAndPages()
//             ,
//           );
//         },
//         child: Container(margin: EdgeInsets.all(8),width: MediaQuery.of(context).size.width,padding: EdgeInsets.all(8),decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: TColor.white),child: Row(
//           children: [
//             Icon(Icons.folder,color: TColor.secondaryColor1,),
//             SizedBox(width: 10,),
//             Text('project Name',style: Styles.kFontSize16,),
//           ],
//         ),),
//       ),
//       Container(margin: EdgeInsets.all(8),width: MediaQuery.of(context).size.width,padding: EdgeInsets.all(8),decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: TColor.white),child: Row(
//         children: [
//           Icon(Icons.folder,color: TColor.secondaryColor1,),
//           SizedBox(width: 10,),
//           Text('project Name',style: Styles.kFontSize16,),
//         ],
//       ),),
//       Container(margin: EdgeInsets.all(8),width: MediaQuery.of(context).size.width,padding: EdgeInsets.all(8),decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: TColor.white),child: Row(
//         children: [
//           Icon(Icons.folder,color: TColor.secondaryColor1,),
//           SizedBox(width: 10,),
//           Text('project Name',style: Styles.kFontSize16,),
//         ],
//       ),),
//       // SizedBox(
//       //   height: 10,
//       //   child: ListView.separated(itemBuilder: (context, index) {
//       //   return  TextButton(onPressed: () {  },
//       //     child: Text('project Name'));
//       //   }, separatorBuilder: (context, index) => SizedBox(height: 15,), itemCount: 4),
//       // ),
//       SizedBox(height: 16,),
//     ],);
//   }
// }
