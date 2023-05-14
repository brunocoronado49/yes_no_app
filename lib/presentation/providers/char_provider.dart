import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/yes_no_get.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messages = [
    Message(text: 'Hola B2', fromwho: FromWho.me),
    Message(text: 'Ya terminaste el juego?', fromwho: FromWho.me)
  ];

  Future<void> sendMessage(String text) async {
    // validando que los mensajes no sean vacios
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromwho: FromWho.me);
    messages.add(newMessage);

    if (text.endsWith('?')) {
      hearReply();
    }

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut
    );
  }

  Future<void> hearReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messages.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  }
}
