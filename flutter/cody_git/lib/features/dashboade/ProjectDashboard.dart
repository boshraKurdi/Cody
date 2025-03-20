import 'package:cody/common%20wedgit/bottom_snackbar_message.dart';
import 'package:cody/common%20wedgit/servies_locator.dart';
import 'package:cody/constants/names.dart';
import 'package:cody/features/projects/presintation/veiws/add_new_obj.dart';
import 'package:cody/features/chat/presintation/views/wedgits/add_new_project_form.dart';
import 'package:cody/features/chat/presintation/views/wedgits/add_page_or_feature_wedgit.dart';
import 'package:cody/features/home/home_page.dart';
import 'package:cody/features/home/wedgits/custtom_app_bar.dart';
import 'package:cody/features/projects/presintation/views%20bloc/project%20bloc/project_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../common wedgit/doonload_wedgit.dart';
import '../../common wedgit/failed_wedgit.dart';
import '../../common wedgit/show_dialoge_messeage.dart';
import '../../constants/colo_extension.dart';
import '../home/wedgits/lastedProjectCard.dart';
import '../projects/data/models/projects/show_all_projects.dart';
import '../projects/data/repo/project_repo_impl.dart';
import '../projects/presintation/views bloc/code bloc/code_bloc.dart';

class DashboardPage extends StatefulWidget {

  DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  @override
  initState() {
    super.initState();
    BlocProvider.of<ProjectBloc>(context).add(getAllProjects());
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
              Name: 'Your Dashboard',
              imageName: 'assets/img/add-folder-svgrepo-com.png',
              onTap: () async {
          await      GoRouter.of(context).pushNamed(Names.AddNewProjectPage,extra: {
                  'completeKey': completeKey,
                  'textControllers': textEditingController,
                  'text1': 'Add Project Name',
                  'text2': 'Add Project Description',
                  'text3': 'Add Project Languge',
                  'iConData1': Icons.wallet_travel,
                  'iConData2': Icons.text_format,
                  'iConData3': Icons.language,
                  'title': 'Create Project'});
          BlocProvider.of<ProjectBloc>(context).add(getAllProjects());
              },
            ),
            SizedBox(
              height: 60,
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
                return  ProjectDashboardLineSuccess(state: state, ProjectId: state.showAllProjectModel,);
                }
                return DoonloadWedgit();
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

class ProjectDashboardLineSuccess extends StatelessWidget {
  final GetAllProjectSuccess state;
  final ShowAllProjectModel ProjectId;
  const ProjectDashboardLineSuccess({
    super.key, required this.state, required this.ProjectId,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) {
            return Container(
              //  height: 100,
              width: MediaQuery.of(context).size.width,
              child: InkWell(onTap: () {
                 GoRouter.of(context)
                    .pushNamed(Names.FeatureDashBoard,extra:ProjectId.data![index].id );
              },child: Column(
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
                          state.showAllProjectModel.data![index].title!,
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
              ),),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            height: 40,
          ),
          itemCount: state.showAllProjectModel.data!.length),
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
  final void Function()? onTap;
  final double width;
  const ImageWedgit({
    super.key,
    required this.imageName,
    required this.width, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap,
      child: Icon(
        imageName,
        size: width,
      ),
    );
  }
}
