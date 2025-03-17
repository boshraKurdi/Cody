import 'package:cody/common%20wedgit/custtom_search_text_feild.dart';
import 'package:cody/constants/colo_extension.dart';
import 'package:cody/constants/names.dart';
import 'package:cody/features/home/wedgits/favorit_hart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cody/constants/styles.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Positioned(
            top: 0,
            right: MediaQuery.of(context).size.width * .5,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * .5,
              decoration: BoxDecoration(color: TColor.primaryColor1),
            ),
          ),
          Positioned(
            top: 0,
            left: MediaQuery.of(context).size.width * .5,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * .5,
              decoration: BoxDecoration(color: TColor.white),
            ),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.225,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: TColor.kmainGradint2,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(100)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 24),
                      child: Text(
                        'Your Latest Projects :',
                        style: Styles.kFontSize20,
                      ),
                    )
                 ,
                    Expanded(child: ListView.builder(
                      itemBuilder: (context, index) {
                        return LatestProjectCard();
                      },
                    ))
                  ],
                ),
              )),
          Positioned(top: 0,child: ClipRRect(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
            child: Container(
              height: MediaQuery.of(context).size.height * .68,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: TColor.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CusttomAppAppBar(),
                  CodyMessageWedgit(),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Expanded(
                            child: CusttomSearchTextFeild(
                              txtSearch: textEditingController,
                              SearshTestHint: 'Search..',
                              dropDownListItems: [],
                              onChanged: (p0) {},
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(200),
                            child: CusttomAppAssetImage(image:  'assets/img/settings-2-svgrepo-com.png',width: 40,)
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 24),
                    child: Text(
                      'Your Projects',
                      style: Styles.kFontSize20,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 37),
                      child: GridView.builder(
                        itemCount: 12,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            mainAxisExtent: 200,
                            crossAxisSpacing: 25,
                            mainAxisSpacing: 25),
                        itemBuilder: (BuildContext context, int index) {
                          return ProjectCard(onTap: () {
                            GoRouter.of(context).pushNamed(Names.ProjectDetailes);
                          },);
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),

        ],
      )),
    );
  }
}

class LatestProjectCard extends StatelessWidget {
  const LatestProjectCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 30.0, vertical: 16),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24,vertical: 8),
        height: 90,
        width: 200,
        decoration: BoxDecoration(
            color: TColor.white.withOpacity(.6),
            borderRadius:
                BorderRadius.all(Radius.circular(20))),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CusttomAppAssetImage(
              image:
                  'assets/img/images.jpeg',
              width: 100,
            ),
            SizedBox(width: 15,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'No Bain No Gain ',
                  style: Styles.kFontSize16,
                ),
                Text(
                  'flutter',
                  style:Styles.kFontSize14,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
 final void Function()? onTap;
  const ProjectCard({
    super.key, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: TColor.gray.withOpacity(.2)),
        child: Column(
          children: [
            FavoretHart(),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Projects',
                    style: Styles.kFontSize16,
                  ),
                  Row(
                    children: [
                      CusttomAppAssetImage(
                        image:
                        'assets/img/code-square-svgrepo-com.png',
                        width: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'React.js',
                        style: Styles.kFontSize10,
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}

class CodyMessageWedgit extends StatelessWidget {
  const CodyMessageWedgit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          width: MediaQuery.of(context).size.width,
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
          //  color:TColor.gray
             gradient: TColor.kcardGradiant
          ),
        ),
        CusttomAppAssetImage(
            image:
            'assets/img/vecteezy_robot-chatbot-aesthetic_25271430.png',
            width: 135),
        Positioned(
          right: 70,
          top: 20,
          child: Text(
            'Cody Is Your \n Programmer \n Friend',
            softWrap: true,
            textAlign: TextAlign.center,
            style: Styles.kFontSize24.copyWith(color: TColor.white)
            //Styles.kFontSize24,
          ),
        )
      ],
    );
  }
}

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
          ClipRRect(
            borderRadius: BorderRadius.circular(200),
            child: Image(
              image: AssetImage(
                'assets/img/4260937.png',
              ),
              width: 50,
            ),
          ),
        ],
      ),
    );
  }
}

class CusttomAppAssetImage extends StatelessWidget {
  final String image;
  final double width;
  const CusttomAppAssetImage({
    super.key,
    required this.image,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(
        image,
      ),
      width: width,
    );
  }
}
