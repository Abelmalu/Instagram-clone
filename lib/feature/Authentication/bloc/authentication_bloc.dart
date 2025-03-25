import 'dart:async';

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

  FutureOr<void> registerButtonPressedEvent(
      RegisterButtonPressedEvent event, Emitter<AuthenticationState> emit) {
    emit(RegisterLoadingState());
    final url = Uri.parse(AppConstants.baseUrl);
  }
}
