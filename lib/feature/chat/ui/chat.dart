import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagramclone/feature/chat/bloc/chat_bloc.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'dart:convert';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final textController = TextEditingController();
  late final WebSocketChannel channel;

  @override
  void initState() {
    // TODO: implement initState
    // Original onPressed content remains unchanged
    // final wsUrl = 'ws://127.0.0.1:9000/app/buwwgidiaivdzinfonqa';
    // channel = WebSocketChannel.connect(Uri.parse(wsUrl));
    // final subscription = {
    //   "event": "pusher:subscribe",
    //   "data": {"channel": "test-channel"}
    // };
    // channel.sink.add(jsonEncode(subscription));

    // channel.stream.listen(
    //   (message) {
    //     print('Received: $message');
    //     final jsonMessage = jsonDecode(message);
    //     if (jsonMessage['event'] == 'TestEvent') {
    //       print('Actual message received: ${jsonMessage['data']}');
    //     }
    //     if (jsonMessage['event'] == 'pusher:ping') {
    //       channel.sink.add(jsonEncode({'event': 'pusher:pong', 'data': {}}));
    //     }
    //   },
    //   onDone: () => print('Connection closed.'),
    //   onError: (error) => print('Error: $error'),
    // );

    BlocProvider.of<ChatBloc>(context).add(ChatInitialEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatBloc, ChatState>(
        builder: (context, state) {
          if (state is ChatInitialState) {
            return Scaffold(
                appBar: AppBar(title: Text('Chat')),
                body: Center(child: CircularProgressIndicator()));
          } else if (state is ChatLoadedSuccssState) {
            final successState = state as ChatLoadedSuccssState;
            return Scaffold(
              appBar: AppBar(
                title: Text('Chat'),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView(
                        padding: const EdgeInsets.all(16.0),
                        children: successState.messages.map((message) {
                          return Text(message.text);
                        }).toList()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: textController,
                            decoration: InputDecoration(
                              labelText: 'Type your message',
                              border: OutlineInputBorder(),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 16.0),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 24.0),
                          ),
                          onPressed: () {
                            print('fuck');
                            // final smessage = {
                            //   "event":
                            //       "client-TestEvent", // Note the "client-" prefix
                            //   "channel":
                            //       "test-channel", // Use private/presence channel for client events
                            //   "data": {
                            //     "message": textController.text,
                            //     "sender": "flutter_user"
                            //  }
                            // };
                            // channel.sink.add(jsonEncode(smessage));
                          },
                          child: const Text('Send'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Scaffold(
                appBar: AppBar(title: Text('Chat')),
                body: Text(' something went wrong while loading messages'));
          }
        },
        listener: (context, state) {});
  }
}
