import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class Uninitialized extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  //TODO: Using User model instead of a string
  final String user;

  const Authenticated({@required this.user});

  @override
  List<Object> get props => [user];
}

class Unauthenticated extends AuthenticationState {}
