part of 'hot_sales_cubit.dart';

sealed class HotSalesState extends Equatable {
  const HotSalesState();

  @override
  List<Object> get props => [];
}

final class HotSalesInitial extends HotSalesState {}

final class HotSalesLoaded extends HotSalesState {
  final List<ProductInfoModel> hotSales;

  const HotSalesLoaded({required this.hotSales});

  @override
  List<Object> get props => [hotSales];
}
