import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../common wedgit/custom_text_feild_prefix_icon.dart';
import '../../../../../common wedgit/custtom_textfield.dart';
import '../../../../../constants/colo_extension.dart';
import '../../views bloc/Auth bloc/auth_bloc.dart';
class BasswordField extends StatelessWidget {
  const BasswordField({
    super.key, required this.key1, required this.edit,
  });
  final GlobalKey<FormState> key1;
  final TextEditingController edit;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<showBloc, ShowPasswordState>(
      builder: (context, state) {
        return CustomTextField(
          controller: edit,
          validator: (data) {
            if(data!.isEmpty ) {
              return "enter your password please";
            }else if( data.length<6)
              {
                return  "password vertifay";
              }
          },
          hitText: "Password" ,
          icon:Icons.lock,
          obscureText:state.isPressed? false:true,
          rigtIcon: TextButton(
            onPressed: () {
              BlocProvider.of<showBloc>(context).add(ShowPassword());
            },
            child: state.isPressed ?  Icon(
              Icons.remove_red_eye, color: TColor.gray,):const CustomTextFieldPrefixIcon(
            icon: Icons.remove,) ),
        );
      },
    );
  }
}