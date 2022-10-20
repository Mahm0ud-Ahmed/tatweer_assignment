import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  int? id;
  String? name;
  String? title;
  String? image;
  double? rate;
  bool? isOnline;
  bool? isFavorite;
  
  UserModel({
    this.id,
    this.name,
    this.title,
    this.image,
    this.rate,
    this.isOnline,
    this.isFavorite,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson()=> _$UserModelToJson(this);



}
