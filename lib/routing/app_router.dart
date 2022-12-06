import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screens.dart';
import '../providers/app_state_provider.dart';
import '../providers/course_provider.dart';
import '../routing/bottom_nav_bar.dart';

enum AppRoute {
  home,
  course,
  payment,
}

class AppRouter {
  final AppStateProvider appStateProvider;
  final CourseProvider courseProvider;

  AppRouter(
    this.appStateProvider,
    this.courseProvider,
  );

  late final router = GoRouter(
    debugLogDiagnostics: true,
    refreshListenable: appStateProvider,
    initialLocation: '/home',
    routes: <GoRoute>[
      GoRoute(
        name: AppRoute.home.name,
        path: '/:tab',
        builder: (context, state) {
          final tab = int.tryParse(state.params['tab'] ?? '') ?? 0;

          return BottomNavBar(
            currentTab: tab,
            coursePorvider: courseProvider,
          );
        },
        routes: [
          GoRoute(
            name: AppRoute.course.name,
            path: 'course/:id',
            builder: (context, state) {
              final courseId = int.tryParse(state.params['id'] ?? '') ?? 0;
              final course = courseProvider.getCourse(courseId);

              return CourseDetails(course: course);
            },
            routes: [
              GoRoute(
                name: AppRoute.payment.name,
                path: 'payment',
                pageBuilder: (context, state) {
                  final id = int.tryParse(state.params['id'] ?? '') ?? 0;
                  final course = courseProvider.getCourse(id);

                  return MaterialPage(
                    fullscreenDialog: true,
                    child: Payment(course: course),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) {
      return Scaffold(
        body: Center(
          child: Text(
            state.error.toString(),
          ),
        ),
      );
    },
    // TODO: Add Redirect Handler
  );
}
