import 'package:flutter/material.dart';
import 'package:online_learning/components/messages/message_item.dart';
import 'package:online_learning/model/message.dart';
import 'package:online_learning/resources/data/demo_messages.dart';

class TabMessages extends StatelessWidget {
  TabMessages({Key? key}) : super(key: key);

  final _messages = demoMessages;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        return MessageItem(message: _messages[index]);
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10),
    );
  }
}
