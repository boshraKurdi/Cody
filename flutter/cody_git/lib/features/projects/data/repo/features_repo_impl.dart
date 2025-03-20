import 'package:cody/common%20wedgit/errors/failures.dart';
import 'package:cody/features/auth/data/models/LogInModel.dart';
import 'package:cody/features/auth/data/models/register_model.dart';
import 'package:cody/features/projects/data/models/feature/create_feature_model.dart';
import 'package:cody/features/projects/data/models/feature/deleate_feature_model.dart';
import 'package:cody/features/projects/data/models/feature/get_features_pages_model.dart';
import 'package:cody/features/projects/data/models/feature/show_features_model.dart';
import 'package:cody/features/projects/data/models/feature/update_feature_model.dart';
import 'package:cody/features/projects/data/models/projects/all_features_for_projects_model.dart';
import 'package:cody/features/projects/data/models/projects/create_project_model.dart';
import 'package:cody/features/projects/data/models/projects/deleate_project_model.dart';
import 'package:cody/features/projects/data/models/projects/get_faviorate_model.dart';
import 'package:cody/features/projects/data/models/projects/set_favorate_project.dart';
import 'package:cody/features/projects/data/models/projects/show_all_projects.dart';
import 'package:cody/features/projects/data/models/projects/show_project_detailes_model.dart';
import 'package:cody/features/projects/data/models/projects/update_project_model.dart';
import 'package:cody/features/projects/data/repo/featured%20repo.dart';
import 'package:cody/features/projects/data/repo/project_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../../../common wedgit/api_servieses.dart';
import '../../../../common wedgit/servies_locator.dart';
import '../../../../main.dart';
import '../../../../utls/Shared pref helper/user_cache_helper.dart';

class FeaturesRepoImpl implements FeaturesRepo {
  final ApiService apiService;
  FeaturesRepoImpl(this.apiService);

  @override
  Future<Either<Failure, CreateFeatureModel>> createFeature({required String title, required String description, required int project_id}) async {
    try {
      var data = await apiService.post (
          endPoint: 'feature/create',
          token: getIt.get<SharedPreferences>().getString('user') == null ?'':
          getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token!, query: {'title':title,'description':description,'project_id':project_id}
      );
      CreateFeatureModel userInformation = CreateFeatureModel.fromJson(data);
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
  Future<Either<Failure, DelateFeatureModel>> deleateFeature({required int FeatureId}) async {
    try {
      var data = await apiService.delete (
          endPoint: 'feature/destroy/$FeatureId',
          token: getIt.get<SharedPreferences>().getString('user') == null ?'':
          getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token!, query: {}
      );
      DelateFeatureModel userInformation = DelateFeatureModel.fromJson(data);
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
  Future<Either<Failure, GetFeaturePageModel>> getAllPages({required int FeatureId}) async {
    try {
      var data = await apiService.get (
          endPoint: 'feature/pages/$FeatureId',
          token: getIt.get<SharedPreferences>().getString('user') == null ?'':
          getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token!,
      );
      GetFeaturePageModel userInformation = GetFeaturePageModel.fromJson(data);
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
  Future<Either<Failure, ShowFeatureModel>> showFeatures({required int FeatureId}) async {
    try {
      var data = await apiService.get (
          endPoint: 'feature/show/$FeatureId',
          token:getIt.get<SharedPreferences>().getString('user') == null ?'':
          getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token!
      );
      ShowFeatureModel userInformation = ShowFeatureModel.fromJson(data);
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
  Future<Either<Failure, UpdateFeatureModel>> uodateFeature({required String title, required String description, required int FeatureId, required int project_id}) async {
    try {
      var data = await apiService.post (
          endPoint: 'feature/update/$FeatureId',
          token: getIt.get<SharedPreferences>().getString('user') == null ?'':
          getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token!, query: {'title':title,'description':description,'project_id':project_id}
      );
      UpdateFeatureModel userInformation = UpdateFeatureModel.fromJson(data);
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

