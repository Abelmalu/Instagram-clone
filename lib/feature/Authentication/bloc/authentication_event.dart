part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent {}

final class AuthenticationInitialEvent extends AuthenticationEvent {}

final class RegisterButtonPressedEvent extends AuthenticationEvent {
  final String identifier;
  final String fullName;
  final String userName;
  final String password;
  final String passwordConfirmation;

  RegisterButtonPressedEvent({required this.identifier, required this.fullName, required this.userName, required this.password, required this.passwordConfirmation});

  
}
