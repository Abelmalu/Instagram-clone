import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:instagramclone/util/app_constants.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../models/message_model.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatInitialState()) {
    on<ChatInitialEvent>(chatInitialEvent);
  }

  FutureOr<void> chatInitialEvent(
      ChatEvent event, Emitter<ChatState> emit) async {
    emit(ChatInitialState());

    try {
      final response = await http.get(Uri.parse(AppConstants.baseUrl));
      print('');

      final result = jsonDecode(response.body);
      print(result);
      // print(result);
      List<Message> fetchedMessages = [];
      for (int i = 0; i < result.length; i++) {
        Message internship = Message.fromJson(result[i]);
        fetchedMessages.add(internship);
      }
      emit(ChatLoadedSuccssState(messages: fetchedMessages));
    } catch (e) {
      print('the error of messages is $e');
    }

    // emit(ChatLoadedSuccssState());
  }
}
