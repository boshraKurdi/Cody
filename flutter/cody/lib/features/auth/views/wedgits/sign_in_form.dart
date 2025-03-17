
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common wedgit/custtom_textfield.dart';
import 'bassword_field.dart';

class user {
 final String name;
 final String email ;
 final String password;
  user(this.name, this.email, this.password);
}

class SignInForm extends StatelessWidget {
  const SignInForm({super.key, required this.keySign, required this.edit});
  final GlobalKey<FormState> keySign;

  final List<TextEditingController> edit;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: keySign,
      child: Column(children: [
         CustomTextField(
           onchanged: (p0) {
           },
           controller: edit[0],
           validator: (name) {
             if(name!.isEmpty) {
               return "name vertifay";
             }
           },
          hitText: "First Name",
          icon: Icons.perm_identity,
        ),
        const SizedBox(
          height: 15,
        ),
         CustomTextField(
           onchanged: (p0) {
           },
           controller: edit[1],
           validator: (data) {
             if(data!.isEmpty || !data.contains('@')) {
               return "email vertify";
             }
           },
          hitText: "Email",
          icon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(
          height: 15,
        ),
        BasswordField(key1: keySign,edit:edit[2]),
      ],),
    );
  }
}


