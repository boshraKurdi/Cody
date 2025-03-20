import 'package:cody/common%20wedgit/custtom_search_text_feild.dart';
import 'package:cody/constants/colo_extension.dart';
import 'package:cody/constants/names.dart';
import 'package:cody/features/home/wedgits/ProjectCard.dart';
import 'package:cody/features/home/wedgits/cody_message_wedgit.dart';
import 'package:cody/features/home/wedgits/custtom_app_aseet_image.dart';
import 'package:cody/features/home/wedgits/custtom_app_bar.dart';
import 'package:cody/features/home/wedgits/lastedProjectCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cody/constants/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../common wedgit/doonload_wedgit.dart';
import '../../common wedgit/failed_wedgit.dart';
import '../projects/presintation/views bloc/project bloc/project_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController textEditingController = TextEditingController();
  @override
  initState() {
    super.initState();
    BlocProvider.of<ProjectBloc>(context).add(getAllProjects());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: HomePageBody(textEditingController: textEditingController)),
    );
  }
}

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    super.key,
    required this.textEditingController,
  });

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                borderRadius: BorderRadius.only(topRight: Radius.circular(100)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 24),
                    child: Text(
                      'Your Latest Projects :',
                      style: Styles.kFontSize20,
                    ),
                  ),
                  BlocBuilder<ProjectBloc, ProjectState>(
                    builder: (context, state) {
                      if (state is ProjectFailed) {
                        return FailedWedgit();
                      }
                      if(state is GetAllProjectSuccess)
                      {  if (state.showAllProjectModel.data!.isEmpty) {
                        return NoItemWedgit(
                          text: 'Add a new project',
                          icon: Icons.dashboard_customize,
                          onPressed: () async {
                            await GoRouter.of(context)
                                .pushNamed(Names.DashboardPage);
                            BlocProvider.of<ProjectBloc>(context)
                                .add(getAllProjects());
                          },
                        );
                      }
                      return Expanded(
                          child: ListView.builder(
                            itemCount: state.showAllProjectModel.data!.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(onTap: () {
                                GoRouter.of(context)
                                    .pushNamed(Names.ProjectDetailes ,extra:state.showAllProjectModel.data![index].id);
                              },child: LatestProjectCard(state: state, index: index,));
                            },
                          ));
                      }
                      return DoonloadWedgit();
                    },
                  )
                ],
              ),
            )),
        Positioned(
            top: 0,
            child: ClipRRect(
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
                                child: CusttomAppAssetImage(
                                  image:
                                      'assets/img/settings-2-svgrepo-com.png',
                                  width: 40,
                                )),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 24),
                      child: Row(
                        children: [
                          Text(
                            'Your Projects',
                            style: Styles.kFontSize20,
                          ),
                          IconButton(
                            color: TColor.primaryColor2,
                            icon: Icon(Icons.create_new_folder),
                            onPressed: () {
                              GoRouter.of(context)
                                  .pushNamed(Names.DashboardPage);
                            },
                          )
                        ],
                      ),
                    ),
                    BlocBuilder<ProjectBloc, ProjectState>(
                      builder: (context, state) {
                        if (state is ProjectFailed) {
                          return FailedWedgit();
                        }
                        else if (state is GetAllProjectSuccess) {
                          if (state.showAllProjectModel.data!.isEmpty) {
                            return NoItemWedgit(
                              text: 'Add a new project',
                              icon: Icons.dashboard_customize,
                              onPressed: () async {
                                await GoRouter.of(context)
                                    .pushNamed(Names.DashboardPage);
                                BlocProvider.of<ProjectBloc>(context)
                                    .add(getAllProjects());
                              },
                            );
                          }
                          return Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16.0, horizontal: 37),
                              child: GridView.builder(
                                itemCount:
                                    state.showAllProjectModel.data!.length,
                                gridDelegate:
                                    SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 200,
                                        mainAxisExtent: 200,
                                        crossAxisSpacing: 25,
                                        mainAxisSpacing: 25),
                                itemBuilder: (BuildContext context, int index) {
                                  return ProjectCard(
                                    onTap: () {
                                      GoRouter.of(context)
                                          .pushNamed(Names.ProjectDetailes ,extra:state.showAllProjectModel.data![index].id);
                                    },
                                    state: state,
                                    index: index,
                                  );
                                },
                              ),
                            ),
                          );
                        }
                        return DoonloadWedgit();
                      },
                    )
                  ],
                ),
              ),
            )),
      ],
    );
  }
}



class NoItemWedgit extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? onPressed;
  const NoItemWedgit({
    super.key,
    required this.text,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          color: TColor.primaryColor2,
          icon: Icon(icon),
          onPressed: onPressed,
        ),
        SizedBox(
          width: 25,
        ),
        Text(
          text,
          style: Styles.kFontSize16,
        )
      ],
    ));
  }
}
