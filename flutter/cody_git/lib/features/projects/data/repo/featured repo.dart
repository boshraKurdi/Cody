
import 'package:cody/features/projects/data/models/feature/create_feature_model.dart';
import 'package:cody/features/projects/data/models/feature/deleate_feature_model.dart';
import 'package:cody/features/projects/data/models/feature/get_features_pages_model.dart';
import 'package:cody/features/projects/data/models/feature/show_features_model.dart';
import 'package:cody/features/projects/data/models/feature/update_feature_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../common wedgit/errors/failures.dart';


abstract class FeaturesRepo
{
  Future<Either<Failure,GetFeaturePageModel>>getAllPages({required int FeatureId});
  Future<Either<Failure,CreateFeatureModel>>createFeature({required String title,required String description,required int project_id,});
  Future<Either<Failure,UpdateFeatureModel>>uodateFeature({required String title,required String description,required int FeatureId,required int project_id,});
  Future<Either<Failure,DelateFeatureModel>>deleateFeature({required int FeatureId});
  Future<Either<Failure,ShowFeatureModel>>showFeatures({required int FeatureId});

}