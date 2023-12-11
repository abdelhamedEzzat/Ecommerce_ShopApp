part of 'current_location_cubit.dart';

sealed class CurrentLocationState extends Equatable {
  const CurrentLocationState();

  @override
  List<Object> get props => [];
}

final class CurrentLocationInitial extends CurrentLocationState {}

final class CurrentLocationLoading extends CurrentLocationState {}

final class CurrentLocationLoaded extends CurrentLocationState {
  final Position position;

  const CurrentLocationLoaded({required this.position});

  @override
  List<Object> get props => [position];
}

final class CurrentLocationError extends CurrentLocationState {}
