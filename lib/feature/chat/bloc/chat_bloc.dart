import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:instagramclone/util/app_constants.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/web_socket_channel.dart';
import '../models/message_model.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
   static const wsUrl = 'ws://127.0.0.1:9000/app/buwwgidiaivdzinfonqa';
  late final WebSocketChannel channel;
  ChatBloc() : super(ChatInitialState()) {
      _initializeWebSocket();
    on<ChatInitialEvent>(chatInitialEvent);
    on<SendButtonPressedEvent>(sendButtonPressedEvent);
  }
  

  void _initializeWebSocket() {
    channel = WebSocketChannel.connect(Uri.parse(wsUrl));

    // Send subscription message
    channel.sink.add(jsonEncode({
      "event": "pusher:subscribe",
      "data": {"channel": "test-channel"}
    }));

    // Listen to incoming messages
    channel.stream.listen(
      (message) {
        print('Received: $message');
        final jsonMessage = jsonDecode(message);
        if (jsonMessage['event'] == 'TestEvent') {
          // Add logic to handle received messages
          print('Actual message received: ${jsonMessage['data']}');
        }
        if (jsonMessage['event'] == 'pusher:ping') {
          channel.sink.add(jsonEncode({'event': 'pusher:pong', 'data': {}}));
        }
      },
      onDone: () => print('Connection closed.'),
      onError: (error) => print('Error: $error'),
    );
  }
  //WebsocketConnection

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

  FutureOr<void> sendButtonPressedEvent(
      SendButtonPressedEvent event, Emitter<ChatState> emit) {}
}
