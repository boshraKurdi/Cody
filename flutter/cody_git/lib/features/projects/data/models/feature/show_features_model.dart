class ShowFeatureModel {
  Data? data;

  ShowFeatureModel({this.data});

  ShowFeatureModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? description;
  int? projectId;
  String? createdAt;
  String? updatedAt;
  Project? project;

  Data(
      {this.id,
        this.title,
        this.description,
        this.projectId,
        this.createdAt,
        this.updatedAt,
        this.project});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    projectId = json['project_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    project =
    json['project'] != null ? new Project.fromJson(json['project']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['project_id'] = this.projectId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.project != null) {
      data['project'] = this.project!.toJson();
    }
    return data;
  }
}

class Project {
  int? id;
  String? title;
  String? description;
  String? language;
  int? isFavorite;
  int? userId;
  String? createdAt;
  String? updatedAt;

  Project(
      {this.id,
        this.title,
        this.description,
        this.language,
        this.isFavorite,
        this.userId,
        this.createdAt,
        this.updatedAt});

  Project.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    language = json['language'];
    isFavorite = json['is_favorite'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['language'] = this.language;
    data['is_favorite'] = this.isFavorite;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}