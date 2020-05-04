import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ProductProvider with ChangeNotifier {
  String brand = '';
  String type = '';
  int selectedProductIndex;
  bool isLoading = false;

  ProductProvider() {
    print("ProductProvider created");
  }
  List<dynamic> productResponse;

  void toogleIsLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> getProductByType(String type) async {
    this.brand = '';
    this.type = type;
    Response response = await Dio().get(
        'http://makeup-api.herokuapp.com/api/v1/products.json?product_type=$type');
    productResponse = response.data;
  }

  Future<void> getProductByBrand(String brand) async {
    this.type = '';
    this.brand = brand;
    Response response = await Dio().get(
        'http://makeup-api.herokuapp.com/api/v1/products.json?brand=$brand');
    productResponse = response.data;
  }
}
