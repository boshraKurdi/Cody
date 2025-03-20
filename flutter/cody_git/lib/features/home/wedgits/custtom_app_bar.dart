import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/names.dart';
class CusttomAppAppBar extends StatelessWidget {
  const CusttomAppAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image(
            image: AssetImage(
              'assets/img/burger-menu-svgrepo-com.png',
            ),
            width: 50,
          ),
          GestureDetector(
            onTap: () => GoRouter.of(context).pushNamed(Names.RegisterPage),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: Image(
                image: AssetImage(
                  'assets/img/4260937.png',
                ),
                width: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }
}