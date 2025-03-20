import 'dart:convert';

import 'package:cody/features/auth/data/reop/register_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../common wedgit/api_servieses.dart';
import '../../../../common wedgit/errors/failures.dart';
import '../../../../common wedgit/servies_locator.dart';
import '../../../../main.dart';
import '../../../../utls/Shared pref helper/user_cache_helper.dart';
import '../models/LogInModel.dart';
import '../models/register_model.dart';

class AuthImpl implements AuthRepo {
  final ApiService apiService;
  AuthImpl(this.apiService);
  @override
  Future<Either<Failure, RegisterModel>> register(
      {required String email,
      required String name,
      required String password,String? media}) async {
    try {
      var data = await apiService.post (
          endPoint: 'auth/register',
          query: {'name': name, 'email': email, 'password': password,'media':media}
      );
      RegisterModel userInformation = RegisterModel.fromJson(data);
      saveUserInformationInCach(userInformation);
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

   saveUserInformationInCach(RegisterModel userInformation) {
   //  MyApp.token = userInformation.authorisation!.token!;
    getIt.get<UserCacheHelper>().setUserCache(userInformation);
     RegisterModel user =  getIt.get<UserCacheHelper>().getUserCache('user');
     getIt.registerSingleton<RegisterModel>(user);
  }
  // saveUserInformationInCachlogin(LogInModel userInformation) {
  //   MyApp.token = userInformation.authorisation!.token!;
  //   // getIt.get<UserCacheHelper>().setUserCache(userInformation);
  //   //  RegisterModel user =  getIt.get<UserCacheHelper>().getUserCache('user')!;
  //   //  getIt.registerSingleton<RegisterModel>(user);
  // }

  @override
  Future<Either<Failure, RegisterModel>> logIn({required String email, required String password})async {
    try {
      var data = await apiService.post (
          endPoint: 'auth/login',
          query: { 'email': email, 'password': password}
      );
      RegisterModel userInformation = RegisterModel.fromJson(data);
      saveUserInformationInCach(userInformation);
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


  // @override
  // Future<Either<Failure, UserLogOutModel>> logOut() async {
  //   try {
  //     var data = await apiService.post (
  //         token: getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token.toString(), endPoint: 'auth/logout', query: {}
  //     );
  //     UserLogOutModel logOutResponse= UserLogOutModel.fromJson(data);
  //     //getIt.get<UserCacheHelper>().deleteUserCache('user');
  //   await  getIt.get<SharedPreferences>().clear();
  //     return Right(logOutResponse);
  //   } catch (e) {
  //     if (e is DioException) {
  //       print(e);
  //       return left(ServerFailure.fromDioException(e,{}));
  //     }
  //     print(e);
  //     return left(
  //       ServerFailure(
  //           e.toString(),{}
  //       ),
  //     );
  //   }
  // }
  }

