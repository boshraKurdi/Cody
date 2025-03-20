import 'package:dartz/dartz.dart';
import '../../../../common wedgit/errors/failures.dart';

import '../models/LogInModel.dart';
import '../models/register_model.dart';


abstract class AuthRepo
{
  Future<Either<Failure,RegisterModel>>register({required String email, required String name, required String password,String? media});
  Future<Either<Failure,RegisterModel>>logIn({required String email, required String password});
}