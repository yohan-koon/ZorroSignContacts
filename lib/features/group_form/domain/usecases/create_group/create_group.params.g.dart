// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_group.params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateGroupUsecaseParams _$CreateGroupUsecaseParamsFromJson(
        Map<String, dynamic> json) =>
    CreateGroupUsecaseParams(
      data: json['data'] == null
          ? null
          : Group.fromJson(json['data'] as Map<String, dynamic>),
    )..classIdentifier = json['classIdentifier'] as String?;

Map<String, dynamic> _$CreateGroupUsecaseParamsToJson(
        CreateGroupUsecaseParams instance) =>
    <String, dynamic>{
      'classIdentifier': instance.classIdentifier,
      'data': instance.data,
    };
