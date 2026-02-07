import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  void selectTab(int index) => emit(state.copyWith(selectedTab: index));

  void selectNav(int index) => emit(state.copyWith(selectedNav: index));
}
