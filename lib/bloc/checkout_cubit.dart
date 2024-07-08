import 'package:bloc/bloc.dart';

import '../data/product_model.dart';


class CheckOutCubit extends Cubit<List<dynamic>> {
  CheckOutCubit() : super([]);

void addToCheckOut(Item product){
  state.add(product);
  emit(List.from(state));
}

  void removeFromCheckOut(int index){
    state.removeAt(index);
    emit(List.from(state));
  }

  void clearCheckOut(){
    state.clear();
    emit(List.from(state));
  }

}
