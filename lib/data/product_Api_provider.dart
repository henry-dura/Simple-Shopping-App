import 'product_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String _baseUrl = 'https://api.timbu.cloud';

class ProductApiProvider {
  Future<ProductModel> fetchProducts() async {
    final response = await http.get(
      Uri.parse(
          'https://api.timbu.cloud/products?organization_id=7b3c2a122afc48509641b04ad698dc48&reverse_sort=false&page=1&size=12&Appid=HDJ23WQUBKF3ZQ7&Apikey=96f78afdc92b40aeb446888943e9d3a420240705162018701223'),
    );

    if (response.statusCode == 200) {
      return ProductModel.fromJson(json.decode(response.body));

    } else {
      throw Exception('Failed to load weather data: ${response.statusCode}');
    }
  }
}
