part of 'favorite_cubit.dart';

sealed class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteLoading extends FavoriteState {
  const FavoriteLoading();
  @override
  List<Object> get props => [];
}

final class AddFavoriteLoaded extends FavoriteState {
  final ProductInfoModel addFavorite;

  const AddFavoriteLoaded(this.addFavorite);
  @override
  List<Object> get props => [addFavorite];
}

final class RemoveFavoriteLoaded extends FavoriteState {
  final ProductInfoModel removeFavorite;

  const RemoveFavoriteLoaded(this.removeFavorite);
  @override
  List<Object> get props => [removeFavorite];
}

// // final class EmptyList  extends FavoriteState {
//   final ProductInfoModel removeFavorite;

//   const RemoveFavoriteLoaded(this.removeFavorite);
//   @override
//   List<Object> get props => [removeFavorite];
// }
