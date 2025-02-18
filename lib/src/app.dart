import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'router/router.dart';

class NightingaleApp extends StatefulWidget {
  const NightingaleApp({super.key});

  @override
  State<NightingaleApp> createState() => _NightingaleAppState();
}

class _NightingaleAppState extends State<NightingaleApp> {
  final _rootRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    // Configure the status bar
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return MaterialApp.router(
      title: 'Nightingale UI',
      debugShowCheckedModeBanner: false,
      routerConfig: _rootRouter.config(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF14B8A6)),
        useMaterial3: true,
        textTheme: GoogleFonts.manropeTextTheme(),
        scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Color(0xFF14B8A6), // Recovery Teal/50
            foregroundColor: Colors.white,
            shadowColor: Colors.transparent,
            iconColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
    );
  }
}
