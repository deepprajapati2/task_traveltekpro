import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/constants/app_colors.dart';
import 'presentation/splash_screen/cubit/splash_cubit.dart';
import 'presentation/splash_screen/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashCubit>(
          create: (_) => SplashCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Practical Assessment',
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.white,
          useMaterial3: true,
        ),
        home: const SplashPage(),
      ),
    );
  }
}
