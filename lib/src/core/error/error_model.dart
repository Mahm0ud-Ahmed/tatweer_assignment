import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'error_model.g.dart';

@JsonSerializable()
class ErrorModel extends Equatable{
  final bool? status;
  final int? code;
  final String message;

  const ErrorModel({
    this.status = false,
    this.code,
    required this.message,
  }
  );

  factory ErrorModel.fromJson(Map<String, dynamic> json) => _$ErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorModelToJson(this);
  
  @override
  List<Object?> get props => [status, message];


}
