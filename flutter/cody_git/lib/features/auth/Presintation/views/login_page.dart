import 'package:cody/common%20wedgit/Custom_app_button.dart';
import 'package:cody/features/auth/Presintation/views/wedgits/have_an_acount.dart';
import 'package:cody/features/auth/Presintation/views/wedgits/login_form_wedgit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../common wedgit/Loading_page.dart';
import '../../../../common wedgit/bottom_snackbar_message.dart';
import '../../../../constants/colo_extension.dart';
import '../../../../constants/names.dart';
import '../../../../constants/styles.dart';
import '../../../projects/presintation/veiws/project_detailes.dart';
import '../views bloc/Auth bloc/auth_bloc.dart';

class LogInPage extends StatelessWidget {
  LogInPage({super.key});
  final GlobalKey<FormState> key1 =GlobalKey();

  final List<TextEditingController> edit =[TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
      if(state is LogInFailed)
      {
        bottomSnackbarMassage(context: context, message: state.error);
      }
      if(state is LogInSuccess)
      {bottomSnackbarMassage(context: context, message: state.registerModel.status!);
      GoRouter.of(context).goNamed(Names.MainTabPage);
      }
        },
        builder: (context, state) {
      if(state is LogInLoading)
      {
        return LoadingPage();
      }
      return LogInBody(key1: key1, edit: edit);
        },
      ),
    );
  }
}

class LogInBody extends StatelessWidget {
  const LogInBody({
    super.key,
    required this.key1,
    required this.edit,
  });

  final GlobalKey<FormState> key1;
  final List<TextEditingController> edit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(child: SingleChildScrollView(
        child: Column(children: [
          CusstomAppCodyAppBar(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(textAlign: TextAlign.center,'Hello Iam Cody Your Coder Helper.',style: Styles.kFontSize16,),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: FormWedgit(loginKey: key1, controller: edit,),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: CusttomAppButton(title: 'LogIn',gradent: TColor.korangGradent, onPressed: () {
              BlocProvider.of<AuthBloc>(context).add(LogIn(edit[0].text, edit[1].text));
            },),
          ),HaveAnAcount(title: 'you Have An Acount ?',onTap: () {
            GoRouter.of(context).pop();
          },)
        
        ],),
      ),) ,
    );
  }
}
