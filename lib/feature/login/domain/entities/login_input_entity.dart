import 'package:equatable/equatable.dart';

class LoginInputEntity extends Equatable {
  final String username;
  final String password;

  const LoginInputEntity({
    required this.username,
    required this.password,
  });

  @override
  List<Object> get props => [username, password];
}
