import 'package:get_it/get_it.dart';

import '../../presentation/splash_screen/cubit/splash_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Cubit
  sl.registerFactory(() => SplashCubit());

  // Add more dependencies here as needed
  // Use cases, repositories, data sources, etc.
}