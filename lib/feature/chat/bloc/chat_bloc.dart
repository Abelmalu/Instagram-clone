import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatInitialState()) {
    on<ChatInitialEvent>(chatInitialEvent);
  }

  FutureOr<void> chatInitialEvent(
      ChatEvent event, Emitter<ChatState> emit) async {
    emit(ChatInitialState());
  }
}
