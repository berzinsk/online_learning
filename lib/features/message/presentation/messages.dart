import 'package:flutter/material.dart';
import 'package:online_learning/features/message/presentation/message_tab_view.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
            child: Text(
              'Notifications',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Flexible(
            child: MessageTabView(),
          ),
        ],
      ),
    );
  }
}
