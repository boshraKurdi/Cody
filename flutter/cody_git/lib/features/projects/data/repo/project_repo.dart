
import 'package:cody/features/projects/data/models/projects/create_project_model.dart';
import 'package:cody/features/projects/data/models/projects/deleate_project_model.dart';
import 'package:cody/features/projects/data/models/projects/get_faviorate_model.dart';
import 'package:cody/features/projects/data/models/projects/set_favorate_project.dart';
import 'package:cody/features/projects/data/models/projects/show_all_projects.dart';
import 'package:cody/features/projects/data/models/projects/show_project_detailes_model.dart';
import 'package:cody/features/projects/data/models/projects/update_project_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../common wedgit/errors/failures.dart';
import '../models/projects/all_features_for_projects_model.dart';

abstract class ProjectsRepo
{
  Future<Either<Failure,ShowAllProjectModel>>getAllProjects();
  Future<Either<Failure,AllFeaturesForProjectModel>>getAllFeaturesForProject({required int projectId});
  Future<Either<Failure,CreateProjectModel>>createProject({required String title,required String description,required String language,});
  Future<Either<Failure,UpdateProjectModel>>updateProject({required int projectId,required String title,required String description,required String language});
  Future<Either<Failure,ShowProjectDetailesModel>>showProjects({required int projectId});
  Future<Either<Failure,DeleateProjectModel>>deleateProject({required int projectId});
  Future<Either<Failure,SetFavoraitProjectModel>>addyoFavorateProject({required int projectId});
  Future<Either<Failure,GetFavoraitProjectModel>>getVavorateProject();

}