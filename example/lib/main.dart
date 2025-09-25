import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ldk_node/ldk_node.dart' as ldk;
import 'package:ldk_node/src/generated/api/types.dart';
import 'package:ldk_node_example/screens/dashboard_screen.dart';
import 'package:ldk_node_example/screens/onboarding_screen.dart';
import 'package:ldk_node_example/screens/settings_screen.dart';
import 'package:ldk_node_example/services/settings_service.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  // Handle Flutter framework errors gracefully
  FlutterError.onError = (FlutterErrorDetails details) {
    if (kDebugMode) {
      // Only log context menu errors in debug mode, don't crash
      if (details.exception
              .toString()
              .contains('SystemContextMenuController') ||
          details.exception.toString().contains('showWithItems')) {
        debugPrint('Context menu error (ignored): ${details.exception}');
        return;
      }
      FlutterError.presentError(details);
    }
  };

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lightning Wallet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AppStartupScreen(),
      routes: {
        '/dashboard': (context) => const DashboardScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
    );
  }
}

class AppStartupScreen extends StatefulWidget {
  const AppStartupScreen({super.key});

  @override
  State<AppStartupScreen> createState() => _AppStartupScreenState();
}

class _AppStartupScreenState extends State<AppStartupScreen> {
  bool _isLoading = true;
  bool _isFirstRun = true;

  @override
  void initState() {
    super.initState();
    _checkFirstRun();
  }

  Future<void> _checkFirstRun() async {
    try {
      final isFirstRun = await SettingsService.isFirstRun();
      setState(() {
        _isFirstRun = isFirstRun;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isFirstRun = true;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (_isFirstRun) {
      return const OnboardingScreen();
    } else {
      return const DashboardScreen();
    }
  }
}
