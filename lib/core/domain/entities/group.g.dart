// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Group _$GroupFromJson(Map<String, dynamic> json) => Group(
      id: json['id'] as int?,
      groupName: json['groupName'] as String?,
      description: json['description'] as String?,
      imageStr: json['imageStr'] as String?,
      participants: (json['participants'] as List<dynamic>?)
          ?.map((e) => Contact.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'id': instance.id,
      'groupName': instance.groupName,
      'description': instance.description,
      'imageStr': instance.imageStr,
      'participants': instance.participants,
    };
