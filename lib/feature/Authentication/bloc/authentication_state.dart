part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationState {}

final class AuthenticationInitialState extends AuthenticationState {}

final class RegisterLoadingState extends AuthenticationInitialState{}

final class RegisterSuccessState extends AuthenticationInitialState {}

final class RegisterErrorState   extends AuthenticationInitialState {}
