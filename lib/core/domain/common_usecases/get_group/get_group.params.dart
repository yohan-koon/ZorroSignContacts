import 'package:json_annotation/json_annotation.dart';
import 'package:zorro_sign_contacts/config/features/domain/usecases/usecase.params.dart';

part 'get_group.params.g.dart';

@JsonSerializable()
class GetGroupUsecaseParams extends UsecaseParams {
  int? id;
  GetGroupUsecaseParams({
    this.id
  });

  factory GetGroupUsecaseParams.fromJson(Map<String, dynamic> json) =>
      _$GetGroupUsecaseParamsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GetGroupUsecaseParamsToJson(this);
}
