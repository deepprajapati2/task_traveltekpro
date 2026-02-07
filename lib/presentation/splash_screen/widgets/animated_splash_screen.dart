// animated_wave.dart
import 'package:deep_practical_traveltekpro/core/constants/app_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/app_colors.dart';

class AnimatedWave extends StatelessWidget {
  final bool animate;

  const AnimatedWave({required this.animate});

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 1200),
      curve: Curves.easeInOutCubic,
      top: animate ? -(MediaQuery.of(context).size.height * 1) : 0,
      left: 0,
      right: 0,
      child: Container(
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primaryBlue,
              AppColors.primaryIndigo,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: animate ? BorderRadius.vertical(
            bottom: Radius.elliptical(700, 220),
          ) : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AnimatedOpacity(
              opacity: animate ? 0.0 : 1.0,
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeInOut,
              child: SvgPicture.asset(
                AppAssets.splashImgSvg,
                fit: BoxFit.fitWidth,
              ),
            )

          ],
        ),
      ),
    );
  }
}
