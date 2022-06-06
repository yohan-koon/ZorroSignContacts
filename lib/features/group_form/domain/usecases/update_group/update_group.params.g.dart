// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_group.params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateGroupUsecaseParams _$UpdateGroupUsecaseParamsFromJson(
        Map<String, dynamic> json) =>
    UpdateGroupUsecaseParams(
      data: json['data'] == null
          ? null
          : Group.fromJson(json['data'] as Map<String, dynamic>),
    )..classIdentifier = json['classIdentifier'] as String?;

Map<String, dynamic> _$UpdateGroupUsecaseParamsToJson(
        UpdateGroupUsecaseParams instance) =>
    <String, dynamic>{
      'classIdentifier': instance.classIdentifier,
      'data': instance.data,
    };
