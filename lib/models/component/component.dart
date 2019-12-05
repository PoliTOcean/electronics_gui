import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../user/user.dart';

part 'component.g.dart';

@JsonSerializable()
class Component extends Equatable {
  @JsonKey(name: '_id')
  final String componentId;
  final String name;
  final String category;
  final String package;
  final int box;
  final int cell;
  final int quantity;
  final String note;
  final String link;

  @JsonKey(name: 'created_by')
  final User createdBy;
  @JsonKey(name: 'created_on')
  final DateTime createdOn;
  @JsonKey(name: 'updated_by')
  final User updatedBy;
  @JsonKey(name: 'updated_on')
  final DateTime updatedOn;

  Component(
      {@required this.componentId,
      @required this.name,
      @required this.category,
      @required this.package,
      @required this.box,
      @required this.cell,
      @required this.quantity,
      this.note,
      this.link,
      @required this.createdBy,
      @required this.updatedBy,
      @required this.createdOn,
      @required this.updatedOn});

  @override
  List<Object> get props => [
        componentId,
        name,
        category,
        package,
        box,
        cell,
        quantity,
        note,
        link,
        createdBy,
        updatedBy,
        createdOn,
        updatedOn
      ];

  factory Component.fromJson(Map<String, dynamic> json) =>
      _$ComponentFromJson(json);
  Map<String, dynamic> toJson() => _$ComponentToJson(this);
}
