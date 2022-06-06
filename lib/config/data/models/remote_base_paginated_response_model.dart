

import 'package:json_annotation/json_annotation.dart';

part 'remote_base_paginated_response_model.g.dart';

@JsonSerializable()
class RemoteBasePaginatedResponseModel {
  final int? pageNo;
  final int? pageSize;
  final int? noOfPages;

  RemoteBasePaginatedResponseModel(
      {this.pageNo, this.pageSize, this.noOfPages});

  factory RemoteBasePaginatedResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RemoteBasePaginatedResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteBasePaginatedResponseModelToJson(this);
}
