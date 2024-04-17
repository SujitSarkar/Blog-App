import 'dart:convert';

MessageModel messageModelFromJson(String str) =>
    MessageModel.fromJson(json.decode(str));

class MessageModel {
  final String? message;
  final int? status;

  MessageModel({
    this.message,
    this.status,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        message: json["message"],
        status: json["status"],
      );
}
