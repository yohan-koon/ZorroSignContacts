// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_contact.params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateContactUsecaseParams _$CreateContactUsecaseParamsFromJson(
        Map<String, dynamic> json) =>
    CreateContactUsecaseParams(
      data: json['data'] == null
          ? null
          : Contact.fromJson(json['data'] as Map<String, dynamic>),
    )..classIdentifier = json['classIdentifier'] as String?;

Map<String, dynamic> _$CreateContactUsecaseParamsToJson(
        CreateContactUsecaseParams instance) =>
    <String, dynamic>{
      'classIdentifier': instance.classIdentifier,
      'data': instance.data,
    };
