import 'package:json_annotation/json_annotation.dart';
import 'package:zorro_sign_contacts/core/domain/entities/contact.dart';

part 'group.g.dart';

@JsonSerializable()
class Group {
  final int? id;
  final String? groupName;
  final String? description;
  final String? imageStr;
  final List<Contact>? participants;
  Group({this.id, this.groupName, this.description, this.imageStr, this.participants});

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

  Map<String, dynamic> toJson() => _$GroupToJson(this);
}
