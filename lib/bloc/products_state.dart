part of 'products_bloc.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductLoadingState extends ProductsState{}

final class ProductLoadSuccessState extends ProductsState{
  final  products;

  ProductLoadSuccessState(this.products);

}

final class ProductErrorState extends ProductsState{
  final String errorMessage;

  ProductErrorState(this.errorMessage);

}
