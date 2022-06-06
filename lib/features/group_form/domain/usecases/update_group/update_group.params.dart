import 'package:json_annotation/json_annotation.dart';
import 'package:zorro_sign_contacts/config/features/domain/usecases/usecase.params.dart';
import 'package:zorro_sign_contacts/core/domain/entities/group.dart';

part 'update_group.params.g.dart';

@JsonSerializable()
class UpdateGroupUsecaseParams extends UsecaseParams {
  Group? data;
  UpdateGroupUsecaseParams({
    this.data
  });

  factory UpdateGroupUsecaseParams.fromJson(Map<String, dynamic> json) =>
      _$UpdateGroupUsecaseParamsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UpdateGroupUsecaseParamsToJson(this);
}
