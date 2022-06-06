// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_group.params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetGroupUsecaseParams _$GetGroupUsecaseParamsFromJson(
        Map<String, dynamic> json) =>
    GetGroupUsecaseParams(
      id: json['id'] as int?,
    )..classIdentifier = json['classIdentifier'] as String?;

Map<String, dynamic> _$GetGroupUsecaseParamsToJson(
        GetGroupUsecaseParams instance) =>
    <String, dynamic>{
      'classIdentifier': instance.classIdentifier,
      'id': instance.id,
    };
