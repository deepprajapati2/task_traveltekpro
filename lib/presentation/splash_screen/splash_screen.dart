// splash_page.dart
import 'package:deep_practical_traveltekpro/core/constants/app_assets.dart';
import 'package:deep_practical_traveltekpro/presentation/splash_screen/widgets/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants/app_colors.dart';
import '../home/home_page.dart';
import 'cubit/splash_cubit.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late SplashCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<SplashCubit>();
    cubit.startAnimation();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 800),
          pageBuilder: (_, __, ___) => const HomePage(),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocBuilder<SplashCubit, bool>(
        builder: (context, animate) {
          return Stack(
            alignment: Alignment.center,
            children: [
              AnimatedWave(animate: animate),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.55,
                child: SplashLogo(animate: animate),
              ),
            ],
          );
        },
      ),
    );
  }
}
// splash_logo.dart
class SplashLogo extends StatelessWidget {
  final bool animate;

  const SplashLogo({required this.animate});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: animate ? 1 : 0,
      duration: const Duration(milliseconds: 800),
      child: AnimatedScale(
        scale: animate ? 1 : 0.8,
        duration: const Duration(milliseconds: 800),
        child: SvgPicture.asset(AppAssets.appLogoSvg)
      ),
    );
  }
}
