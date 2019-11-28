// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'component.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Component _$ComponentFromJson(Map<String, dynamic> json) {
  return Component(
    componentId: json['_id'] as int,
    name: json['name'] as String,
    category: json['category'] as String,
    package: json['package'] as String,
    box: json['box'] as int,
    cell: json['cell'] as int,
    quantity: json['quantity'] as int,
    note: json['note'] as String,
    link: json['link'] as String,
    createdBy: json['created_by'] == null
        ? null
        : User.fromJson(json['created_by'] as Map<String, dynamic>),
    updatedBy: json['updated_by'] == null
        ? null
        : User.fromJson(json['updated_by'] as Map<String, dynamic>),
    createdOn: json['created_on'] == null
        ? null
        : DateTime.parse(json['created_on'] as String),
    updatedOn: json['updated_on'] == null
        ? null
        : DateTime.parse(json['updated_on'] as String),
  );
}

Map<String, dynamic> _$ComponentToJson(Component instance) => <String, dynamic>{
      '_id': instance.componentId,
      'name': instance.name,
      'category': instance.category,
      'package': instance.package,
      'box': instance.box,
      'cell': instance.cell,
      'quantity': instance.quantity,
      'note': instance.note,
      'link': instance.link,
      'created_by': instance.createdBy,
      'created_on': instance.createdOn?.toIso8601String(),
      'updated_by': instance.updatedBy,
      'updated_on': instance.updatedOn?.toIso8601String(),
    };
