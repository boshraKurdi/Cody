
import 'package:cody/features/projects/data/models/pages/add_page_model.dart';
import 'package:cody/features/projects/data/models/pages/get_all_code_for_page_model.dart';
import 'package:cody/features/projects/data/models/pages/update_page_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../common wedgit/errors/failures.dart';
import '../models/pages/delate_page_model.dart';
import '../models/pages/show_page_model.dart';


abstract class PagesRepo
{
  Future<Either<Failure,GetAllCodeFoePageModel>>getAllCodeForPage({required int PageId});
  Future<Either<Failure,AddPageModel>>createPage({required String title,required String description,required int feature_id,});
  Future<Either<Failure,UpdatePageModel>>uodatePage({required String title,required String description,required int PageId,required int feature_id,});
  Future<Either<Failure,DelatePageModel>>deleatePage({required int PageId});
  Future<Either<Failure,ShowPageModel>>showPages({required int PageId});

}