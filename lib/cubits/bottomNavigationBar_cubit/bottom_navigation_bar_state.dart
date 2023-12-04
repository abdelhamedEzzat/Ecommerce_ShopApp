part of 'bottom_navigation_bar_cubit.dart';

sealed class BottomNavigationBarState extends Equatable {
  const BottomNavigationBarState();

  @override
  List<Object> get props => [];
}

final class BottomNavigationBarInitial extends BottomNavigationBarState {}

final class ChangeScreensForBar extends BottomNavigationBarState {
  final int index;

  const ChangeScreensForBar({required this.index});
  @override
  List<Object> get props => [index];
}
