// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_base_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteBaseResponseModel _$RemoteBaseResponseModelFromJson(
        Map<String, dynamic> json) =>
    RemoteBaseResponseModel(
      statusCode: json['statusCode'] as int?,
      messageCode: json['messageCode'] as String?,
      message: json['message'] as String?,
      messageDetails: json['messageDetails'] as String?,
      status: json['status'] as int?,
      responseGeneratedTime: json['responseGeneratedTime'] as String?,
      isSuccess: json['isSuccess'] as bool?,
    );

Map<String, dynamic> _$RemoteBaseResponseModelToJson(
        RemoteBaseResponseModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'messageCode': instance.messageCode,
      'message': instance.message,
      'messageDetails': instance.messageDetails,
      'status': instance.status,
      'responseGeneratedTime': instance.responseGeneratedTime,
      'isSuccess': instance.isSuccess,
    };
