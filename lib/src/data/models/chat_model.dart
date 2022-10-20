import 'package:json_annotation/json_annotation.dart';
part 'chat_model.g.dart';
@JsonSerializable()
class ChatModel {

  int? senderId;
  int? receiveId;
  String? message;
  List<String>? data;
  bool? leaveChat;

  ChatModel({
    this.senderId,
    this.receiveId,
    this.message,
    this.leaveChat,
    this.data,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) => _$ChatModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatModelToJson(this);
}
