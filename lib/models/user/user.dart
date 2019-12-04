import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  @JsonKey(name: '_id')
  final int userId;
  final String email;
  final String firstName;
  final String lastName;
  final String privileges;

  User(
      {@required this.userId,
      @required this.email,
      @required this.firstName,
      @required this.lastName,
      @required this.privileges});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object> get props => [userId, email, firstName, lastName, privileges];
}
