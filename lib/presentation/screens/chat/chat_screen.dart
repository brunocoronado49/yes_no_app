import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/char_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/he_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/share/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: const Padding(
          padding: EdgeInsets.all(4),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://pbs.twimg.com/media/D57NJVaX4AEbcj7.jpg'),
          ),
        ),
        title: const Text('Nier B2'),
      ),
      body: const _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView();

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messages.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messages[index];
                  return (message.fromwho == FromWho.her)
                    ? const HeMessageBubble()
                    : MyMessageBubble(message: message);
                },
              )
            ),
            // Caja de texto
            MessageFieldBox(
              onValue: chatProvider.sendMessage,
            )
          ],
        ),
      ),
    );
  }
}
