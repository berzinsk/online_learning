import 'package:flutter/material.dart';
import 'package:online_learning/components/messages/tab_messages.dart';

class MessageTabView extends StatefulWidget {
  MessageTabView({Key? key}) : super(key: key);

  @override
  State<MessageTabView> createState() => _MessageTabViewState();
}

class _MessageTabViewState extends State<MessageTabView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _tabs = [
    Tab(child: Text('messages')),
    Tab(child: Text('notifications')),
  ];

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          isScrollable: false,
          tabs: _tabs,
          controller: _tabController,
          labelColor: Colors.black,
          indicatorSize: TabBarIndicatorSize.label,
        ),
        Flexible(
          child: TabBarView(
            controller: _tabController,
            children: [
              TabMessages(),
              const Center(
                child: Text('Tab 2'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
