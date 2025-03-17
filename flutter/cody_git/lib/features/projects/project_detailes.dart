import 'package:cody/common%20wedgit/Custom_app_button.dart';
import 'package:cody/constants/styles.dart';
import 'package:cody/features/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constants/colo_extension.dart';
import '../../constants/names.dart';

class ProjectDetailes extends StatelessWidget {
  const ProjectDetailes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CusstomAppCodyAppBar(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Project Name',
                      style: Styles.kFontSize20,
                    ),
                    Icon(Icons.favorite,color: Colors.red,)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                        child: Image(
                          image: AssetImage(
                            'assets/img/code-square-svgrepo-com.png',
                          ),
                          width: 50,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
                        child: Text(
                          'Flutter',
                          style: Styles.kFontSize14,
                        ),
                      ),
                    ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
                child: Text(
                  ' Description',
                  style: Styles.kFontSize24.copyWith(color: TColor.orangeColor2),

                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  ' Description Description DescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescription',
                  style: Styles.kFontSize16.copyWith(fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(height: 70,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: CusttomAppButton(title: 'Show Pages',size: 90,gradent: TColor.korangGradent, onPressed: () {
GoRouter.of(context).pushNamed(Names.FeaturesPage);
                },),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CusstomAppCodyAppBar extends StatelessWidget {
  const CusstomAppCodyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .4,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .25,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: TColor.kmainGradint,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(120))),
          ),
          Positioned(
              bottom: 0,
              right: MediaQuery.of(context).size.width * .25,
              left: MediaQuery.of(context).size.width * .25,
              child: CusttomAppAssetImage(
                  image:
                      'assets/img/vecteezy_robot-chatbot-aesthetic_25271430.png',
                  width: 155))
        ],
      ),
    );
  }
}
