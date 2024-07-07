import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/product_model.dart';
import '../data/product_repository.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductRepository _productRepository;
  ProductsBloc(this._productRepository) : super(ProductsInitial()) {
    on<ProductLoadEvent>((event, emit) async{
      emit(ProductLoadingState());
      try {
        final products = await _productRepository.getAllProducts();
        emit(ProductLoadSuccessState(products));


      } catch (e) {
        emit(ProductErrorState(e.toString()));
      }

    });
  }
}
