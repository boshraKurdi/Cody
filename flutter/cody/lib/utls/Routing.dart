import 'package:cody/features/chat/chat_page.dart';
import 'package:cody/features/projects/features_page.dart';
import 'package:cody/features/start%20app/presintation/views/splash_view.dart';
import 'package:cody/features/start%20app/presintation/views/start_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../constants/names.dart';
import '../features/auth/views bloc/Auth bloc/auth_bloc.dart';
import '../features/auth/views/login_page.dart';
import '../features/auth/views/register_page.dart';
import '../features/projects/code_parts.dart';
import '../features/projects/project_detailes.dart';
import '../features/start app/presintation/views/nav_page.dart';
import '../features/start app/presintation/views/secound_start_page.dart';
import '../features/start app/presintation/views_blocs/buttom navigation bloc/buttom_navigation_bar_bloc.dart';

class AppRouter {
  // static  Exercise? extraExercies;
  // static int? extraindex;
  static Map<String, int>? queryParam;
  static List<dynamic>? ExercisesStepDetailsParam;
  static List<dynamic>? listExtra;

  AppRouter();

  static final generateRoute = GoRouter(

      redirect: (context, state) {
        // if( state.matchedLocation == Names.showExercies)
        //   {
        //     //extraExercies = state.extra as Exercise?;
        //     // extraindex = state.extra as int;
        //     queryParam = state.extra as Map<String,int>;
        //     if(getIt.get<SharedPreferences>().getString('user') == null || getIt.get<SharedPreferences>().getString('user')!.isEmpty)
        //     {
        //       return Names.SignUp;
        //     }
        //     else{
        //       return Names.ExerciesOfPlans;
        //     }
        //   }
      },

      routes: [
        GoRoute(path: Names.StatedPage,
          name: Names.StatedPage,
          builder: (context, state) =>
              StartedPage(),),
        GoRoute(path: Names.RegisterPage,
          name: Names.RegisterPage,
          builder: (context, state) =>
              BlocProvider(
                create: (context) => showBloc(),
                child: RegisterPage(),
              ),),
        GoRoute(path: Names.LogIn,
          name: Names.LogIn,
          builder: (context, state) =>
              BlocProvider(
                create: (context) => showBloc(),
                child: LogInPage(),
              ),),
        GoRoute(path: Names.CodeParts,
          name: Names.CodeParts,
          builder: (context, state) =>
              CodeParts(),),

        GoRoute(path: Names.ProjectDetailes,
          name: Names.ProjectDetailes,
          builder: (context, state) =>
              ProjectDetailes(),),
        GoRoute(path: Names.FeaturesPage,
          name: Names.FeaturesPage,
          builder: (context, state) =>
              FeaturesPag(),),
        GoRoute(path: Names.SplashView,
          name: Names.SplashView,
          builder: (context, state) =>
              SplashView(),),
        GoRoute(path: Names.SecoundStartedPage,
          name: Names.SecoundStartedPage,
          builder: (context, state) =>
              SecoundStartedPage(),),
        GoRoute(path: Names.ChatPage,
          name: Names.ChatPage,
          builder: (context, state) =>
              ChatPage(),),
        GoRoute(path: Names.MainTabPage,
          name: Names.MainTabPage,
          builder: (context, state) =>
              BlocProvider(
                create: (context) => ButtomNavigationBarBloc(),
                child: NavPage(),
              ),)
      ]);
// GoRoute(path:Names.OnBoardingPage ,name:Names.OnBoardingPage ,builder: (context, state) => const OnBoardingView(),),
// GoRoute(path: Names.LogIn ,name:Names.LogIn ,builder: (context, state) => const LoginView(),),
// GoRoute(path:Names.SignUp,name:Names.SignUp ,builder: (context, state) => const SignUpView(),),
// GoRoute(path: Names.homePage ,name:Names.homePage ,builder: (context, state) => HomeView(),)


}

