import 'package:json_annotation/json_annotation.dart';
import 'package:zorro_sign_contacts/config/features/domain/usecases/usecase.params.dart';
import 'package:zorro_sign_contacts/core/domain/entities/group.dart';

part 'create_group.params.g.dart';

@JsonSerializable()
class CreateGroupUsecaseParams extends UsecaseParams {
  Group? data;
  CreateGroupUsecaseParams({
    this.data
  });

  factory CreateGroupUsecaseParams.fromJson(Map<String, dynamic> json) =>
      _$CreateGroupUsecaseParamsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CreateGroupUsecaseParamsToJson(this);
}
