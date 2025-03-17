import 'package:cody/common%20wedgit/Custom_app_button.dart';
import 'package:cody/constants/colo_extension.dart';
import 'package:cody/constants/names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class StartedPage extends StatelessWidget {
  const StartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(
                  image: AssetImage(
                    'assets/img/1542125872273.jpeg',
                  ),
                  fit: BoxFit.fitHeight,
                  width: 500,
                  height: 500,
                ),
              ),
              Text('Cody Is Your \n Programmer Friend',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w500,color: TColor.black, fontSize: 32),),
              Text('Discover new helpful way to build\n your code with many features and\n techniques',textAlign: TextAlign.center,style: TextStyle(color: TColor.gray, fontSize: 16),),
             SizedBox(
               height: 15,
             ),
              CusttomAppButton(title: 'Start Your Adventure', onPressed: () {
                GoRouter.of(context).goNamed(Names.SecoundStartedPage);
              },)


            ],
          ),
        )
        ,),
    );
  }
}
