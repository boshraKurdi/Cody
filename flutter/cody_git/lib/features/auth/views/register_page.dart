import 'package:cody/common%20wedgit/Custom_app_button.dart';
import 'package:cody/features/auth/views/wedgits/have_an_acount.dart';
import 'package:cody/features/auth/views/wedgits/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../constants/colo_extension.dart';
import '../../../constants/names.dart';
import '../../../constants/styles.dart';
import '../../projects/project_detailes.dart';
class RegisterPage extends StatelessWidget {
 RegisterPage({super.key});
  @override
  final GlobalKey<FormState> key =GlobalKey();
  final List<TextEditingController> edit =[TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController()];
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
            child: SignInForm(keySign: key, edit: edit),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: CusttomAppButton(title: 'Register',gradent: TColor.korangGradent, onPressed: () {
        
            },),
          ),HaveAnAcount(title: 'you Have An Acount ?',onTap: () {
            GoRouter.of(context).pushNamed(Names.LogIn);
          },)
        
        ],),
      ),) ,
    );
  }
}
