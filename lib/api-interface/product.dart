

import 'package:beinex_project/Models/product_model.dart';
import 'package:beinex_project/api/api_exception.dart';
import 'package:beinex_project/api/api_methods.dart';
import 'package:beinex_project/api/api_request.dart';

class ProductInterface {
  static Future<List<ProductDetails>> fetchProduct() async {
    try {
      final response = await ApiRequest.send(
        method: ApiMethod.GET,
        route: '21eb3c42-9516-480f-b28d-d854f4962b80',
      );
      return (response as List)
          .map((e) => ProductDetails.fromJson(e))
          .toList();

    } catch (err) {
      print("fetching article error: $err");
      throw ApiException(err.toString());
    }
  }
}
