import 'package:cody/common%20wedgit/doonload_wedgit.dart';
import 'package:cody/common%20wedgit/failed_wedgit.dart';
import 'package:cody/features/home/home_page.dart';
import 'package:cody/features/projects/data/models/projects/all_features_for_projects_model.dart';
import 'package:cody/features/projects/presintation/views%20bloc/features%20bloc/features_bloc.dart';
import 'package:cody/features/projects/presintation/views%20bloc/project%20bloc/project_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../common wedgit/api_servieses.dart';
import '../../../../constants/colo_extension.dart';
import '../../../../constants/names.dart';
import '../../../home/favorit_page.dart';
import 'package:cody/constants/styles.dart';

import '../../../home/wedgits/custtom_app_aseet_image.dart';

class FeaturesPag extends StatefulWidget {
  final int ProjectId;
  FeaturesPag({super.key, required this.ProjectId});

  @override
  State<FeaturesPag> createState() => _FeaturesPagState();
}

class _FeaturesPagState extends State<FeaturesPag> {
  final TextEditingController textEditingController = TextEditingController();
@override
  void initState() {
    BlocProvider.of<ProjectBloc>(context).add(getAllFeaturesForProject(widget.ProjectId));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CusstomAppSearchSetion(
                  textEditingController: textEditingController),
              BlocBuilder<ProjectBloc, ProjectState>(
                builder: (context, state) {
                  if (state is ProjectFailed) {
                    return FailedWedgit();
                  }
                  else if (state is AllFeaturesForProjectSuccess) {
                    return FeaturesSuccessBody(
                      state: state, ProjectId: widget.ProjectId,
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
            ],
          ),
        ),
      ),
    );
  }
}

class FeaturesSuccessBody extends StatelessWidget {
  final int ProjectId;
  final AllFeaturesForProjectSuccess state;
  const FeaturesSuccessBody({
    super.key,
    required this.state, required this.ProjectId,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: state.showAllProjectModel.data!.isEmpty? NoItemWedgit(
        text: 'Add a new feature',
        icon: Icons.dashboard_customize,
        onPressed: () async {
          await GoRouter.of(context).pushNamed(Names.FeatureDashBoard,extra:ProjectId );
          BlocProvider.of<ProjectBloc>(context).add(getAllFeaturesForProject(ProjectId));
        }
      )
    :ListView.separated(
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      state.showAllProjectModel.data![index].title!,
                      style:
                          Styles.kFontSize18.copyWith(fontWeight: FontWeight.w600),
                    ),
                    NoItemWedgit(
                        text: '',
                        icon: Icons.dashboard_customize,
                        onPressed: () async {
                          await GoRouter.of(context)
                              .pushNamed(Names.FeatureDashBoard,extra:ProjectId );}
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 200,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index1) {
                        return PagesCard(
                          state:state.showAllProjectModel.data![index].pages![index1],
                          index: index1,
                          onTap: () {
                            GoRouter.of(context).pushNamed(Names.CodeParts, extra: state.showAllProjectModel.data![index].pages![index1].id);
                          },
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            width: 15,
                          ),
                      itemCount:  state.showAllProjectModel.data![index].pages!.length
                      // state
                      //     .showAllProjectModel.data![index].pages!.length
                  ),
                )
              ],
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 15),
          itemCount: state.showAllProjectModel.data!.length),
    );
  }
}

class PagesCard extends StatelessWidget {
  final void Function()? onTap;
  final int index;
  final Pages state;
  const PagesCard({
    super.key,
    this.onTap,
    required this.index, required this.state,
  });

  @override
  Widget build(BuildContext context) {
    bool num = index % 2 == 0;
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: num ? TColor.secondaryColor2 : TColor.secondaryColor1),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CusttomAppNetWorkImage(
                  image:'${imageBaseUrl}media/88/vecteezy_robot-chatbot-aesthetic_25271430.png',
                     // 'assets/img/vecteezy_robot-chatbot-aesthetic_25271430.png',
                  width: 90),
              Spacer(),
              Text(
                state.title!,
                style: Styles.kFontSize16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
