import 'package:flutter/material.dart';
import '../presentation/home/home_page.dart';
import '../presentation/splash_screen/splash_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String details = '/details';
}

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.home:
      return _fadeSlideRoute(const HomePage(), settings);
    case AppRoutes.details:
      // final args = settings.arguments as DetailsArgs?;
      return _fadeSlideRoute(FlutterLogo(), settings);
    case AppRoutes.splash:
    default:
      return _fadeSlideRoute(const SplashPage(), settings);
  }
}

PageRouteBuilder<dynamic> _fadeSlideRoute(Widget page, RouteSettings settings) {
  return PageRouteBuilder(
    settings: settings,
    transitionDuration: const Duration(milliseconds: 550),
    reverseTransitionDuration: const Duration(milliseconds: 450),
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curved = CurvedAnimation(parent: animation, curve: Curves.easeOutCubic);
      return FadeTransition(
        opacity: curved,
        child: SlideTransition(
          position: Tween<Offset>(begin: const Offset(0.0, 0.08), end: Offset.zero)
              .animate(curved),
          child: child,
        ),
      );
    },
  );
}
