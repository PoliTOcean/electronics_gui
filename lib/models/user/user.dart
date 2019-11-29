import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  final String kind;
  final String localId;
  final String email;
  final String displayName;
  final String idToken;
  final bool registered;
  final String refreshToken;
  final String expiresIn;

  User(
      {@required this.kind,
      @required this.localId,
      @required this.email,
      this.displayName,
      @required this.idToken,
      @required this.registered,
      @required this.refreshToken,
      @required this.expiresIn});

  @override
  List<Object> get props => [
        kind,
        localId,
        email,
        displayName,
        idToken,
        registered,
        refreshToken,
        expiresIn
      ];

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() => """{
      kind: $kind,
      localId: $localId,
      email: $email,
      displayName: $displayName,
      idToken: $idToken,
      registered: $registered,
      refreshToken: $refreshToken,
      expiresIn: $expiresIn}""";
}
