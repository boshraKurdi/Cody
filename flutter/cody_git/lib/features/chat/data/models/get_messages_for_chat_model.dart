class GetMessagesForChatModel {
  Data? data;

  GetMessagesForChatModel({this.data});

  GetMessagesForChatModel.fromJson(Map<String, dynamic> json) {
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
  int? userId;
  String? createdAt;
  String? updatedAt;
  List<Messages>? messages;

  Data(
      {this.id,
        this.title,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.messages});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['messages'] != null) {
      messages = <Messages>[];
      json['messages'].forEach((v) {
        messages!.add(new Messages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.messages != null) {
      data['messages'] = this.messages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Messages {
  int? id;
  String? text;
  int? chatId;
  int? sender;
  String? createdAt;
  String? updatedAt;

  Messages(
      {this.id,
        this.text,
        this.chatId,
        this.sender,
        this.createdAt,
        this.updatedAt});

  Messages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    chatId = json['chat_id'];
    sender = json['sender'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    data['chat_id'] = this.chatId;
    data['sender'] = this.sender;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}