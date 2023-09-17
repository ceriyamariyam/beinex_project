import 'package:beinex_project/Models/product_model.dart';
import 'package:flutter/material.dart';

import '../api-interface/product.dart';

class ProductProvider with ChangeNotifier {
  List<ProductDetails> productDetails = [];

  late ProductDetails _selectedItems;
  ProductDetails get selectedItems => _selectedItems;

  Future<List<ProductDetails>>? fetch() async {
    productDetails = await ProductInterface.fetchProduct();
    notifyListeners();
    return productDetails;
  }

  void addToSelected(ProductDetails item) {
    _selectedItems = item;
    notifyListeners();
  }
}
