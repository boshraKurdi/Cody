import 'package:cody/constants/names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/colo_extension.dart';

class SecoundStartedPage extends StatelessWidget {
  const SecoundStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image(
            image: AssetImage(
              'assets/img/b332ade2c0460edaec307ba7266ac7fb.jpg',
            ),
            fit: BoxFit.fitHeight,
            height: MediaQuery.of(context).size.height,
          ),
          Positioned(
              top: 300,
              left: MediaQuery.of(context).size.width * .1,
              right: MediaQuery.of(context).size.width * .1,
              child: Text(
                'Let\'s Make Your \n Dream Reality',
                style: TextStyle(
                    color: TColor.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 40),
              )),
          Positioned(
              bottom: 50,
              left: MediaQuery.of(context).size.width * .1,
              right: MediaQuery.of(context).size.width * .1,
              child: MaterialButton(
                onPressed: () {
                  GoRouter.of(context).goNamed(Names.MainTabPage);
                },
                child: Container(
                  height: 80,
                  width: 500,
                  decoration: BoxDecoration(
                      color: TColor.blueColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      'Start Coding',
                      style: TextStyle(
                          color: TColor.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 32),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
