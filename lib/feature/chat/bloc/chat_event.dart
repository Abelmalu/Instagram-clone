part of 'chat_bloc.dart';

@immutable
sealed class ChatEvent {}

final class ChatInitialEvent extends ChatEvent {}

final class SendButtonPressedEvent extends ChatEvent {
  final String message;

  SendButtonPressedEvent({required this.message});

}
