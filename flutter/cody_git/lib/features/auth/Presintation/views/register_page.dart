import 'package:cody/common%20wedgit/Custom_app_button.dart';
import 'package:cody/features/auth/Presintation/views/wedgits/have_an_acount.dart';
import 'package:cody/features/auth/Presintation/views/wedgits/sign_in_form.dart';

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

class RegisterPage extends StatelessWidget {
 RegisterPage({super.key});

  final GlobalKey<FormState> key1 =GlobalKey();
  final List<TextEditingController> edit =[TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(child: SingleChildScrollView(
        child:BlocConsumer<AuthBloc, AuthState>(
  listener: (context, state) {
  if(state is SignUpFailed)
    {
      bottomSnackbarMassage(context: context, message: state.error);
    }
  if(state is SignUpSuccess)
  {bottomSnackbarMassage(context: context, message: state.registerModel.message!);
   GoRouter.of(context).goNamed(Names.MainTabPage);
  }
  },
  builder: (context, state) {
    if(state is SignUpLoading)
      {
        return LoadingPage();
      }
    return RegisterBody(key1: key1, edit: edit,);
  },
) ,
      ),) ,
    );
  }
}
class RegisterBody extends StatelessWidget {
  final GlobalKey<FormState> key1 ;
  final List<TextEditingController> edit;
  const RegisterBody({super.key, required this.key1, required this.edit});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CusstomAppCodyAppBar(),
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(textAlign: TextAlign.center,'Hello Iam Cody Your Coder Helper.',style: Styles.kFontSize16,),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: SignInForm(keySign: key1, edit: edit),
      ),
      Padding(
        padding: const EdgeInsets.all(24.0),
        child: CusttomAppButton(title: 'Register',gradent: TColor.korangGradent, onPressed: () {
BlocProvider.of<AuthBloc>(context).add(Register(edit[0].text, edit[1].text, edit[2].text));
        },),
      ),HaveAnAcount(title: 'you Have An Acount ?',onTap: () {
        GoRouter.of(context).pushNamed(Names.LogIn);
      },)

    ],);
  }
}
