part of 'chat_bloc.dart';

@immutable
sealed class ChatState {}

final class ChatInitialState extends ChatState {}

final class ChatLoadedSuccssState extends ChatState {
  final List<Message> messages;

  ChatLoadedSuccssState({required this.messages});
}


final class SendButtonPressedState extends ChatState{
  
}
