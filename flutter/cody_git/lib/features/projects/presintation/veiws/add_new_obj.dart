import 'package:cody/common%20wedgit/Custom_app_button.dart';
import 'package:cody/features/home/wedgits/custtom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../common wedgit/bottom_snackbar_message.dart';
import '../../../../common wedgit/custtom_textfield.dart';
import '../../../../common wedgit/doonload_wedgit.dart';
import '../../../../common wedgit/drop_down_list.dart';
import '../../../../common wedgit/servies_locator.dart';
import '../../../../constants/colo_extension.dart';
import '../../../../constants/styles.dart';
import '../../../home/home_page.dart';
import '../../data/repo/project_repo_impl.dart';
import '../views bloc/project bloc/project_bloc.dart';

class AddNewProjectPage extends StatelessWidget {
  final String title;
  final String text1;
  final String text2;
  final String text3;
  final IconData iConData1;
  final IconData iConData2;
  final IconData iConData3;
  const AddNewProjectPage({
    super.key,
    required this.completeKey,
    required this.textControllers, required this.text1, required this.text2, required this.text3, required this.iConData1, required this.iConData2, required this.iConData3, required this.title,
  });

  final GlobalKey<FormState> completeKey;
  final List<TextEditingController> textControllers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:
      Container(  decoration: BoxDecoration(
        color:TColor.secondaryColor2,
        borderRadius: BorderRadius.circular(16)
      ),child:BlocProvider(
        create: (context) => ProjectBloc(getIt.get<ProjectsRepoImpl>()),
        child: BlocConsumer<ProjectBloc, ProjectState>(
          listener: (context, state) {
            if (state is ProjectFailed) {
              bottomSnackbarMassage(
                  context: context, message: state.error);
            }
            if (state is CreateProjectSuccess) {
              bottomSnackbarMassage(
                  context: context, message: 'success');
              GoRouter.of(context).pop();
            }
          },
          builder: (context, state) {
            if (state is ProjectLoading) {
              return DoonloadWedgit();
            }
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CusttomAppAppBar(),
                  Row(
                    children: [
                      Icon(Icons.folder),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        title,
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
                            hitText: text1,
                            icon: iConData1,
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
                            hitText: text2,
                            icon: iConData2,
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
                            hitText: text3,
                            icon: iConData3,

                          ),

                        ],
                      )),
                  SizedBox(height: 16,),
                  CusttomAppButton(title: 'add',gradent: TColor.korangGradent, onPressed: () {
                    BlocProvider.of<ProjectBloc>(context).add(createProject(
                        textControllers[0].text,
                        textControllers[1].text,
                        textControllers[2].text));
                  },)
                ],
              ),
            );
          },
        ),
      )),),
    );


  }
}