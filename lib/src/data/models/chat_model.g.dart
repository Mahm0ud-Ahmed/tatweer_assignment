// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatModel _$ChatModelFromJson(Map<String, dynamic> json) => ChatModel(
      senderId: json['senderId'] as int?,
      receiveId: json['receiveId'] as int?,
      message: json['message'] as String?,
      leaveChat: json['leaveChat'] as bool?,
      data: (json['data'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ChatModelToJson(ChatModel instance) => <String, dynamic>{
      'senderId': instance.senderId,
      'receiveId': instance.receiveId,
      'message': instance.message,
      'data': instance.data,
      'leaveChat': instance.leaveChat,
    };
