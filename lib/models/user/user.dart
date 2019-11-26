import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  @JsonKey(name: '_id')
  final int studentId;
  final String password;
  final String firstName;
  final String lastName;
  final int permissions;

  User(
      {@required this.studentId,
      @required this.password,
      @required this.firstName,
      @required this.lastName,
      @required this.permissions})
      : super([studentId, password, firstName, lastName, permissions]);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
