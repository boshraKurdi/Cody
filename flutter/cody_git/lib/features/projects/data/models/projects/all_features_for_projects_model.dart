class AllFeaturesForProjectModel {
  List<Data>? data;

  AllFeaturesForProjectModel({this.data});

  AllFeaturesForProjectModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
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
  List<Pages>? pages;

  Data(
      {this.id,
        this.title,
        this.description,
        this.projectId,
        this.createdAt,
        this.updatedAt,
        this.pages});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    projectId = json['project_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['pages'] != null) {
      pages = <Pages>[];
      json['pages'].forEach((v) {
        pages!.add(new Pages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['project_id'] = this.projectId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pages != null) {
      data['pages'] = this.pages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pages {
  int? id;
  String? title;
  String? description;
  int? featureId;
  String? createdAt;
  String? updatedAt;

  Pages(
      {this.id,
        this.title,
        this.description,
        this.featureId,
        this.createdAt,
        this.updatedAt});

  Pages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    featureId = json['feature_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['feature_id'] = this.featureId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}