import 'package:cody/common%20wedgit/bottom_snackbar_message.dart';
import 'package:cody/common%20wedgit/servies_locator.dart';
import 'package:cody/constants/names.dart';

import 'package:cody/features/home/wedgits/custtom_app_bar.dart';
import 'package:cody/features/projects/presintation/views%20bloc/features%20bloc/features_bloc.dart';
import 'package:cody/features/projects/presintation/views%20bloc/project%20bloc/project_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../common wedgit/doonload_wedgit.dart';
import '../../../../common wedgit/failed_wedgit.dart';
import '../../../../constants/colo_extension.dart';


class PageDashBoard extends StatefulWidget {
  final int FeatureId;

  PageDashBoard({super.key, required this.FeatureId,});

  @override
  State<PageDashBoard> createState() => _PageDashBoardState();
}

class _PageDashBoardState extends State<PageDashBoard> {
  @override
  void initState() {
    BlocProvider.of<FeaturesBloc>(context).add(getAllPages(widget.FeatureId));
    super.initState();
  }
  final List<TextEditingController> textEditingController = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  final GlobalKey<FormState> completeKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CusttomAppAppBar(),
            SizedBox(
              height: 6,
            ),
            DashBoardAddSection(
              Name: 'Page DashBoard',
              imageName: 'assets/img/add-folder-svgrepo-com.png',
              onTap: () async {
                await     GoRouter.of(context).pushNamed(Names.AddNewPagePage,extra: {
                  'completeKey': completeKey,
                  'textControllers': textEditingController,
                  'text1': 'Add Page Name',
                  'text2': 'Add Page Description',
                  'text3': 'Add Page Languge',
                  'iConData1': Icons.wallet_travel,
                  'iConData2': Icons.text_format,
                  'iConData3': Icons.language,
                  'title': 'Create Page','projectId':widget.FeatureId});
                BlocProvider.of<FeaturesBloc>(context).add(getAllPages(widget.FeatureId));
              },
            ),
            SizedBox(
              height: 60,
            ),
            BlocBuilder<FeaturesBloc,FeaturesState>(
              builder: (context, state) {
                if (state is ProjectFailed) {
                  return FailedWedgit();
                }
                else if (state is GetAllPagesSuccess) {
                  return Expanded(
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
                                      ImageWedgit(
                                        imageName: Icons.code_sharp,
                                        width: 30,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        state.showAllFeaturesModel.data![index].title!,
                                        style: TextStyle(
                                            color: TColor.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16),
                                      ),
                                      Spacer(),
                                      ImageWedgit(
                                        imageName: Icons.link_rounded,
                                        width: 30,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      ImageWedgit(
                                        imageName: Icons.edit_note_outlined,
                                        width: 30,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      ImageWedgit(
                                        imageName: Icons.delete_forever,
                                        width: 30,
                                      ),
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
                        itemCount: state.showAllFeaturesModel.data!.length),
                  );
                }
                else if(state is ProjectLoading)
                {
                  return const DoonloadWedgit();
                }
                print(state);
                return SizedBox();
              },
            )
            ,
            SizedBox(
              height: 18,
            ),
          ],
        ),
      ),
    );
  }
}

class DashBoardAddSection extends StatelessWidget {
  final String Name;
  final void Function()? onTap;
  final String imageName;
  const DashBoardAddSection({
    super.key,
    required this.Name,
    this.onTap,
    required this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                Name,
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
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45),
            child: Image(
              image: AssetImage(
                imageName,
              ),
              width: 30,
            ),
          ),
        )
      ],
    );
  }
}

class ImageWedgit extends StatelessWidget {
  final IconData imageName;
  final double width;
  const ImageWedgit({
    super.key,
    required this.imageName,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      imageName,
      size: width,
    );
  }
}
