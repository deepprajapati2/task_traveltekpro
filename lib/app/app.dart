import 'package:flutter/material.dart';
import '../core/constants/app_theme.dart';
import 'routes.dart';

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      onGenerateRoute: onGenerateRoute,
      initialRoute: AppRoutes.splash,
    );
  }
}
