part of 'counter_cubit.dart';

sealed class CounterState extends Equatable {
  const CounterState();

  @override
  List<Object> get props => [];
}

final class CounterInitial extends CounterState {}

final class CounterIncrementLoaded extends CounterState {
  final int count;

  const CounterIncrementLoaded(this.count);
  @override
  List<Object> get props => [count];
}

final class CounterDecrementLoaded extends CounterState {
  final int count;
  @override
  List<Object> get props => [count];

  const CounterDecrementLoaded(this.count);
}

final class CounterincrementPrice extends CounterState {
  final String finalincrementProduct;

  const CounterincrementPrice(this.finalincrementProduct);

  @override
  List<Object> get props => [finalincrementProduct];
}

final class CounterdecrementPrice extends CounterState {
  final String finaldecrementProduct;

  const CounterdecrementPrice(this.finaldecrementProduct);

  @override
  List<Object> get props => [finaldecrementProduct];
}

final class PriceList extends CounterState {
  final Set<ProductInfoModel> product;

  const PriceList(this.product);

  @override
  List<Object> get props => [product];
}

final class Finance extends CounterState {
  final double totalPriceOfProduct;

  const Finance(this.totalPriceOfProduct);

  @override
  List<Object> get props => [totalPriceOfProduct];
}
