import 'package:cody/common%20wedgit/errors/failures.dart';
import 'package:cody/features/chat/data/models/create_chat_model.dart';
import 'package:cody/features/chat/data/models/create_messages_for_ai_model.dart';
import 'package:cody/features/chat/data/models/create_messages_for_user_model.dart';
import 'package:cody/features/chat/data/models/get_messages_for_chat_model.dart';
import 'package:cody/features/chat/data/models/index_chat_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../common wedgit/api_servieses.dart';
import '../../../../common wedgit/servies_locator.dart';
import '../../../../main.dart';
import '../../../../utls/Shared pref helper/user_cache_helper.dart';
import 'chat_repo.dart';

class ChatRepoImpl implements ChatRepo {
  final ApiService apiService;
  ChatRepoImpl(this.apiService);

  @override
  Future<Either<Failure, CreateChatModel>> createChat({required String title}) async {
    try {
      var data = await apiService.post (
          endPoint: 'chat/create',
          token: getIt.get<SharedPreferences>().getString('user') == null ?'':
          getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token!, query: {'title':title}
      );
      CreateChatModel userInformation = CreateChatModel.fromJson(data);
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
  Future<Either<Failure, CreateMessagesForAiModel>> createMessagesForAiModel({required int chat_id, required String text}) async {
    try {
      var data = await apiService.post (
          endPoint: 'message/create_message_ai',
          token:getIt.get<SharedPreferences>().getString('user') == null ?'':
          getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token!, query: {'chat_id':chat_id,'text':text}
      );
      CreateMessagesForAiModel userInformation = CreateMessagesForAiModel.fromJson(data);
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
  Future<Either<Failure, CreateMessagesForUserModel>> createMessagesForUserModel({required int chat_id, required String text}) async {
    try {
      var data = await apiService.post (
          endPoint: 'message/create_message_user',
          token: getIt.get<SharedPreferences>().getString('user') == null ?'':
          getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token!, query: {'chat_id':chat_id,'text':text}
      );
      CreateMessagesForUserModel userInformation = CreateMessagesForUserModel.fromJson(data);
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
  Future<Either<Failure, GetMessagesForChatModel>> getMessageForChat({required int ChatId}) async {
    try {
      var data = await apiService.get (
          endPoint: 'chat/show/$ChatId',
          token:getIt.get<SharedPreferences>().getString('user') == null ?'':
          getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token!
      );
      GetMessagesForChatModel userInformation = GetMessagesForChatModel.fromJson(data);
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
  Future<Either<Failure, IndexChatModel>> index() async {
    try {
      var data = await apiService.get(
          endPoint: 'chat/index',
          token: getIt.get<SharedPreferences>().getString('user') == null ?'':
          getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token!
      );
      IndexChatModel userInformation = IndexChatModel.fromJson(data);
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

