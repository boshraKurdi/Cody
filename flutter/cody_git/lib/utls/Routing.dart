import 'package:cody/features/auth/data/reop/register_repo.dart';
import 'package:cody/features/chat/data/repo/chat_repo_impl.dart';
import 'package:cody/features/chat/presintation/views/chat_page.dart';
import 'package:cody/features/projects/data/repo/code_repo_impl.dart';
import 'package:cody/features/projects/data/repo/features_repo_impl.dart';
import 'package:cody/features/projects/data/repo/project_repo_impl.dart';
import 'package:cody/features/projects/presintation/veiws/feature_dashboadd.dart';
import 'package:cody/features/projects/presintation/veiws/features_page.dart';
import 'package:cody/features/projects/presintation/views%20bloc/features%20bloc/features_bloc.dart';
import 'package:cody/features/projects/presintation/views%20bloc/pages%20bloc/pages_bloc.dart';
import 'package:cody/features/start%20app/presintation/views/splash_view.dart';
import 'package:cody/features/start%20app/presintation/views/start_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../common wedgit/api_servieses.dart';
import '../common wedgit/servies_locator.dart';
import '../constants/names.dart';
import '../features/auth/Presintation/views bloc/Auth bloc/auth_bloc.dart';
import '../features/auth/Presintation/views/login_page.dart';
import '../features/auth/Presintation/views/register_page.dart';
import '../features/auth/data/reop/register_repo_impl.dart';
import '../features/chat/presintation/views bloc/chat_bloc.dart';
import '../features/chat/presintation/views bloc/create session/create_session_bloc.dart';
import '../features/chat/presintation/views/wedgits/add_to_an_exested_project_message.dart';
import '../features/chat/presintation/views/wedgits/features_and_pages.dart';
import '../features/projects/presintation/veiws/add_new_obj.dart';
import '../features/chat/presintation/views/wedgits/add_new_project_form.dart';
import '../features/dashboade/ProjectDashboard.dart';
import '../features/projects/data/models/projects/all_features_for_projects_model.dart';
import '../features/projects/data/repo/pages_repo_impl.dart';
import '../features/projects/presintation/veiws/add_new_fatures_page.dart';
import '../features/projects/presintation/veiws/code_parts.dart';
import '../features/projects/presintation/veiws/page_dashboard.dart';
import '../features/projects/presintation/veiws/project_detailes.dart';
import '../features/projects/presintation/views bloc/code bloc/code_bloc.dart';
import '../features/projects/presintation/views bloc/project bloc/project_bloc.dart';
import '../features/start app/presintation/views/nav_page.dart';
import '../features/start app/presintation/views/secound_start_page.dart';
import '../features/start app/presintation/views_blocs/buttom navigation bloc/buttom_navigation_bar_bloc.dart';

class AppRouter {
  // static  Exercise? extraExercies;
  // static int? extraindex;
  static Map<String, dynamic>? queryParam;
  static List<dynamic>? ExercisesStepDetailsParam;
  static List<dynamic>? listExtra;

  AppRouter();

  static final generateRoute = GoRouter(
      redirect: (context, state) {
        if (state.matchedLocation == Names.AddNewProjectPage ||
            state.matchedLocation == Names.AddNewFeaturePage ||state.matchedLocation == Names.FeaturesAndPagesPage) {
          //extraExercies = state.extra as Exercise?;
          // extraindex = state.extra as int;
          queryParam = state.extra as Map<String, dynamic>;
        }
      },
      routes: [
        GoRoute(
          path: Names.StatedPage,
          name: Names.StatedPage,
          builder: (context, state) => StartedPage(),
        ),
        GoRoute(
          path: Names.RegisterPage,
          name: Names.RegisterPage,
          builder: (context, state) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => showBloc(),
              ),
              BlocProvider(
                create: (context) => AuthBloc(getIt.get<AuthImpl>()),
              ),
            ],
            child: RegisterPage(),
          ),
        ),
        GoRoute(
          path: Names.LogIn,
          name: Names.LogIn,
          builder: (context, state) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => showBloc(),
              ),
              BlocProvider(
                create: (context) => AuthBloc(getIt.get<AuthImpl>()),
              ),
            ],
            child: LogInPage(),
          ),
        ),
        GoRoute(
          path: Names.CodeParts,
          name: Names.CodeParts,
          builder: (context, state) => BlocProvider(
            create: (context) => PagesBloc(getIt.get<PagesRepoImpl>()),
            child: CodeParts(
              pageId: state.extra as int,
            ),
          ),
        ),

        GoRoute(
          path: Names.ProjectDetailes,
          name: Names.ProjectDetailes,
          builder: (context, state) => BlocProvider(
            create: (context) => ProjectBloc(getIt.get<ProjectsRepoImpl>())
              ..add(showProjects(state.extra as int)),
            child: ProjectDetailes(),
          ),
        ),
        GoRoute(
          path: Names.FeaturesPage,
          name: Names.FeaturesPage,
          builder: (context, state) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    FeaturesBloc(getIt.get<FeaturesRepoImpl>()),
              ),
              BlocProvider(
                create: (context) => PagesBloc(getIt.get<PagesRepoImpl>()),
              ),
              BlocProvider(
                create: (context) => ProjectBloc(getIt.get<ProjectsRepoImpl>()),
              ),
            ],
            child: FeaturesPag(
              ProjectId: state.extra as int,
            ),
          ),
        ),
        GoRoute(
          path: Names.SplashView,
          name: Names.SplashView,
          builder: (context, state) => SplashView(),
        ),

        GoRoute(
          path: Names.PageDashBoard,
          name: Names.PageDashBoard,
          builder: (context, state) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    FeaturesBloc(getIt.get<FeaturesRepoImpl>()),
              ),
            ],
            child: PageDashBoard(
               FeatureId: state.extra as int,
            ),
          ),
        ),
        GoRoute(
          path: Names.DashboardPage,
          name: Names.DashboardPage,
          builder: (context, state) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => CodeBloc(getIt.get<CodesRepoImpl>()),
              ),
              BlocProvider(
                create: (context) => ProjectBloc(getIt.get<ProjectsRepoImpl>()),
              ),
            ],
            child: DashboardPage(),
          ),
        ),
        GoRoute(
          path: Names.FeatureDashBoard,
          name: Names.FeatureDashBoard,
          builder: (context, state) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => CodeBloc(getIt.get<CodesRepoImpl>()),
              ),
              BlocProvider(
                create: (context) => ProjectBloc(getIt.get<ProjectsRepoImpl>()),
              ),
              BlocProvider(
                create: (context) =>
                    FeaturesBloc(getIt.get<FeaturesRepoImpl>()),
              ),
            ],
            child: FeatureDashBoard(
              ProjectId: state.extra as int,
            ),
          ),
        ),
        GoRoute(
          path: Names.AddToAnExextedProjectMessage,
          name: Names.AddToAnExextedProjectMessage,
          builder: (context, state) => MultiBlocProvider(
            providers: [

              BlocProvider(
                create: (context) => ProjectBloc(getIt.get<ProjectsRepoImpl>()),
              ),
            ],
            child: AddToAnExextedProjectMessage(codeMessage: state.extra as String,),
          ),
        ),
        //FeaturesAndPagesPage
        GoRoute(
          path: Names.FeaturesAndPagesPage,
          name: Names.FeaturesAndPagesPage,
          builder: (context, state) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => CodeBloc(getIt.get<CodesRepoImpl>()),
              ),
              BlocProvider(
                create: (context) => ProjectBloc(getIt.get<ProjectsRepoImpl>()),
              ),
              BlocProvider(
                create: (context) =>
                    FeaturesBloc(getIt.get<FeaturesRepoImpl>()),
              ),
            ],
            //Mycode: state.extra as String,
            child: FeaturesAndPagesPage(codeMessage: queryParam!['codeMessage'] as String, ProjectId:queryParam!['ProjectId'] ,),
          ),
        ),
        GoRoute(
          path: Names.AddNewProjectForm,
          name: Names.AddNewProjectForm,
          builder: (context, state) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => CodeBloc(getIt.get<CodesRepoImpl>()),
              ),
            ],
            //Mycode: state.extra as String,
            child: AddNewProjectForm(codeMessage: state.extra as String,),
          ),
        ),
        //
        //
        GoRoute(
          path: Names.SecoundStartedPage,
          name: Names.SecoundStartedPage,
          builder: (context, state) => SecoundStartedPage(),
        ),
        GoRoute(
          path: Names.ChatPage,
          name: Names.ChatPage,
          builder: (context, state) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => ChatBloc(getIt.get<ChatRepoImpl>()),
              ),
              BlocProvider(
                create: (context) =>
                    CreateSessionBloc(getIt.get<ChatRepoImpl>()),
              ),
            ],
            child: ChatPage(),
          ),
        ),
        GoRoute(
          path: Names.MainTabPage,
          name: Names.MainTabPage,
          builder: (context, state) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => ButtomNavigationBarBloc(),
              ),
              BlocProvider(
                create: (context) => ProjectBloc(getIt.get<ProjectsRepoImpl>())
                  ..add(getAllProjects()),
              ),
            ],
            child: NavPage(),
          ),
        ),
        GoRoute(
          path: Names.AddNewProjectPage,
          name: Names.AddNewProjectPage,
          builder: (context, state) => BlocProvider(
            create: (context) => ProjectBloc(getIt.get<ProjectsRepoImpl>()),
            child: AddNewProjectPage(
                completeKey: queryParam!['completeKey'],
                textControllers: queryParam!['textControllers'],
                text1: queryParam!['text1'],
                text2: queryParam!['text2'],
                text3: queryParam!['text3'],
                iConData1: queryParam!['iConData1'],
                iConData2: queryParam!['iConData2'],
                iConData3: queryParam!['iConData3'],
                title: queryParam!['title']),
          ),
        ),
        GoRoute(
          path: Names.AddNewFeaturePage,
          name: Names.AddNewFeaturePage,
          builder: (context, state) => BlocProvider(
            create: (context) => FeaturesBloc(getIt.get<FeaturesRepoImpl>()),
            child: AddNewFeaturePage(
              completeKey: queryParam!['completeKey'],
              textControllers: queryParam!['textControllers'],
              text1: queryParam!['text1'],
              text2: queryParam!['text2'],
              text3: queryParam!['text3'],
              iConData1: queryParam!['iConData1'],
              iConData2: queryParam!['iConData2'],
              iConData3: queryParam!['iConData3'],
              title: queryParam!['title'],
              projectId: queryParam!['projectId'],
            ),
          ),
        ),
        // GoRoute(path: Names.AddNewPagePage,
        //   name: Names.AddNewPagePage,
        //   builder: (context, state) =>
        //       AddNewPagePage(),),
      ]);
  //AddNewProjectPage
// GoRoute(path:Names.OnBoardingPage ,name:Names.OnBoardingPage ,builder: (context, state) => const OnBoardingView(),),
// GoRoute(path: Names.LogIn ,name:Names.LogIn ,builder: (context, state) => const LoginView(),),
// GoRoute(path:Names.SignUp,name:Names.SignUp ,builder: (context, state) => const SignUpView(),),
// GoRoute(path: Names.homePage ,name:Names.homePage ,builder: (context, state) => HomeView(),)
}
