import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key, required this.onValue});

  final ValueChanged<String> onValue;

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outlinedInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));

    final inputDecoration = InputDecoration(
      hintText: 'End your message with "?"',
      enabledBorder: outlinedInputBorder,
      focusedBorder: outlinedInputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final textValue = textController.value.text;
          textController.clear();
          onValue(textValue);
        },
      ),
    );
    
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        onTapOutside: (evt) {
          focusNode.unfocus();
        },
        focusNode: focusNode,
        controller: textController,
        decoration: inputDecoration,
        onFieldSubmitted: (value) {
          onValue(value);
          textController.clear();
          focusNode.requestFocus();
        },
      ),
    );
  }
}
