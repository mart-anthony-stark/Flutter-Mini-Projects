import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state/api_module/api_service.dart';
import 'package:getx_state/product_module/models/product_model.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await ApiService.fetchProducts();
      if (products != null) {
        productList.assignAll(products);
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
