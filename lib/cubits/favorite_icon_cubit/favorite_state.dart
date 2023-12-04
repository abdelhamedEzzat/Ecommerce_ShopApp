part of 'favorite_cubit.dart';

sealed class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteLoaded extends FavoriteState {
  final ProductInfoModel isFavorite;

  const FavoriteLoaded(this.isFavorite);
  @override
  List<Object> get props => [isFavorite];
}

final class FavoriteLoaded2 extends FavoriteState {
  final ProductInfoModel isFavorite2;

  const FavoriteLoaded2(this.isFavorite2);
  @override
  List<Object> get props => [isFavorite2];
}
