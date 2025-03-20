import 'package:cody/common%20wedgit/Custom_app_button.dart';
import 'package:cody/features/projects/presintation/views%20bloc/code%20bloc/code_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../common wedgit/bottom_snackbar_message.dart';
import '../../../../../common wedgit/custtom_textfield.dart';
import '../../../../../common wedgit/doonload_wedgit.dart';
import '../../../../../common wedgit/drop_down_list.dart';
import '../../../../../constants/colo_extension.dart';
import '../../../../../constants/styles.dart';

class AddNewProjectForm extends StatelessWidget {
  final String codeMessage;
  AddNewProjectForm({
    super.key, required this.codeMessage,
  });

  final GlobalKey<FormState> completeKey =GlobalKey();
  final List<TextEditingController> textControllers =[TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController(),];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(
        child: Container(
          width:  MediaQuery.of(context).size.width*.9,
          height: MediaQuery.of(context).size.height*.8,
          decoration: BoxDecoration(color: TColor.secondaryColor2,borderRadius: BorderRadius.circular(32)),
          padding: EdgeInsets.all(32),
          child: BlocConsumer<CodeBloc,CodeState>(builder: (context, state) {
            if (state is CodeLoading) {
              return DoonloadWedgit();
            }
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
                      child: SizedBox(
                        height: 450,
                        child: ListView(
                          children: [Column(
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
                                controller: textControllers[1],
                                hitText: "Project Description",
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
                                controller: textControllers[2],
                                hitText: "languge",
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
                                textControllers[3],
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
                                textControllers[4],
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
                                textControllers[5],
                                hitText: "Code Name",
                                icon: Icons.file_copy,
              
                              ),
                              // SizedBox(height: 16,),
                              // CustomTextField(
                              //   validator: (data) {
                              //     if (data!.isEmpty) {
                              //       return 'this feild is requerd';
                              //     }
                              //     return null;
                              //   },
                              //   controller:
                              //   textControllers[6],
                              //   hitText: "Code Description",
                              //   icon: Icons.code,
                              // ),
                              SizedBox(height: 16,),
                              CustomTextField(
                                validator: (data) {
                                  if (data!.isEmpty) {
                                    return 'this feild is requerd';
                                  }
                                  return null;
                                },
                                controller:
                                textControllers[7],
                                hitText: "Code Description",
                                icon: Icons.code,
              
                              )
                            ],
                          )],
                        ),
                      ),
                  ),
                  SizedBox(height: 32,),
                  CusttomAppButton(title: 'add', onPressed: (){
                    BlocProvider.of<CodeBloc>(context).add(addCodeToaNewProjectEvent(textControllers[0].text, textControllers[1].text, textControllers[2].text, textControllers[3].text, textControllers[4].text, textControllers[5].text,textControllers[7].text ,codeMessage)) ;    })
                ],
              ),
            );
          }, listener: (context, state) {
            if (state is CodeFailed) {
              bottomSnackbarMassage(
                  context: context, message: state.error);
            }
            if (state is addCodeToaNewProjectSuccess) {
              bottomSnackbarMassage(
                  context: context, message: 'success');
              GoRouter.of(context).pop();
            }
          },),
        ),
      ),),
    );
  }
}