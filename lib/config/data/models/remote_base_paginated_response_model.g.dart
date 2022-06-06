// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_base_paginated_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteBasePaginatedResponseModel _$RemoteBasePaginatedResponseModelFromJson(
        Map<String, dynamic> json) =>
    RemoteBasePaginatedResponseModel(
      pageNo: json['pageNo'] as int?,
      pageSize: json['pageSize'] as int?,
      noOfPages: json['noOfPages'] as int?,
    );

Map<String, dynamic> _$RemoteBasePaginatedResponseModelToJson(
        RemoteBasePaginatedResponseModel instance) =>
    <String, dynamic>{
      'pageNo': instance.pageNo,
      'pageSize': instance.pageSize,
      'noOfPages': instance.noOfPages,
    };
