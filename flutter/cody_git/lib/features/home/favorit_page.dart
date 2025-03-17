import 'package:cody/common%20wedgit/custtom_search_text_feild.dart';
import 'package:cody/constants/colo_extension.dart';
import 'package:cody/features/home/wedgits/favorit_hart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
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
            ),
            SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Your Favorite Projects',
                style: TextStyle(
                    color: TColor.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
            ),
            Container(
              width: 300,
              height: 1,
              color: TColor.primaryColor2,
            ),
            SizedBox(
              height: 18,
            ),
            CusstomAppSearchSetion(textEditingController: textEditingController),
            SizedBox(
              height: 18,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(itemCount: 12,gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200,mainAxisExtent: 250,crossAxisSpacing: 25,mainAxisSpacing: 25), itemBuilder: (BuildContext context, int index) {
                  return Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),gradient: TColor.kmainGradint),width: 50,height: 50,child: Column(children: [
                    FavoretHart(),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                        Text(
                          'Your Projects',
                          style: TextStyle(
                              color: TColor.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                        Row(children: [
                          Image(
                            image: AssetImage(
                              'assets/img/code-square-svgrepo-com.png',
                            ),
                            width: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'React.js',
                            style: TextStyle(
                                color: TColor.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 10),
                          ),

                        ],)
                      ],),
                    ),
                    SizedBox(height: 15,)
                  ],),);
                },),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CusstomAppSearchSetion extends StatelessWidget {
  const CusstomAppSearchSetion({
    super.key,
    required this.textEditingController,
  });

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: Image(
                image: AssetImage(
                  'assets/img/searchSetting.png',
                ),
                width: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

