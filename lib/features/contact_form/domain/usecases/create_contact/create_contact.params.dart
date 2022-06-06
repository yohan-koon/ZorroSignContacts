import 'package:json_annotation/json_annotation.dart';
import 'package:zorro_sign_contacts/config/features/domain/usecases/usecase.params.dart';
import 'package:zorro_sign_contacts/core/domain/entities/contact.dart';

part 'create_contact.params.g.dart';

@JsonSerializable()
class CreateContactUsecaseParams extends UsecaseParams {
  Contact? data;
  CreateContactUsecaseParams({
    this.data
  });

  factory CreateContactUsecaseParams.fromJson(Map<String, dynamic> json) =>
      _$CreateContactUsecaseParamsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CreateContactUsecaseParamsToJson(this);
}
