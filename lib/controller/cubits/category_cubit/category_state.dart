part of 'category_cubit.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

final class CategoryLoading extends CategoryState {}

final class CategoryLoaded extends CategoryState {}

final class UpdateCategoryLoaded extends CategoryState {
  final List<ProductInfoModel> updateProduct;

  UpdateCategoryLoaded({required this.updateProduct});
}
