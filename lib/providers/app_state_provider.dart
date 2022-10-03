import 'package:flutter/material.dart';

enum OnlineLearninTabs {
  home,
  course,
  search,
  message,
  account,
}

class AppStateProvider extends ChangeNotifier {
  // TODO: Change this to be dynamic once Onboarding screens are completed
  final bool _initialized = true;

  int _selectedTab = OnlineLearninTabs.home.index;

  bool get isInitialized => _initialized;
  int get getSelectedTab => _selectedTab;

  void goToTab(index) {
    _selectedTab = index;
    notifyListeners();
  }
}
