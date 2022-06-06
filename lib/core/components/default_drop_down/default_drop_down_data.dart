import 'package:json_annotation/json_annotation.dart';

part 'default_drop_down_data.g.dart';

@JsonSerializable()
class DropdownItemData {
  final int? id;
  final String name;
  final String? data;
  DropdownItemData({this.id, required this.name, this.data});
  factory DropdownItemData.fromJson(Map<String, dynamic> json) =>
      _$DropdownItemDataFromJson(json);

  Map<String, dynamic> toJson() => _$DropdownItemDataToJson(this);
}
