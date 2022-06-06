import 'package:json_annotation/json_annotation.dart';

part 'contact.g.dart';

@JsonSerializable()
class Contact {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? displayName;
  final String? jobTitle;
  final String? phoneNumber;
  final String? groupName;
  final int? groupId;
  final String? imageStr;
  Contact(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.displayName,
      this.jobTitle,
      this.phoneNumber,
      this.groupName,
      this.groupId,
      this.imageStr});

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);

  Map<String, dynamic> toJson() => _$ContactToJson(this);
}
