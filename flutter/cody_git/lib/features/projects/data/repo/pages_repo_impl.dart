import 'package:cody/common%20wedgit/errors/failures.dart';
import 'package:cody/features/projects/data/models/pages/add_page_model.dart';
import 'package:cody/features/projects/data/models/pages/delate_page_model.dart';
import 'package:cody/features/projects/data/models/pages/get_all_code_for_page_model.dart';
import 'package:cody/features/projects/data/models/pages/show_page_model.dart';
import 'package:cody/features/projects/data/models/pages/update_page_model.dart';
import 'package:cody/features/projects/data/repo/pages_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../common wedgit/api_servieses.dart';
import '../../../../common wedgit/servies_locator.dart';
import '../../../../main.dart';
import '../../../../utls/Shared pref helper/user_cache_helper.dart';

class PagesRepoImpl implements PagesRepo {
  final ApiService apiService;
  PagesRepoImpl(this.apiService);

  @override
  Future<Either<Failure, AddPageModel>> createPage({required String title, required String description, required int feature_id}) async {
    try {
      var data = await apiService.post (
          endPoint: 'page/create',
          token: getIt.get<SharedPreferences>().getString('user') == null ?'':
          getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token!, query: {'title':title,'description':description,'feature_id':feature_id}
      );
      AddPageModel userInformation = AddPageModel.fromJson(data);
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
  Future<Either<Failure, DelatePageModel>> deleatePage({required int PageId}) async {
    try {
      var data = await apiService.delete (
          endPoint: 'page/destroy/$PageId',
          token: getIt.get<SharedPreferences>().getString('user') == null ?'':
          getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token!, query: {}
      );
      DelatePageModel userInformation = DelatePageModel.fromJson(data);
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
  Future<Either<Failure, GetAllCodeFoePageModel>> getAllCodeForPage({required int PageId}) async {
    try {
      var data = await apiService.get (
          endPoint: 'page/codes/$PageId',
          token: getIt.get<SharedPreferences>().getString('user') == null ?'':
          getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token!,
      );
      GetAllCodeFoePageModel userInformation = GetAllCodeFoePageModel.fromJson(data);
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
  Future<Either<Failure, ShowPageModel>> showPages({required int PageId}) async {
    try {
      var data = await apiService.get (
          endPoint: 'page/show/$PageId',
          token: getIt.get<SharedPreferences>().getString('user') == null ?'':
          getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token!,
      );
      ShowPageModel userInformation = ShowPageModel.fromJson(data);
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
  Future<Either<Failure, UpdatePageModel>> uodatePage({required String title, required String description, required int PageId, required int feature_id}) async {
    try {
      var data = await apiService.post (
          endPoint: 'page/update/$PageId',
          token: getIt.get<SharedPreferences>().getString('user') == null ?'':
          getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token!, query: {'title':title,'description':description,'feature_id':feature_id}
      );
      UpdatePageModel userInformation = UpdatePageModel.fromJson(data);
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

