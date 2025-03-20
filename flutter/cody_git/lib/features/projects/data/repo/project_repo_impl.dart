import 'package:cody/common%20wedgit/errors/failures.dart';
import 'package:cody/features/auth/data/models/LogInModel.dart';
import 'package:cody/features/auth/data/models/register_model.dart';
import 'package:cody/features/projects/data/models/projects/all_features_for_projects_model.dart';
import 'package:cody/features/projects/data/models/projects/create_project_model.dart';
import 'package:cody/features/projects/data/models/projects/deleate_project_model.dart';
import 'package:cody/features/projects/data/models/projects/get_faviorate_model.dart';
import 'package:cody/features/projects/data/models/projects/set_favorate_project.dart';
import 'package:cody/features/projects/data/models/projects/show_all_projects.dart';
import 'package:cody/features/projects/data/models/projects/show_project_detailes_model.dart';
import 'package:cody/features/projects/data/models/projects/update_project_model.dart';
import 'package:cody/features/projects/data/repo/project_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../../../common wedgit/api_servieses.dart';
import '../../../../common wedgit/servies_locator.dart';
import '../../../../main.dart';
import '../../../../utls/Shared pref helper/user_cache_helper.dart';

class ProjectsRepoImpl implements ProjectsRepo {
  final ApiService apiService;
  ProjectsRepoImpl(this.apiService);

  @override
  Future<Either<Failure, SetFavoraitProjectModel>> addyoFavorateProject({required int projectId})async {
    try {
      var data = await apiService.post (
          endPoint: 'project/set_favorite/$projectId',
         token: getIt.get<SharedPreferences>().getString('user') == null ?'':
         getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token!, query: {}
      );
      SetFavoraitProjectModel userInformation = SetFavoraitProjectModel.fromJson(data);
      print(userInformation);
      return Right(userInformation);
    } catch (e) {
      if (e is DioException) {
        print(e);
        return left(ServerFailure.fromDioException(e,{}));
      }
      print(e);
      return left(
        ServerFailure(
            e.toString(),{}
        ),
      );
    }
  }

  @override
  Future<Either<Failure, CreateProjectModel>> createProject({required String title, required String description, required String language}) async {
    try {
      var data = await apiService.post (
          endPoint: 'project/create',
          token: getIt.get<SharedPreferences>().getString('user') == null ?'':
          getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token!, query: {'title':title,'description':description,'language':language}
      );
      CreateProjectModel userInformation = CreateProjectModel.fromJson(data);
      print(userInformation);
      return Right(userInformation);
    } catch (e) {
      if (e is DioException) {
        print(e);
        return left(ServerFailure.fromDioException(e,{}));
      }
      print(e);
      return left(
        ServerFailure(
            e.toString(),{}
        ),
      );
    }
  }

  @override
  Future<Either<Failure, DeleateProjectModel>> deleateProject({required int projectId}) async {
    try {
      var data = await apiService.delete (
          endPoint: 'project/destroy/$projectId',
          token: getIt.get<SharedPreferences>().getString('user') == null ?'':
          getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token!, query: {}
      );
      DeleateProjectModel userInformation = DeleateProjectModel.fromJson(data);
      print(userInformation);
      return Right(userInformation);
    } catch (e) {
      if (e is DioException) {
        print(e);
        return left(ServerFailure.fromDioException(e,{}));
      }
      print(e);
      return left(
        ServerFailure(
            e.toString(),{}
        ),
      );
    }
  }

  @override
  Future<Either<Failure, AllFeaturesForProjectModel>> getAllFeaturesForProject({required int projectId}) async {
    try {
      var data = await apiService.get (
          endPoint: 'project/features/$projectId',
          token: getIt.get<SharedPreferences>().getString('user') == null ?'':
          getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token!,
      );
      AllFeaturesForProjectModel userInformation = AllFeaturesForProjectModel.fromJson(data);
      print(userInformation);
      return Right(userInformation);
    } catch (e) {
      if (e is DioException) {
        print(e);
        return left(ServerFailure.fromDioException(e,{}));
      }
      print(e);
      return left(
        ServerFailure(
            e.toString(),{}
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ShowAllProjectModel>> getAllProjects() async {
    try {
      var data = await apiService.get (
          endPoint: 'project/index',
          token: getIt.get<SharedPreferences>().getString('user') == null ?'':
          getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token!
      );
      ShowAllProjectModel userInformation = ShowAllProjectModel.fromJson(data);
      print(userInformation);
      return Right(userInformation);
    } catch (e) {
      if (e is DioException) {
        print(e);
        return left(ServerFailure.fromDioException(e,{}));
      }
      print(e);
      return left(
        ServerFailure(
            e.toString(),{}
        ),
      );
    }
  }

  @override
  Future<Either<Failure, GetFavoraitProjectModel>> getVavorateProject() async {
    try {
      var data = await apiService.get (
          endPoint: 'project/favorite',
          token: getIt.get<SharedPreferences>().getString('user') == null ?'':
          getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token!,
      );
      GetFavoraitProjectModel userInformation = GetFavoraitProjectModel.fromJson(data);
      print(userInformation);
      return Right(userInformation);
    } catch (e) {
      if (e is DioException) {
        print(e);
        return left(ServerFailure.fromDioException(e,{}));
      }
      print(e);
      return left(
        ServerFailure(
            e.toString(),{}
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ShowProjectDetailesModel>> showProjects({required int projectId}) async {
    try {
      var data = await apiService.get (
          endPoint: 'project/show/$projectId',
          token: getIt.get<SharedPreferences>().getString('user') == null ?'':
          getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token!,
      );
      ShowProjectDetailesModel userInformation = ShowProjectDetailesModel.fromJson(data);
      print(userInformation);
      return Right(userInformation);
    } catch (e) {
      if (e is DioException) {
        print(e);
        return left(ServerFailure.fromDioException(e,{}));
      }
      print(e);
      return left(
        ServerFailure(
            e.toString(),{}
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UpdateProjectModel>> updateProject({required int projectId, required String title, required String description, required String language}) async {
    try {
      var data = await apiService.post (
          endPoint: 'project/update/$projectId',
          token: getIt.get<SharedPreferences>().getString('user') == null ?'':
          getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token!, query: {'title':title,'description':description,'language':language}
      );
      UpdateProjectModel userInformation = UpdateProjectModel.fromJson(data);
      print(userInformation);
      return Right(userInformation);
    } catch (e) {
      if (e is DioException) {
        print(e);
        return left(ServerFailure.fromDioException(e,{}));
      }
      print(e);
      return left(
        ServerFailure(
            e.toString(),{}
        ),
      );
    }
  }

}

