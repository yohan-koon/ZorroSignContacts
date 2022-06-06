// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contact _$ContactFromJson(Map<String, dynamic> json) => Contact(
      id: json['id'] as int?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      displayName: json['displayName'] as String?,
      jobTitle: json['jobTitle'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      groupName: json['groupName'] as String?,
      groupId: json['groupId'] as int?,
      imageStr: json['imageStr'] as String?,
    );

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'displayName': instance.displayName,
      'jobTitle': instance.jobTitle,
      'phoneNumber': instance.phoneNumber,
      'groupName': instance.groupName,
      'groupId': instance.groupId,
      'imageStr': instance.imageStr,
    };
