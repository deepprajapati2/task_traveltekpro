part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.selectedTab = 0,
    this.selectedNav = 0,
  });

  final int selectedTab;
  final int selectedNav;

  HomeState copyWith({int? selectedTab, int? selectedNav}) {
    return HomeState(
      selectedTab: selectedTab ?? this.selectedTab,
      selectedNav: selectedNav ?? this.selectedNav,
    );
  }

  @override
  List<Object> get props => [selectedTab, selectedNav];
}
