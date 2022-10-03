import 'package:flutter/material.dart';

import '../model/online_learning_pages.dart';
import '../providers/app_state_provider.dart';
import '../navigation/bottom_nav_bar.dart';
import '../providers/course_provider.dart';
import '../screens/screens.dart';

class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  final AppStateProvider appStateProvider;
  final CourseProvider courseProvider;

  AppRouter({
    required this.appStateProvider,
    required this.courseProvider,
  }) : navigatorKey = GlobalKey<NavigatorState>() {
    appStateProvider.addListener(notifyListeners);
    courseProvider.addListener(notifyListeners);
  }

  @override
  void dispose() {
    appStateProvider.removeListener(notifyListeners);
    courseProvider.removeListener(notifyListeners);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _handlePopPage,
      pages: [
        if (appStateProvider.isInitialized)
          BottomNavBar.page(appStateProvider.getSelectedTab),
        if (courseProvider.selectedIndex != -1) CourseDetails.page(),
      ],
    );
  }

  bool _handlePopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }

    if (route.settings.name == OnlineLearningPages.courseDetails) {
      courseProvider.courseTapped(-1);
    }

    return true;
  }

  @override
  Future<void> setNewRoutePath(configuration) async {}
}
