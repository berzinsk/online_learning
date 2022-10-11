import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'navigation/app_router.dart';
import 'providers/app_state_provider.dart';
import 'providers/course_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appStateProvider = AppStateProvider();
  final _courseProvider = CourseProvider();

  late final _appRouter = AppRouter(_appStateProvider, _courseProvider);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => _appStateProvider),
        ChangeNotifierProvider(create: (context) => _courseProvider),
      ],
      child: Consumer(
        builder: (context, value, child) {
          final router = _appRouter.router;

          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Online Learning',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: TextTheme(
                titleLarge: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                titleSmall: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                headlineLarge: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                headlineMedium: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                bodyLarge: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                bodyMedium: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                bodySmall: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
                labelMedium: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                labelSmall: GoogleFonts.poppins(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            routerDelegate: router.routerDelegate,
            routeInformationParser: router.routeInformationParser,
            routeInformationProvider: router.routeInformationProvider,
          );
        },
      ),
    );
  }
}
