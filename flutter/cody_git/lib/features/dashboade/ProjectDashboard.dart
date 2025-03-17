import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/colo_extension.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

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
                  ImageWedgit(imageName: 'assets/img/burger-menu-svgrepo-com.png', width: 50,),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Your Dashboard',
                        style: TextStyle(
                            color: TColor.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ),
                    Container(
                      width: 250,
                      height: 1,
                      color: TColor.primaryColor2,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45),
                  child: Image(
                    image: AssetImage(
                      'assets/img/add-folder-svgrepo-com.png',
                    ),
                    width: 30,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 60,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      //  height: 100,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Row(
                              children: [
                                ImageWedgit(imageName: 'assets/img/code-block-svgrepo-com (1).png', width: 30,),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Project Name',
                                  style: TextStyle(
                                      color: TColor.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                                Spacer(),
                                ImageWedgit(imageName: 'assets/img/link-svgrepo-com.png', width: 30,),
                                SizedBox(
                                  width: 20,
                                ),
                                ImageWedgit(imageName: 'assets/img/edit-1479-svgrepo-com.png', width: 30,),
                                SizedBox(
                                  width: 20,
                                ),
                                ImageWedgit(imageName: 'assets/img/delete-svgrepo-com.png', width: 30,),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 1,
                            color: TColor.primaryColor2,
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                    height: 40,
                  ),
                  itemCount: 4),
            ),
            SizedBox(
              height: 18,
            ),
          ],
        ),
      ),
    );
  }
}

class ImageWedgit extends StatelessWidget {
  final String imageName;
  final double width;
  const ImageWedgit({
    super.key, required this.imageName, required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(
        imageName,
      ),
      width: width,
    );
  }
}
