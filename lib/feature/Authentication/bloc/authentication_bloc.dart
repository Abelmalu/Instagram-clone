import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:instagramclone/util/app_constants.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart ' as http;
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitialState()) {
    on<AuthenticationInitialEvent>(authenticationInitialEvent);
    on<RegisterButtonPressedEvent>(registerButtonPressedEvent);
  }

  FutureOr<void> authenticationInitialEvent(
      AuthenticationInitialEvent event, Emitter<AuthenticationState> emit) {
    emit(AuthenticationInitialState());
  }

  FutureOr<void> registerButtonPressedEvent(RegisterButtonPressedEvent event,
      Emitter<AuthenticationState> emit) async {
    emit(RegisterLoadingState());
    final url = Uri.parse('${AppConstants.baseUrl}/register');

    try {
      final response = await http.post(url, body: {
        "name": event.fullName,
        "username": event.userName,
        "identifier": event.identifier,
        "password": event.password,
        "password_confirmation": event.passwordConfirmation
      });

      print(jsonDecode(response.body));

      emit(RegisterSuccessState());
    } catch (e) {
      print('the Registration error is $e');
    }
  }
}
