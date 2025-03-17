import 'package:cody/constants/colo_extension.dart';
import 'package:cody/constants/names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../home/home_page.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}
@override
void initState(BuildContext context) {
  goToBoarding(context);
}
class _SplashViewState extends State<SplashView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CusttomAppAssetImage(
              image:
              'assets/img/vecteezy_robot-chatbot-aesthetic_25271430.png',
              width: 200),
          InkWell(onTap: () {
            GoRouter.of(context).goNamed(Names.StatedPage);
          },child: Text('Cody',style: TextStyle(fontWeight: FontWeight.w700,color: TColor.primaryColor2,fontSize: 30),))
        ],
      )),
    );
  }
}
 void goToBoarding(BuildContext context) {
    Future.delayed(Duration(seconds: 2));
   GoRouter.of(context).goNamed(Names.MainTabPage);
  }