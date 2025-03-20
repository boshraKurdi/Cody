class GetFavoraitProjectModel {
  List<Data>? data;

  GetFavoraitProjectModel({this.data});

  GetFavoraitProjectModel.fromJson(Map<String, dynamic> json) {
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
  String? language;
  int? isFavorite;
  int? userId;
  String? createdAt;
  String? updatedAt;
  List<Null>? media;

  Data(
      {this.id,
        this.title,
        this.description,
        this.language,
        this.isFavorite,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.media});

  Data.fromJson(Map<String, dynamic> json) {
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