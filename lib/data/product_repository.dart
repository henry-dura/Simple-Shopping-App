
import 'product_Api_provider.dart';
import 'product_model.dart';

class ProductRepository{

  final ProductApiProvider productApiProvider = ProductApiProvider();

  Future<ProductModel> getAllProducts() async => await productApiProvider.fetchProducts();



}