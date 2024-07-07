part of 'products_bloc.dart';

@immutable
sealed class ProductsEvent {}

class ProductLoadEvent extends ProductsEvent{}
