part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent {}

final class AuthenticationInitialEvent extends AuthenticationEvent{}

final class RegisterButtonPressedEvent extends AuthenticationEvent{}
