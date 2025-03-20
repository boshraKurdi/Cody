
import 'package:cody/features/chat/data/repo/chat_repo_impl.dart';
import 'package:cody/features/projects/data/repo/code_repo_impl.dart';
import 'package:cody/features/projects/data/repo/features_repo_impl.dart';
import 'package:cody/features/projects/data/repo/pages_repo_impl.dart';
import 'package:cody/features/projects/data/repo/project_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../features/auth/data/models/register_model.dart';
import '../features/auth/data/reop/register_repo_impl.dart';
import '../utls/Shared pref helper/user_cache_helper.dart';
import 'api_servieses.dart';


final getIt = GetIt.instance;
  setUp() {
    getIt.registerSingleton<ApiService>(ApiService(Dio()));
    getIt.registerSingleton<AuthImpl>(AuthImpl(getIt.get<ApiService>()));
    getIt.registerSingleton<ProjectsRepoImpl>(ProjectsRepoImpl(getIt.get<ApiService>()));
    getIt.registerSingleton<FeaturesRepoImpl>(FeaturesRepoImpl(getIt.get<ApiService>()));
    getIt.registerSingleton<PagesRepoImpl>(PagesRepoImpl(getIt.get<ApiService>()));
    getIt.registerSingleton<CodesRepoImpl>(CodesRepoImpl(getIt.get<ApiService>()));
    getIt.registerSingleton<ChatRepoImpl>(ChatRepoImpl(getIt.get<ApiService>()));
    
//     getIt.registerSingleton<SportNetworkDataImpl>(SportNetworkDataImpl(apiService: getIt.get<ApiService>()));
//     getIt.registerSingleton<SportLocalDataImpl>(SportLocalDataImpl());
//     getIt.registerSingleton<NetworkInfoImpl>(NetworkInfoImpl(InternetConnectionChecker()));
//
//
//     getIt.registerSingleton<RemoteDateDatasourseImpl>(RemoteDateDatasourseImpl(getIt.get<ApiService>()));
//     getIt.registerSingleton<LocalDateDataSourseImpl>(LocalDateDataSourseImpl());
//     getIt.registerSingleton<GoalsRepoImpl>(GoalsRepoImpl(getIt.get<ApiService>(),SportNetworkDataImpl(apiService: getIt.get<ApiService>()),SportLocalDataImpl(),getIt.get<NetworkInfoImpl>()
//         , getIt.get<RemoteDateDatasourseImpl>(),getIt.get<LocalDateDataSourseImpl>()));
//     getIt.registerSingleton<PlansRepoImpl>(PlansRepoImpl(getIt.get<ApiService>(),SportNetworkDataImpl(apiService: getIt.get<ApiService>()),SportLocalDataImpl(),getIt.get<NetworkInfoImpl>(), getIt.get<RemoteDateDatasourseImpl>(),getIt.get<LocalDateDataSourseImpl>()));
//     // getIt.registerSingleton<LastUpdateDatabaseRepoImpl>(LastUpdateDatabaseRepoImpl(
//     //   apiService: getIt.get<ApiService>(), remoteDateDatasourse: getIt.get<RemoteDateDatasourseImpl>(),
//     //   localDateDataSourse: getIt.get<LocalDateDataSourseImpl>(), networkInfo:getIt.get<NetworkInfoImpl>(),)
//   //  );
//   }
//

}
firstRun() async {
  // bool firstRun = await IsFirstRun.isFirstRun();
  final prefs = await SharedPreferences.getInstance();
  UserCacheHelper cacheHelper = UserCacheHelper();
//  getIt.registerSingleton<bool>(firstRun);
  getIt.registerSingleton<SharedPreferences>(prefs);
  getIt.registerSingleton<UserCacheHelper>(cacheHelper);
  if (getIt.get<SharedPreferences>().getString('user') != null) {
    RegisterModel? user = await getIt.get<UserCacheHelper>().getUserCache(
        'user');
    getIt.registerSingleton<RegisterModel>(user);
  }
}