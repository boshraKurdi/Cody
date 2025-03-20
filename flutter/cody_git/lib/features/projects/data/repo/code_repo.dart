
import 'package:cody/features/projects/data/models/code/add_code_to_a_new_project_model.dart';
import 'package:cody/features/projects/data/models/code/add_code_to_an_exested_page_model.dart';
import 'package:cody/features/projects/data/models/code/add_code_to_an_new_page_with_an_existed_feature_model.dart';
import 'package:cody/features/projects/data/models/code/add_code_to_an_newpage_and_new_feature_model.dart';
import 'package:cody/features/projects/data/models/code/show_code_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../common wedgit/errors/failures.dart';



abstract class CodesRepo
{
  Future<Either<Failure,ShowCodeModel>>showCode({required int CodeId});
  // Future<Either<Failure,AddCodeModel>>createCode({required int title,required int description,required int feature_id,});
  // Future<Either<Failure,UpdateCodeModel>>uodateCode({required String title,required String description,required int CodeId,required int feature_id,});
  // Future<Either<Failure,DelateCodeModel>>deleateCode({required int CodeId});
  Future<Either<Failure,AddCodeToANewProjectModel>>addCodeToaNewProject({required String project_title,required String project_description,required String language,required String feature_title,required String page_title,required String code_title,required String code_description,required String code_content,});
  Future<Either<Failure,AddCodeToAnExecitedPageModel>>addCodeToAnExistingPage({required String title,required String code,required String description,required String page_id});
  Future<Either<Failure,AddCodeToAnNewPageAndNewFeatureModel>>addCodeToAnNewPageWithAnNewFeature({required String feature_title,required String page_title,required String code_title,required String code_description,required String code_content,required String page_description,required String feature_description,required int projectId,});
  Future<Either<Failure,AddCodeToAnNewPageWithExistedFeatureModel>>addCodeToAnNewPageWithAnExectingFeature({required String page_title,required String code_title,required String code_description,required String page_description,required String code_content,required int FeatuerId,required int ProjectId,});

}