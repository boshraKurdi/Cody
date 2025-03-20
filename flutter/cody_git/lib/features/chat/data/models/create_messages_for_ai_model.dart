class CreateMessagesForAiModel {
  Data? data;
  String? message;

  CreateMessagesForAiModel({this.data, this.message});

  CreateMessagesForAiModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? text;
  int? sender;
  String? chatId;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.text,
        this.sender,
        this.chatId,
        this.updatedAt,
        this.createdAt,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    sender = json['sender'];
    chatId = json['chat_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['sender'] = this.sender;
    data['chat_id'] = this.chatId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}