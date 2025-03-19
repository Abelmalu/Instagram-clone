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
  List<Message> fetchedMessages = [];

  ChatBloc() : super(ChatInitialState()) {
    _initializeWebSocket();
    on<ChatInitialEvent>(chatInitialEvent);
    on<SendButtonPressedEvent>(sendButtonPressedEvent);
    on<NewMessageReceivedEvent>(newMessageReceivedEvent);
  }

  void _initializeWebSocket() {
    channel = WebSocketChannel.connect(Uri.parse(wsUrl));

    // Send subscription message
    channel.sink.add(jsonEncode({
      "event": "pusher:subscribe",
      "data": {"channel": "chat"}
    }));

    // Listen to incoming messages
    channel.stream.listen(
      (message) {
        final jsonMessage = jsonDecode(message);
        print('Received: ${jsonMessage['data']}');
        final value = jsonDecode(jsonMessage['data']);

        print('the value is ${value}');
        final mapye = value[0] as Map<String, dynamic>;
          print('the map is ${mapye}');


        final newMessage = Message.fromJson(mapye);

        add(NewMessageReceivedEvent(message: newMessage));
        if (jsonMessage['event'] == 'GotMessage') {
          // Add logic to handle received messages

          print('Actual message received');
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
      final response =
          await http.get(Uri.parse('${AppConstants.baseUrl}/chatmessages'));
      print('');

      final result = jsonDecode(response.body);
      print(result);
      // print(result);

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
      SendButtonPressedEvent event, Emitter<ChatState> emit) async {
    print(event.message);
    final response = await http.post(
        Uri.parse('${AppConstants.baseUrl}/message'),
        body: {"text": event.message});
    final result = jsonDecode(response.body);
    print(result);
  }

  FutureOr<void> newMessageReceivedEvent(
      NewMessageReceivedEvent event, Emitter<ChatState> emit) {
    fetchedMessages.add(event.message);
    emit(ChatLoadedSuccssState(messages: fetchedMessages));
  }
}
