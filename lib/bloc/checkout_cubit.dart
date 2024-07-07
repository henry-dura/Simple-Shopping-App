import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/product_model.dart';


class CheckOutCubit extends Cubit<List<dynamic>> {
  CheckOutCubit() : super([]);

void addToCheckOut(ProductModel product){
  state.add(product);
  emit(List.from(state));
}
}
