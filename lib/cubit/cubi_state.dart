part of 'cubi_cubit.dart';

sealed class CubiState extends Equatable {
  const CubiState();

  @override
  List<Object> get props => [];
}

final class CubiInitial extends CubiState {}

final class CubiLoading extends CubiState {}

final class CubiLoaded extends CubiState {}
