import 'package:cody/common%20wedgit/doonload_wedgit.dart';
import 'package:cody/common%20wedgit/failed_wedgit.dart';
import 'package:cody/constants/colo_extension.dart';
import 'package:cody/constants/styles.dart';
import 'package:cody/features/projects/presintation/veiws/project_detailes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/home_page.dart';
import '../../../home/wedgits/custtom_app_aseet_image.dart';
import 'package:cody/features/projects/data/models/pages/get_all_code_for_page_model.dart';
import '../views bloc/features bloc/features_bloc.dart';
import '../views bloc/pages bloc/pages_bloc.dart';

class CodeParts extends StatefulWidget {
  final int pageId;
  const CodeParts({
    super.key,
    required this.pageId,
  });

  @override
  State<CodeParts> createState() => _CodePartsState();
}

class _CodePartsState extends State<CodeParts> {
  @override
  void initState() {
    BlocProvider.of<PagesBloc>(context)
        .add(getAllCodeForPageEvent(widget.pageId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CusstomAppCodyAppBar(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                textAlign: TextAlign.center,
                'That is Your Messages With Me That You Choose to Use ,Are you Happy .',
                style: Styles.kFontSize16,
              ),
            ),
            BlocBuilder<PagesBloc, PagesState>(
              builder: (context, state) {
                if (state is GetAllCodeFoePageSuccess) {
                  return Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return MessageViewCard(
                              index: index,
                              page: state.showAllPagesModel.data![index],
                            );
                          },
                          separatorBuilder: (context, index) => SizedBox(
                                height: 15,
                              ),
                          itemCount: state.showAllPagesModel.data!.length));
                } else if (state is PagesFailed) {
                  return FailedWedgit();
                }
                return DoonloadWedgit();
              },
            )
          ],
        ),
      ),
    );
  }
}

class MessageViewCard extends StatelessWidget {
  final Data page;
  final int index;
  const MessageViewCard({
    super.key,
    required this.index,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    bool num = index % 2 == 0;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: num ? TColor.secondaryColor2 : TColor.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 1, color: TColor.blueColor)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    color: TColor.blueColor,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CusttomAppAssetImage(
                        image:
                            'assets/img/vecteezy_robot-chatbot-aesthetic_25271430.png',
                        width: 40),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  page.title!,
                  style:
                      Styles.kFontSize16.copyWith(color: TColor.primaryColor3),
                ),

              ],
            ),
            Text(
              page.description!,
              style:
              Styles.kFontSize12.copyWith(fontWeight: FontWeight.normal),
            ),
            Text(
              page.code!,
              style: Styles.kFontSize16.copyWith(fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
