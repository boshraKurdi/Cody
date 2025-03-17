import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants/colo_extension.dart';
import '../../../../../constants/names.dart';


class SearchIcon extends StatelessWidget {
  const SearchIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).pushNamed(Names.ChatPage);
      },
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: TColor.primaryG,
            ),
            borderRadius: BorderRadius.circular(35),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 2,
              )
            ]),
        child: Icon(
          Icons.chat_outlined,
          color: TColor.white,
          size: 35,
        ),
      ),
    );
  }
}