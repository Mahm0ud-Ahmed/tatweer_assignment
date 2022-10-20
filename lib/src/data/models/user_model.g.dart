// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      title: json['title'] as String?,
      image: json['image'] as String?,
      rate: (json['rate'] as num?)?.toDouble(),
      isOnline: json['isOnline'] as bool?,
      isFavorite: json['isFavorite'] as bool?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'title': instance.title,
      'image': instance.image,
      'rate': instance.rate,
      'isOnline': instance.isOnline,
      'isFavorite': instance.isFavorite,
    };
