
import 'package:cody/common%20wedgit/errors/failures.dart';

import 'package:cody/features/projects/data/models/code/add_code_to_a_new_project_model.dart';

import 'package:cody/features/projects/data/models/code/add_code_to_an_exested_page_model.dart';

import 'package:cody/features/projects/data/models/code/add_code_to_an_new_page_with_an_existed_feature_model.dart';

import 'package:cody/features/projects/data/models/code/add_code_to_an_newpage_and_new_feature_model.dart';

import 'package:cody/features/projects/data/models/code/show_code_model.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common wedgit/api_servieses.dart';
import '../../../../common wedgit/servies_locator.dart';
import '../../../../main.dart';
import '../../../../utls/Shared pref helper/user_cache_helper.dart';
import 'code_repo.dart';

class CodesRepoImpl implements CodesRepo {
  final ApiService apiService;
  CodesRepoImpl(this.apiService);

  @override
  Future<Either<Failure, AddCodeToAnExecitedPageModel>> addCodeToAnExistingPage({required String title, required String code, required String description, required String page_id}) async {
    try {
      var data = await apiService.post (
          endPoint: 'code/new-project/add-code',
          token: getIt.get<SharedPreferences>().getString('user') == null ?'':
          getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token!, query: {'title':title,'description':description,'page_id':page_id,'code':code}
      );
      AddCodeToAnExecitedPageModel userInformation = AddCodeToAnExecitedPageModel.fromJson(data);
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
  Future<Either<Failure, AddCodeToAnNewPageWithExistedFeatureModel>> addCodeToAnNewPageWithAnExectingFeature({required String page_title, required String code_title, required String code_description, required String page_description, required String code_content, required int FeatuerId, required int ProjectId}) async {
    try {
      var data = await apiService.post (
          endPoint: 'code/$ProjectId/existing-feature/$FeatuerId/new-page/add-code',
          token: getIt.get<SharedPreferences>().getString('user') == null ?'':
          getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token!, query: {'page_title':page_title,'code_title':code_title,'code_description':code_description,'page_description':page_description,'code_content':code_content}
      );
      AddCodeToAnNewPageWithExistedFeatureModel userInformation = AddCodeToAnNewPageWithExistedFeatureModel.fromJson(data);
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
  Future<Either<Failure, AddCodeToAnNewPageAndNewFeatureModel>> addCodeToAnNewPageWithAnNewFeature({required String feature_title, required String page_title, required String code_title, required String code_description, required String code_content, required String page_description, required String feature_description, required int projectId}) async {
    try {
      var data = await apiService.post (
          endPoint: 'code/$projectId/new-feature/add-code',
          token: getIt.get<SharedPreferences>().getString('user') == null ?'':
          getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token!, query: {'feature_title':feature_title,'page_title':page_title,'code_title':code_title,'code_description':code_description,'code_content':code_content,'page_description':page_description,'feature_description':feature_description}
      );
      AddCodeToAnNewPageAndNewFeatureModel userInformation = AddCodeToAnNewPageAndNewFeatureModel.fromJson(data);
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
  Future<Either<Failure, AddCodeToANewProjectModel>> addCodeToaNewProject({required String project_title, required String project_description, required String language, required String feature_title, required String page_title, required String code_title, required String code_description, required String code_content}) async {
    try {
      var data = await apiService.post (
          endPoint: 'code/new-project/add-code',
          token:getIt.get<SharedPreferences>().getString('user') == null ?'':
          getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token!, query: {'project_title':project_title,'project_description':project_description,'language':language,'feature_title':feature_title,'page_title':page_title,'code_title':code_title,'code_description':code_description,'code_content':code_content}
      );
      AddCodeToANewProjectModel userInformation = AddCodeToANewProjectModel.fromJson(data);
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
  Future<Either<Failure, ShowCodeModel>> showCode({required int CodeId}) async {
    try {
      var data = await apiService.get (
          endPoint: 'code/show/$CodeId',
          token: getIt.get<SharedPreferences>().getString('user') == null ?'':
          getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token!,
      );
      ShowCodeModel userInformation = ShowCodeModel.fromJson(data);
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

